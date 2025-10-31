import 'dart:io';
import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/errors/app_exception.dart';
import '../services/supabase_service.dart';
import '../shared/models/post_model.dart';
import '../shared/models/user_model.dart';

class PostService {
  final SupabaseService _supabaseService;

  PostService(this._supabaseService);

  // Create a new post
  Future<Post> createPost({
    required String userId,
    required String content,
    List<FileMedia>? media,
    PostVisibility visibility = PostVisibility.public,
    String? location,
    List<String>? tags,
  }) async {
    try {
      final postId = _generateId();

      // Upload media files first
      List<Media> uploadedMedia = [];
      if (media != null && media.isNotEmpty) {
        uploadedMedia = await _uploadMedia(postId, media);
      }

      // Create post data
      final postData = {
        'id': postId,
        'user_id': userId,
        'content': content.trim(),
        'visibility': visibility.name,
        'location': location,
        'tags': tags ?? [],
        'likes_count': 0,
        'comments_count': 0,
        'shares_count': 0,
        'status': PostStatus.published.name,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      };

      // Insert post
      final response = await _supabaseService.client
          .from('posts')
          .insert(postData)
          .select()
          .single();

      // Insert media records
      if (uploadedMedia.isNotEmpty) {
        final mediaData = uploadedMedia.map((m) => m.toDatabaseJson()).toList();
        await _supabaseService.client.from('media').insert(mediaData);
      }

      // Get user info
      final userResponse = await _supabaseService.client
          .from('profiles')
          .select('id, username, display_name, avatar_url, is_verified')
          .eq('id', userId)
          .single();

      final userInfo = UserPostInfo(
        id: userResponse['id'],
        username: userResponse['username'] ?? '',
        displayName: userResponse['display_name'] ?? '',
        avatarUrl: userResponse['avatar_url'],
        isVerified: userResponse['is_verified'] ?? false,
      );

      return Post(
        id: response['id'],
        userId: response['user_id'],
        content: response['content'],
        createdAt: DateTime.parse(response['created_at']),
        updatedAt: DateTime.parse(response['updated_at']),
        media: uploadedMedia,
        likesCount: response['likes_count'] ?? 0,
        commentsCount: response['comments_count'] ?? 0,
        sharesCount: response['shares_count'] ?? 0,
        visibility: visibility,
        location: response['location'],
        tags: response['tags']?.cast<String>(),
        status: PostStatus.published,
        user: userInfo,
      );
    } catch (e) {
      throw AppException('Failed to create post: ${e.toString()}');
    }
  }

  // Get posts for feed
  Future<List<FeedPost>> getFeedPosts({
    required String userId,
    int limit = 20,
    String? lastPostId,
  }) async {
    try {
      var query = _supabaseService.client
          .from('posts')
          .select('''
            *,
            profiles!posts_user_id_fkey(
              id,
              username,
              display_name,
              avatar_url,
              is_verified
            )
          ''')
          .eq('status', PostStatus.published.name)
          .eq('visibility', PostVisibility.public.name)
          .order('created_at', ascending: false)
          .limit(limit);

      if (lastPostId != null) {
        query = query.lt('created_at',
          _getPostCreatedAt(lastPostId) ?? DateTime.now().toIso8601String()
        );
      }

      final response = await query;

      final feedPosts = <FeedPost>[];
      for (final postData in response) {
        final feedPost = await _createFeedPostFromResponse(postData);
        if (feedPost != null) {
          feedPosts.add(feedPost);
        }
      }

      return feedPosts;
    } catch (e) {
      throw AppException('Failed to load feed posts: ${e.toString()}');
    }
  }

  // Get user's posts
  Future<List<Post>> getUserPosts({
    required String userId,
    int limit = 20,
    String? lastPostId,
  }) async {
    try {
      var query = _supabaseService.client
          .from('posts')
          .select('*')
          .eq('user_id', userId)
          .eq('status', PostStatus.published.name)
          .order('created_at', ascending: false)
          .limit(limit);

      if (lastPostId != null) {
        query = query.lt('created_at',
          _getPostCreatedAt(lastPostId) ?? DateTime.now().toIso8601String()
        );
      }

      final response = await query;

      final posts = <Post>[];
      for (final postData in response) {
        final post = await _createPostFromResponse(postData);
        if (post != null) {
          posts.add(post);
        }
      }

      return posts;
    } catch (e) {
      throw AppException('Failed to load user posts: ${e.toString()}');
    }
  }

