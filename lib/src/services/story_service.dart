import 'dart:io';
import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/errors/app_exception.dart';
import '../services/supabase_service.dart';
import '../shared/models/story_model.dart';
import '../shared/models/user_model.dart';

class StoryService {
  final SupabaseService _supabaseService;

  StoryService(this._supabaseService);

  // Create a new story
  Future<Story> createStory({
    required String userId,
    required dynamic mediaFile, // Will be File from dart:io
    required MediaType mediaType,
    String? caption,
    String? location,
    List<String>? mentions,
    List<String>? hashtags,
  }) async {
    try {
      final storyId = _generateId();
      final expiresAt = DateTime.now().add(const Duration(hours: 24));

      // Upload media file
      final mediaUrl = await _uploadStoryMedia(storyId, mediaFile, mediaType);

      // Generate thumbnail for videos
      String thumbnailUrl = '';
      if (mediaType == MediaType.video) {
        thumbnailUrl = await _generateVideoThumbnail(storyId, mediaFile);
      }

      // Create story data
      final storyData = {
        'id': storyId,
        'user_id': userId,
        'media_url': mediaUrl,
        'media_type': mediaType.name,
        'media_duration': mediaType == MediaType.video ? await _getVideoDuration(mediaFile) : 0,
        'thumbnail_url': thumbnailUrl,
        'created_at': DateTime.now().toIso8601String(),
        'expires_at': expiresAt.toIso8601String(),
        'views_count': 0,
        'replies_count': 0,
        'reactions_count': 0,
        'type': StoryType.photo.name,
        'caption': caption,
        'location': location,
        'mentions': mentions ?? [],
        'hashtags': hashtags ?? [],
        'status': StoryStatus.active.name,
      };

      // Insert story
      final response = await _supabaseService.client
          .from('stories')
          .insert(storyData)
          .select()
          .single();

      // Get user info
      final userResponse = await _supabaseService.client
          .from('profiles')
          .select('id, username, display_name, avatar_url, is_verified')
          .eq('id', userId)
          .single();

      final userInfo = UserStoryInfo(
        id: userResponse['id'],
        username: userResponse['username'] ?? '',
        displayName: userResponse['display_name'] ?? '',
        avatarUrl: userResponse['avatar_url'],
        isVerified: userResponse['is_verified'] ?? false,
        lastStoryAt: DateTime.now(),
        storiesCount: 1,
      );

      return Story(
        id: response['id'],
        userId: response['user_id'],
        media: StoryMedia(
          url: response['media_url'],
          type: MediaType.values.firstWhere(
            (v) => v.name == response['media_type'],
            orElse: () => MediaType.image,
          ),
          duration: response['media_duration'] ?? 0,
          thumbnailUrl: response['thumbnail_url'] ?? '',
        ),
        createdAt: DateTime.parse(response['created_at']),
        expiresAt: DateTime.parse(response['expires_at']),
        viewsCount: response['views_count'] ?? 0,
        repliesCount: response['replies_count'] ?? 0,
        reactionsCount: response['reactions_count'] ?? 0,
        type: StoryType.photo,
        caption: response['caption'],
        location: response['location'],
        mentions: response['mentions']?.cast<String>() ?? [],
        hashtags: response['hashtags']?.cast<String>() ?? [],
        status: StoryStatus.active,
        user: userInfo,
      );
    } catch (e) {
      throw AppException('Failed to create story: ${e.toString()}');
    }
  }

