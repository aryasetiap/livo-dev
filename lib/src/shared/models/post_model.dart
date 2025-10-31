import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String userId,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default([]) List<Media> media,
    @Default(0) int likesCount,
    @Default(0) int commentsCount,
    @Default(0) int sharesCount,
    @Default(false) bool isLiked,
    @Default(false) bool isBookmarked,
    @Default(PostVisibility.public) PostVisibility visibility,
    String? location,
    List<String>? tags,
    @Default(PostStatus.published) PostStatus status,
    UserPostInfo? user,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  const Post._();

  bool get hasMedia => media.isNotEmpty;
  bool get hasImages => media.any((m) => m.type == MediaType.image);
  bool get hasVideos => media.any((m) => m.type == MediaType.video);
  bool get hasMultipleMedia => media.length > 1;
  Media? get firstMedia => media.isNotEmpty ? media.first : null;
  String get formattedLikesCount => _formatCount(likesCount);
  String get formattedCommentsCount => _formatCount(commentsCount);
  String get formattedSharesCount => _formatCount(sharesCount);
  String get timeAgo => _formatTimeAgo(createdAt);

  static String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }

  static String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'user_id': userId,
      'content': content,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'likes_count': likesCount,
      'comments_count': commentsCount,
      'shares_count': sharesCount,
      'visibility': visibility.name,
      'location': location,
      'tags': tags,
      'status': status.name,
    };
  }

  static Post fromDatabaseJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
      sharesCount: (json['shares_count'] as num?)?.toInt() ?? 0,
      visibility: PostVisibility.values.firstWhere(
        (v) => v.name == json['visibility'],
        orElse: () => PostVisibility.public,
      ),
      location: json['location'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
      status: PostStatus.values.firstWhere(
        (v) => v.name == json['status'],
        orElse: () => PostStatus.published,
      ),
    );
  }
}

@freezed
class Media with _$Media {
  const factory Media({
    required String id,
    required String postId,
    required MediaType type,
    required String url,
    required String thumbnailUrl,
    @Default(0) int width,
    @Default(0) int height,
    @Default(0) int sizeBytes,
    @Default(0) int duration,
    @Default(0) int orderIndex,
    @Default(MediaStatus.processed) MediaStatus status,
    String? caption,
    Map<String, dynamic>? metadata,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  const Media._();

  bool get isImage => type == MediaType.image;
  bool get isVideo => type == MediaType.video;
  bool get hasThumbnail => thumbnailUrl.isNotEmpty;
  String get formattedDuration => _formatDuration(duration);
  String get formattedSize => _formatSize(sizeBytes);

  static String _formatDuration(int seconds) {
    if (seconds <= 0) return '0:00';
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  static String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'post_id': postId,
      'type': type.name,
      'url': url,
      'thumbnail_url': thumbnailUrl,
      'width': width,
      'height': height,
      'size_bytes': sizeBytes,
      'duration': duration,
      'order_index': orderIndex,
      'caption': caption,
      'metadata': metadata,
      'status': status.name,
    };
  }

  static Media fromDatabaseJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'] as String,
      postId: json['post_id'] as String,
      type: MediaType.values.firstWhere(
        (v) => v.name == json['type'],
        orElse: () => MediaType.image,
      ),
      url: json['url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
      width: (json['width'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      sizeBytes: (json['size_bytes'] as num?)?.toInt() ?? 0,
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
      caption: json['caption'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      status: MediaStatus.values.firstWhere(
        (v) => v.name == json['status'],
        orElse: () => MediaStatus.processed,
      ),
    );
  }
}

@freezed
class UserPostInfo with _$UserPostInfo {
  const factory UserPostInfo({
    required String id,
    required String username,
    required String displayName,
    String? avatarUrl,
    @Default(false) bool isVerified,
  }) = _UserPostInfo;

  factory UserPostInfo.fromJson(Map<String, dynamic> json) => _$UserPostInfoFromJson(json);

  const UserPostInfo._();

  String get displayNameOrUsername => displayName.isNotEmpty ? displayName : username;
}

enum PostVisibility {
  public,
  followers,
  private,
}

enum PostStatus {
  draft,
  published,
  archived,
  deleted,
}

enum MediaType {
  image,
  video,
}

enum MediaStatus {
  uploading,
  processing,
  processed,
  failed,
}

@freezed
class PostInteraction with _$PostInteraction {
  const factory PostInteraction({
    required String id,
    required String postId,
    required String userId,
    required PostInteractionType type,
    required DateTime createdAt,
    String? comment,
  }) = _PostInteraction;

  factory PostInteraction.fromJson(Map<String, dynamic> json) => _$PostInteractionFromJson(json);
}

enum PostInteractionType {
  like,
  comment,
  share,
  bookmark,
}

@freezed
class PostStats with _$PostStats {
  const factory PostStats({
    required int totalPosts,
    required int totalLikes,
    required int totalComments,
    required int totalShares,
    @Default(0) int thisWeekPosts,
    @Default(0) int thisMonthPosts,
    @Default(0) int thisYearPosts,
  }) = _PostStats;

  factory PostStats.fromJson(Map<String, dynamic> json) => _$PostStatsFromJson(json);
}

@freezed
class FeedPost with _$FeedPost {
  const factory FeedPost({
    required Post post,
    required UserPostInfo user,
    @Default([]) List<PostInteraction> interactions,
    bool? isLiked,
    bool? isBookmarked,
  }) = _FeedPost;

  factory FeedPost.fromJson(Map<String, dynamic> json) => _$FeedPostFromJson(json);

  const FeedPost._();

  String get formattedLikesCount => post.formattedLikesCount;
  String get formattedCommentsCount => post.formattedCommentsCount;
  String get formattedSharesCount => post.formattedSharesCount;
  String get timeAgo => post.timeAgo;
}

class CreatePostRequest extends Equatable {
  final String content;
  final List<FileMedia> media;
  final PostVisibility visibility;
  final String? location;
  final List<String> tags;

  const CreatePostRequest({
    required this.content,
    this.media = const [],
    this.visibility = PostVisibility.public,
    this.location,
    this.tags = const [],
  });

  @override
  List<Object?> get props => [content, media, visibility, location, tags];

  bool get isValid => content.trim().isNotEmpty || media.isNotEmpty;
  bool get hasContent => content.trim().isNotEmpty;
  bool get hasMedia => media.isNotEmpty;

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'visibility': visibility.name,
      'location': location,
      'tags': tags,
    };
  }
}

@freezed
class FileMedia with _$FileMedia {
  const factory FileMedia({
    required String id,
    required dynamic file, // Will be File from dart:io
    required MediaType type,
    String? caption,
    @Default(0) int orderIndex,
  }) = _FileMedia;

  const FileMedia._();

  bool get isImage => type == MediaType.image;
  bool get isVideo => type == MediaType.video;

  String? get fileName {
    try {
      return file.path?.split('/')?.last;
    } catch (e) {
      return null;
    }
  }

  int? get fileSize {
    try {
      return file.lengthSync();
    } catch (e) {
      return null;
    }
  }
}

// File will be imported from dart:io in actual implementation
// This is a placeholder for now