  // Get post by ID
  Future<Post?> getPostById(String postId) async {
    try {
      final response = await _supabaseService.client
          .from('posts')
          .select('''
            *,
            profiles!posts_user_id_fkey(
              id,
              username,
              display_name,
              avatar_url,
              is_verified
            )
          ''')
          .eq('id', postId)
          .single();

      return await _createPostFromResponse(response);
    } catch (e) {
      if (e is PostgrestException && e.code == 'PGRST116') {
        return null; // Post not found
      }
      throw AppException('Failed to load post: ${e.toString()}');
    }
  }

  // Like/Unlike post
  Future<bool> togglePostLike({
    required String postId,
    required String userId,
  }) async {
    try {
      // Check if already liked
      final existingLike = await _supabaseService.client
          .from('post_interactions')
          .select()
          .eq('post_id', postId)
          .eq('user_id', userId)
          .eq('type', PostInteractionType.like.name)
          .maybeSingle();

      if (existingLike != null) {
        // Unlike
        await _supabaseService.client
            .from('post_interactions')
            .delete()
            .eq('post_id', postId)
            .eq('user_id', userId)
            .eq('type', PostInteractionType.like.name);

        await _supabaseService.client.rpc('decrement_post_likes', params: {
          'post_id': postId,
        });
        return false;
      } else {
        // Like
        await _supabaseService.client.from('post_interactions').insert({
          'id': _generateId(),
          'post_id': postId,
          'user_id': userId,
          'type': PostInteractionType.like.name,
          'created_at': DateTime.now().toIso8601String(),
        });

        await _supabaseService.client.rpc('increment_post_likes', params: {
          'post_id': postId,
        });
        return true;
      }
    } catch (e) {
      throw AppException('Failed to toggle like: ${e.toString()}');
    }
  }

  // Add comment to post
  Future<PostInteraction> addComment({
    required String postId,
    required String userId,
    required String comment,
  }) async {
    try {
      final commentId = _generateId();
      final interactionData = {
        'id': commentId,
        'post_id': postId,
        'user_id': userId,
        'type': PostInteractionType.comment.name,
        'comment': comment.trim(),
        'created_at': DateTime.now().toIso8601String(),
      };

      final response = await _supabaseService.client
          .from('post_interactions')
          .insert(interactionData)
          .select()
          .single();

      await _supabaseService.client.rpc('increment_post_comments', params: {
        'post_id': postId,
      });

      return PostInteraction(
        id: response['id'],
        postId: response['post_id'],
        userId: response['user_id'],
        type: PostInteractionType.comment,
        createdAt: DateTime.parse(response['created_at']),
        comment: response['comment'],
      );
    } catch (e) {
      throw AppException('Failed to add comment: ${e.toString()}');
    }
  }

  // Get post comments
  Future<List<PostInteraction>> getPostComments({
    required String postId,
    int limit = 20,
    String? lastCommentId,
  }) async {
    try {
      var query = _supabaseService.client
          .from('post_interactions')
          .select('''
            *,
            profiles!post_interactions_user_id_fkey(
              id,
              username,
              display_name,
              avatar_url
            )
          ''')
          .eq('post_id', postId)
          .eq('type', PostInteractionType.comment.name)
          .order('created_at', ascending: false)
          .limit(limit);

      if (lastCommentId != null) {
        query = query.lt('created_at',
          _getCommentCreatedAt(lastCommentId) ?? DateTime.now().toIso8601String()
        );
      }

      final response = await query;

      return response.map((data) => PostInteraction(
        id: data['id'],
        postId: data['post_id'],
        userId: data['user_id'],
        type: PostInteractionType.comment,
        createdAt: DateTime.parse(data['created_at']),
        comment: data['comment'],
      )).toList();
    } catch (e) {
      throw AppException('Failed to load comments: ${e.toString()}');
    }
  }