  // Get active stories from followed users
  Future<List<StoryBundle>> getFollowingStories(String userId) async {
    try {
      // Get stories from followed users
      final response = await _supabaseService.client.rpc('get_following_stories', params: {
        'user_id': userId,
      });

      final storyBundles = <StoryBundle>[];

      // Group stories by user
      final Map<String, List<Story>> storiesByUser = {};
      final Map<String, UserStoryInfo> userInfos = {};

      for (final data in response) {
        final userId = data['user_id'] as String;

        // Create user info if not exists
        if (!userInfos.containsKey(userId)) {
          userInfos[userId] = UserStoryInfo(
            id: userId,
            username: data['username'] ?? '',
            displayName: data['display_name'] ?? '',
            avatarUrl: data['avatar_url'],
            isVerified: data['is_verified'] ?? false,
            isFollowing: true,
            lastStoryAt: DateTime.parse(data['story_created_at']),
            storiesCount: 1,
          );
        } else {
          final userInfo = userInfos[userId]!;
          userInfos[userId] = userInfo.copyWith(
            storiesCount: userInfo.storiesCount + 1,
            lastStoryAt: DateTime.parse(data['story_created_at']),
          );
        }

        // Create story
        final story = Story(
          id: data['story_id'],
          userId: userId,
          media: StoryMedia(
            url: data['media_url'],
            type: MediaType.values.firstWhere(
              (v) => v.name == data['media_type'],
              orElse: () => MediaType.image,
            ),
            duration: data['media_duration'] ?? 0,
            thumbnailUrl: data['thumbnail_url'] ?? '',
          ),
          createdAt: DateTime.parse(data['story_created_at']),
          expiresAt: DateTime.parse(data['story_expires_at']),
          viewsCount: data['views_count'] ?? 0,
          repliesCount: data['replies_count'] ?? 0,
          reactionsCount: data['reactions_count'] ?? 0,
          type: StoryType.photo,
          caption: data['caption'],
          location: data['location'],
          mentions: data['mentions']?.cast<String>() ?? [],
          hashtags: data['hashtags']?.cast<String>() ?? [],
          status: StoryStatus.active,
          user: userInfos[userId],
        );

        // Group by user
        if (!storiesByUser.containsKey(userId)) {
          storiesByUser[userId] = [];
        }
        storiesByUser[userId]!.add(story);
      }

      // Create bundles
      for (final entry in storiesByUser.entries) {
        final userInfo = userInfos[entry.key]!;
        final stories = entry.value;

        // Sort stories by creation time
        stories.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        storyBundles.add(StoryBundle(
          user: userInfo,
          stories: stories,
        ));
      }

      // Sort bundles by most recent story
      storyBundles.sort((a, b) => b.stories.first.createdAt.compareTo(a.stories.first.createdAt));

      return storyBundles;
    } catch (e) {
      throw AppException('Failed to load stories: ${e.toString()}');
    }
  }

  // Get user's own stories
  Future<List<Story>> getUserStories(String userId) async {
    try {
      final response = await _supabaseService.client
          .from('stories')
          .select('*')
          .eq('user_id', userId)
          .eq('status', StoryStatus.active.name)
          .gte('expires_at', DateTime.now().toIso8601String())
          .order('created_at', ascending: false);

      return response.map((data) => Story.fromDatabaseJson(data)).toList();
    } catch (e) {
      throw AppException('Failed to load user stories: ${e.toString()}');
    }
  }

  // Mark story as viewed
  Future<bool> viewStory(String storyId, String viewerId) async {
    try {
      // Check if already viewed
      final existingView = await _supabaseService.client
          .from('story_views')
          .select()
          .eq('story_id', storyId)
          .eq('user_id', viewerId)
          .maybeSingle();

      if (existingView != null) {
        return true; // Already viewed
      }

      // Add view record
      await _supabaseService.client.from('story_views').insert({
        'id': _generateId(),
        'story_id': storyId,
        'user_id': viewerId,
        'viewed_at': DateTime.now().toIso8601String(),
        'completion_rate': 1.0,
        'time_spent': 15, // seconds
      });

      // Increment view count
      await _supabaseService.client.rpc('increment_story_views', params: {
        'story_id': storyId,
      });

      return true;
    } catch (e) {
      throw AppException('Failed to mark story as viewed: ${e.toString()}');
    }
  }

  // Add reaction to story
  Future<StoryReaction> addStoryReaction({
    required String storyId,
    required String userId,
    required StoryReactionType type,
  }) async {
    try {
      // Check if user already reacted
      final existingReaction = await _supabaseService.client
          .from('story_reactions')
          .select()
          .eq('story_id', storyId)
          .eq('user_id', userId)
          .maybeSingle();

      if (existingReaction != null) {
        // Update existing reaction
        final response = await _supabaseService.client
            .from('story_reactions')
            .update({'type': type.name})
            .eq('id', existingReaction['id'])
            .select()
            .single();

        return StoryReaction(
          id: response['id'],
          storyId: response['story_id'],
          userId: response['user_id'],
          type: type,
          createdAt: DateTime.parse(response['created_at']),
        );
      } else {
        // Add new reaction
        final reactionData = {
          'id': _generateId(),
          'story_id': storyId,
          'user_id': userId,
          'type': type.name,
          'created_at': DateTime.now().toIso8601String(),
        };

        final response = await _supabaseService.client
            .from('story_reactions')
            .insert(reactionData)
            .select()
            .single();

        // Increment reaction count
        await _supabaseService.client.rpc('increment_story_reactions', params: {
          'story_id': storyId,
        });

        return StoryReaction(
          id: response['id'],
          storyId: response['story_id'],
          userId: response['user_id'],
          type: type,
          createdAt: DateTime.parse(response['created_at']),
        );
      }
    } catch (e) {
      throw AppException('Failed to add reaction: ${e.toString()}');
    }
  }

  // Reply to story
  Future<StoryReply> replyToStory({
    required String storyId,
    required String userId,
    required String content,
  }) async {
    try {
      final replyId = _generateId();
      final replyData = {
        'id': replyId,
        'story_id': storyId,
        'user_id': userId,
        'content': content.trim(),
        'created_at': DateTime.now().toIso8601String(),
      };

      final response = await _supabaseService.client
          .from('story_replies')
          .insert(replyData)
          .select()
          .single();

      // Increment reply count
      await _supabaseService.client.rpc('increment_story_replies', params: {
        'story_id': storyId,
      });

      // Get user info for reply
      final userResponse = await _supabaseService.client
          .from('profiles')
          .select('id, username, display_name, avatar_url, is_verified')
          .eq('id', userId)
          .single();

      final userInfo = UserReplyInfo(
        id: userResponse['id'],
        username: userResponse['username'] ?? '',
        displayName: userResponse['display_name'] ?? '',
        avatarUrl: userResponse['avatar_url'],
        isVerified: userResponse['is_verified'] ?? false,
      );

      return StoryReply(
        id: response['id'],
        storyId: response['story_id'],
        userId: response['user_id'],
        content: response['content'],
        createdAt: DateTime.parse(response['created_at']),
        user: userInfo,
      );
    } catch (e) {
      throw AppException('Failed to reply to story: ${e.toString()}');
    }
  }

  // Get story replies
  Future<List<StoryReply>> getStoryReplies(String storyId) async {
    try {
      final response = await _supabaseService.client
          .from('story_replies')
          .select('''
            *,
            profiles!story_replies_user_id_fkey(
              id,
              username,
              display_name,
              avatar_url,
              is_verified
            )
          ''')
          .eq('story_id', storyId)
          .order('created_at', ascending: false);

      return response.map((data) => StoryReply(
        id: data['id'],
        storyId: data['story_id'],
        userId: data['user_id'],
        content: data['content'],
        createdAt: DateTime.parse(data['created_at']),
        user: data['profiles'] != null ? UserReplyInfo(
          id: data['profiles']['id'],
          username: data['profiles']['username'] ?? '',
          displayName: data['profiles']['display_name'] ?? '',
          avatarUrl: data['profiles']['avatar_url'],
          isVerified: data['profiles']['is_verified'] ?? false,
        ) : null,
      )).toList();
    } catch (e) {
      throw AppException('Failed to load story replies: ${e.toString()}');
    }
  }

  // Create story highlight
  Future<StoryHighlight> createStoryHighlight({
    required String userId,
    required String title,
    required List<String> storyIds,
    String? coverImageUrl,
  }) async {
    try {
      final highlightId = _generateId();

      // Use first story's image as cover if not provided
      String finalCoverUrl = coverImageUrl ?? '';
      if (finalCoverUrl.isEmpty && storyIds.isNotEmpty) {
        final storyResponse = await _supabaseService.client
            .from('stories')
            .select('media_url, thumbnail_url')
            .eq('id', storyIds.first)
            .single();

        finalCoverUrl = storyResponse['thumbnail_url'] ?? storyResponse['media_url'] ?? '';
      }

      final highlightData = {
        'id': highlightId,
        'user_id': userId,
        'title': title.trim(),
        'cover_image_url': finalCoverUrl,
        'story_ids': storyIds,
        'created_at': DateTime.now().toIso8601String(),
        'stories_count': storyIds.length,
        'views_count': 0,
        'visibility': HighlightVisibility.public.name,
        'viewer_ids': [],
      };

      final response = await _supabaseService.client
          .from('story_highlights')
          .insert(highlightData)
          .select()
          .single();

      return StoryHighlight(
        id: response['id'],
        userId: response['user_id'],
        title: response['title'],
        coverImageUrl: response['cover_image_url'],
        storyIds: response['story_ids']?.cast<String>() ?? [],
        createdAt: DateTime.parse(response['created_at']),
        storiesCount: response['stories_count'] ?? 0,
        viewsCount: response['views_count'] ?? 0,
        visibility: HighlightVisibility.public,
        viewerIds: response['viewer_ids']?.cast<String>() ?? [],
      );
    } catch (e) {
      throw AppException('Failed to create story highlight: ${e.toString()}');
    }
  }