  // Share post
  Future<bool> sharePost({
    required String postId,
    required String userId,
  }) async {
    try {
      await _supabaseService.client.from('post_interactions').insert({
        'id': _generateId(),
        'post_id': postId,
        'user_id': userId,
        'type': PostInteractionType.share.name,
        'created_at': DateTime.now().toIso8601String(),
      });

      await _supabaseService.client.rpc('increment_post_shares', params: {
        'post_id': postId,
      });

      return true;
    } catch (e) {
      throw AppException('Failed to share post: ${e.toString()}');
    }
  }

  // Bookmark/Unbookmark post
  Future<bool> togglePostBookmark({
    required String postId,
    required String userId,
  }) async {
    try {
      final existingBookmark = await _supabaseService.client
          .from('post_interactions')
          .select()
          .eq('post_id', postId)
          .eq('user_id', userId)
          .eq('type', PostInteractionType.bookmark.name)
          .maybeSingle();

      if (existingBookmark != null) {
        // Remove bookmark
        await _supabaseService.client
            .from('post_interactions')
            .delete()
            .eq('post_id', postId)
            .eq('user_id', userId)
            .eq('type', PostInteractionType.bookmark.name);
        return false;
      } else {
        // Add bookmark
        await _supabaseService.client.from('post_interactions').insert({
          'id': _generateId(),
          'post_id': postId,
          'user_id': userId,
          'type': PostInteractionType.bookmark.name,
          'created_at': DateTime.now().toIso8601String(),
        });
        return true;
      }
    } catch (e) {
      throw AppException('Failed to toggle bookmark: ${e.toString()}');
    }
  }

  // Delete post
  Future<bool> deletePost({
    required String postId,
    required String userId,
  }) async {
    try {
      // Verify ownership
      final post = await getPostById(postId);
      if (post == null || post.userId != userId) {
        throw AppException('Post not found or access denied');
      }

      // Soft delete by updating status
      await _supabaseService.client
          .from('posts')
          .update({'status': PostStatus.deleted.name})
          .eq('id', postId)
          .eq('user_id', userId);

      return true;
    } catch (e) {
      throw AppException('Failed to delete post: ${e.toString()}');
    }
  }

  // Get post statistics
  Future<PostStats> getUserPostStats(String userId) async {
    try {
      final response = await _supabaseService.client
          .rpc('get_user_post_stats', params: {'user_id': userId});

      return PostStats(
        totalPosts: response['total_posts'] ?? 0,
        totalLikes: response['total_likes'] ?? 0,
        totalComments: response['total_comments'] ?? 0,
        totalShares: response['total_shares'] ?? 0,
        thisWeekPosts: response['this_week_posts'] ?? 0,
        thisMonthPosts: response['this_month_posts'] ?? 0,
        thisYearPosts: response['this_year_posts'] ?? 0,
      );
    } catch (e) {
      throw AppException('Failed to load post stats: ${e.toString()}');
    }
  }

  // Upload media files
  Future<List<Media>> _uploadMedia(String postId, List<FileMedia> mediaFiles) async {
    final uploadedMedia = <Media>[];

    for (int i = 0; i < mediaFiles.length; i++) {
      final fileMedia = mediaFiles[i];
      try {
        // Upload original file
        final fileName = 'posts/$postId/${fileMedia.id}_${fileMedia.fileName ?? 'media'}';
        final bytes = await fileMedia.file.readAsBytes();
        final publicUrl = await _supabaseService.uploadFile(
          'media',
          fileName,
          bytes,
          fileMedia.type.name,
        );

        // Generate thumbnail for videos
        String thumbnailUrl = '';
        if (fileMedia.isVideo) {
          final thumbnailFileName = 'posts/$postId/${fileMedia.id}_thumb.jpg';
          final thumbnailBytes = await _generateVideoThumbnail(fileMedia.file);
          thumbnailUrl = await _supabaseService.uploadFile(
            'media',
            thumbnailFileName,
            thumbnailBytes,
            'image',
          );
        }

        // Get file dimensions
        final dimensions = await _getMediaDimensions(fileMedia.file);

        uploadedMedia.add(Media(
          id: fileMedia.id,
          postId: postId,
          type: fileMedia.type,
          url: publicUrl,
          thumbnailUrl: thumbnailUrl.isNotEmpty ? thumbnailUrl : publicUrl,
          width: dimensions['width'] ?? 0,
          height: dimensions['height'] ?? 0,
          sizeBytes: fileMedia.fileSize ?? 0,
          duration: fileMedia.isVideo ? await _getVideoDuration(fileMedia.file) : 0,
          orderIndex: i,
          caption: fileMedia.caption,
          status: MediaStatus.processed,
        ));
      } catch (e) {
        // Log error but continue with other files
        print('Failed to upload media ${fileMedia.id}: $e');
      }
    }

    return uploadedMedia;
  }