  // Get user's story highlights
  Future<List<StoryHighlight>> getUserStoryHighlights(String userId) async {
    try {
      final response = await _supabaseService.client
          .from('story_highlights')
          .select('*')
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return response.map((data) => StoryHighlight(
        id: data['id'],
        userId: data['user_id'],
        title: data['title'],
        coverImageUrl: data['cover_image_url'],
        storyIds: data['story_ids']?.cast<String>() ?? [],
        createdAt: DateTime.parse(data['created_at']),
        storiesCount: data['stories_count'] ?? 0,
        viewsCount: data['views_count'] ?? 0,
        visibility: HighlightVisibility.values.firstWhere(
          (v) => v.name == data['visibility'],
          orElse: () => HighlightVisibility.public,
        ),
        viewerIds: data['viewer_ids']?.cast<String>() ?? [],
      )).toList();
    } catch (e) {
      throw AppException('Failed to load story highlights: ${e.toString()}');
    }
  }

  // Delete story
  Future<bool> deleteStory(String storyId, String userId) async {
    try {
      // Verify ownership
      final story = await _supabaseService.client
          .from('stories')
          .select('user_id')
          .eq('id', storyId)
          .single();

      if (story['user_id'] != userId) {
        throw AppException('Access denied');
      }

      // Soft delete by updating status
      await _supabaseService.client
          .from('stories')
          .update({'status': StoryStatus.deleted.name})
          .eq('id', storyId);

      return true;
    } catch (e) {
      throw AppException('Failed to delete story: ${e.toString()}');
    }
  }

  // Get story statistics
  Future<StoryStats> getUserStoryStats(String userId) async {
    try {
      final response = await _supabaseService.client
          .rpc('get_user_story_stats', params: {'user_id': userId});

      return StoryStats(
        totalStories: response['total_stories'] ?? 0,
        totalViews: response['total_views'] ?? 0,
        totalReplies: response['total_replies'] ?? 0,
        totalReactions: response['total_reactions'] ?? 0,
        thisWeekStories: response['this_week_stories'] ?? 0,
        thisMonthStories: response['this_month_stories'] ?? 0,
        averageViewsPerStory: response['average_views_per_story'] ?? 0,
        averageRepliesPerStory: response['average_replies_per_story'] ?? 0,
        averageCompletionRate: response['average_completion_rate']?.toDouble() ?? 0.0,
      );
    } catch (e) {
      throw AppException('Failed to load story stats: ${e.toString()}');
    }
  }

  // Helper methods
  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString() +
        (DateTime.now().microsecond % 1000).toString().padLeft(3, '0');
  }

  Future<String> _uploadStoryMedia(String storyId, dynamic mediaFile, MediaType mediaType) async {
    try {
      final fileName = 'stories/$storyId/${DateTime.now().millisecondsSinceEpoch}';
      final bytes = await mediaFile.readAsBytes();

      return await _supabaseService.uploadFile(
        'story_media',
        fileName,
        bytes,
        mediaType.name,
      );
    } catch (e) {
      throw AppException('Failed to upload story media: ${e.toString()}');
    }
  }

  Future<String> _generateVideoThumbnail(String storyId, dynamic videoFile) async {
    try {
      final thumbnailFileName = 'stories/$storyId/thumb_${DateTime.now().millisecondsSinceEpoch}';

      // In a real implementation, use video_thumbnail package
      final thumbnailBytes = await _createVideoThumbnailBytes(videoFile);

      return await _supabaseService.uploadFile(
        'story_media',
        thumbnailFileName,
        thumbnailBytes,
        'image',
      );
    } catch (e) {
      throw AppException('Failed to generate video thumbnail: ${e.toString()}');
    }
  }

  Future<int> _getVideoDuration(dynamic videoFile) async {
    // In a real implementation, use video_player package
    return 15; // Default 15 seconds
  }

  Future<Uint8List> _createVideoThumbnailBytes(dynamic videoFile) async {
    // In a real implementation, use video_thumbnail package
    // Return a placeholder thumbnail
    return Uint8List.fromList([]);
  }
}