  // Helper methods
  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString() +
        (DateTime.now().microsecond % 1000).toString().padLeft(3, '0');
  }

  String? _getPostCreatedAt(String postId) {
    // Cache this or fetch from database in real implementation
    return null;
  }

  String? _getCommentCreatedAt(String commentId) {
    // Cache this or fetch from database in real implementation
    return null;
  }

  Future<FeedPost?> _createFeedPostFromResponse(Map<String, dynamic> data) async {
    try {
      final postData = data;
      final profileData = data['profiles'];

      final user = UserPostInfo(
        id: profileData['id'],
        username: profileData['username'] ?? '',
        displayName: profileData['display_name'] ?? '',
        avatarUrl: profileData['avatar_url'],
        isVerified: profileData['is_verified'] ?? false,
      );

      // Load media for this post
      final mediaResponse = await _supabaseService.client
          .from('media')
          .select('*')
          .eq('post_id', postData['id'])
          .order('order_index');

      final media = mediaResponse.map((m) => Media.fromDatabaseJson(m)).toList();

      final post = Post(
        id: postData['id'],
        userId: postData['user_id'],
        content: postData['content'],
        createdAt: DateTime.parse(postData['created_at']),
        updatedAt: DateTime.parse(postData['updated_at']),
        media: media,
        likesCount: postData['likes_count'] ?? 0,
        commentsCount: postData['comments_count'] ?? 0,
        sharesCount: postData['shares_count'] ?? 0,
        visibility: PostVisibility.values.firstWhere(
          (v) => v.name == postData['visibility'],
          orElse: () => PostVisibility.public,
        ),
        location: postData['location'],
        tags: postData['tags']?.cast<String>(),
        status: PostStatus.published,
        user: user,
      );

      return FeedPost(post: post, user: user);
    } catch (e) {
      print('Failed to create feed post: $e');
      return null;
    }
  }

  Future<Post?> _createPostFromResponse(Map<String, dynamic> data) async {
    try {
      // Load media for this post
      final mediaResponse = await _supabaseService.client
          .from('media')
          .select('*')
          .eq('post_id', data['id'])
          .order('order_index');

      final media = mediaResponse.map((m) => Media.fromDatabaseJson(m)).toList();

      UserPostInfo? user;
      if (data['profiles'] != null) {
        final profileData = data['profiles'];
        user = UserPostInfo(
          id: profileData['id'],
          username: profileData['username'] ?? '',
          displayName: profileData['display_name'] ?? '',
          avatarUrl: profileData['avatar_url'],
          isVerified: profileData['is_verified'] ?? false,
        );
      }

      return Post(
        id: data['id'],
        userId: data['user_id'],
        content: data['content'],
        createdAt: DateTime.parse(data['created_at']),
        updatedAt: DateTime.parse(data['updated_at']),
        media: media,
        likesCount: data['likes_count'] ?? 0,
        commentsCount: data['comments_count'] ?? 0,
        sharesCount: data['shares_count'] ?? 0,
        visibility: PostVisibility.values.firstWhere(
          (v) => v.name == data['visibility'],
          orElse: () => PostVisibility.public,
        ),
        location: data['location'],
        tags: data['tags']?.cast<String>(),
        status: PostStatus.published,
        user: user,
      );
    } catch (e) {
      print('Failed to create post: $e');
      return null;
    }
  }

  Future<Map<String, int>> _getMediaDimensions(dynamic file) async {
    // In a real implementation, use image package to get dimensions
    return {'width': 1080, 'height': 1080};
  }

  Future<int> _getVideoDuration(dynamic file) async {
    // In a real implementation, use video_player package to get duration
    return 30; // seconds
  }

  Future<Uint8List> _generateVideoThumbnail(dynamic file) async {
    // In a real implementation, use video_thumbnail package
    // Return a placeholder thumbnail
    return Uint8List.fromList([]);
  }
}