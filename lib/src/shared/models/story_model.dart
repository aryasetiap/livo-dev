import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String id,
    required String userId,
    required StoryMedia media,
    required DateTime createdAt,
    required DateTime expiresAt,
    @Default(0) int viewsCount,
    @Default(0) int repliesCount,
    @Default(0) int reactionsCount,
    @Default([]) List<StoryReaction> reactions,
    @Default([]) List<StoryReply> replies,
    @Default(StoryType.photo) StoryType type,
    String? caption,
    String? location,
    @Default([]) List<String> mentions,
    @Default([]) List<String> hashtags,
    @Default(false) bool isViewed,
    DateTime? viewedAt,
    @Default(StoryStatus.active) StoryStatus status,
    UserStoryInfo? user,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  const Story._();

  bool get isExpired => DateTime.now().isAfter(expiresAt);
  bool get isViewing => !isViewed && !isExpired;
  bool get hasCaption => caption != null && caption!.isNotEmpty;
  bool get hasLocation => location != null && location!.isNotEmpty;
  bool get hasMentions => mentions.isNotEmpty;
  bool get hasHashtags => hashtags.isNotEmpty;
  String get formattedViewsCount => _formatCount(viewsCount);
  String get formattedRepliesCount => _formatCount(repliesCount);
  String get formattedReactionsCount => _formatCount(reactionsCount);
  String get timeRemaining => _formatTimeRemaining(expiresAt);
  String get timeAgo => _formatTimeAgo(createdAt);
  Duration get remainingDuration => expiresAt.difference(DateTime.now());
  double get progress {
    final totalDuration = expiresAt.difference(createdAt);
    final elapsed = DateTime.now().difference(createdAt);
    return elapsed.inMilliseconds / totalDuration.inMilliseconds;
  }

  static String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }

  static String _formatTimeRemaining(DateTime dateTime) {
    final remaining = dateTime.difference(DateTime.now());
    if (remaining.inDays > 0) {
      return '${remaining.inDays}d left';
    } else if (remaining.inHours > 0) {
      return '${remaining.inHours}h left';
    } else if (remaining.inMinutes > 0) {
      return '${remaining.inMinutes}m left';
    } else {
      return 'Expires soon';
    }
  }

  static String _formatTimeAgo(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'user_id': userId,
      'media_url': media.url,
      'media_type': media.type.name,
      'media_duration': media.duration,
      'thumbnail_url': media.thumbnailUrl,
      'created_at': createdAt.toIso8601String(),
      'expires_at': expiresAt.toIso8601String(),
      'views_count': viewsCount,
      'replies_count': repliesCount,
      'reactions_count': reactionsCount,
      'type': type.name,
      'caption': caption,
      'location': location,
      'mentions': mentions,
      'hashtags': hashtags,
      'status': status.name,
    };
  }

  static Story fromDatabaseJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      media: StoryMedia(
        url: json['media_url'] as String,
        type: MediaType.values.firstWhere(
          (v) => v.name == json['media_type'],
          orElse: () => MediaType.image,
        ),
        duration: json['media_duration'] as int? ?? 0,
        thumbnailUrl: json['thumbnail_url'] as String? ?? '',
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: DateTime.parse(json['expires_at'] as String),
      viewsCount: (json['views_count'] as num?)?.toInt() ?? 0,
      repliesCount: (json['replies_count'] as num?)?.toInt() ?? 0,
      reactionsCount: (json['reactions_count'] as num?)?.toInt() ?? 0,
      type: StoryType.values.firstWhere(
        (v) => v.name == json['type'],
        orElse: () => StoryType.photo,
      ),
      caption: json['caption'] as String?,
      location: json['location'] as String?,
      mentions: (json['mentions'] as List<dynamic>?)?.cast<String>() ?? [],
      hashtags: (json['hashtags'] as List<dynamic>?)?.cast<String>() ?? [],
      status: StoryStatus.values.firstWhere(
        (v) => v.name == json['status'],
        orElse: () => StoryStatus.active,
      ),
    );
  }
}

@freezed
class StoryMedia with _$StoryMedia {
  const factory StoryMedia({
    required String url,
    @Default(MediaType.image) MediaType type,
    @Default(0) int duration,
    @Default('') String thumbnailUrl,
    @Default(0) int width,
    @Default(0) int height,
    @Default(0) int sizeBytes,
    Map<String, dynamic>? metadata,
  }) = _StoryMedia;

  factory StoryMedia.fromJson(Map<String, dynamic> json) => _$StoryMediaFromJson(json);

  const StoryMedia._();

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
}

@freezed
class UserStoryInfo with _$UserStoryInfo {
  const factory UserStoryInfo({
    required String id,
    required String username,
    required String displayName,
    String? avatarUrl,
    @Default(false) bool isVerified,
    @Default(false) bool isFollowing,
    DateTime? lastStoryAt,
    @Default(0) int storiesCount,
  }) = _UserStoryInfo;

  factory UserStoryInfo.fromJson(Map<String, dynamic> json) => _$UserStoryInfoFromJson(json);

  const UserStoryInfo._();

  String get displayNameOrUsername => displayName.isNotEmpty ? displayName : username;
  bool get hasActiveStories => lastStoryAt != null &&
      DateTime.now().difference(lastStoryAt!).inHours < 24;
}

@freezed
class StoryReaction with _$StoryReaction {
  const factory StoryReaction({
    required String id,
    required String storyId,
    required String userId,
    required StoryReactionType type,
    required DateTime createdAt,
  }) = _StoryReaction;

  factory StoryReaction.fromJson(Map<String, dynamic> json) => _$StoryReactionFromJson(json);
}

@freezed
class StoryReply with _$StoryReply {
  const factory StoryReply({
    required String id,
    required String storyId,
    required String userId,
    required String content,
    required DateTime createdAt,
    UserReplyInfo? user,
  }) = _StoryReply;

  factory StoryReply.fromJson(Map<String, dynamic> json) => _$StoryReplyFromJson(json);

  const StoryReply._();

  String get timeAgo => _formatTimeAgo(createdAt);

  static String _formatTimeAgo(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}

@freezed
class UserReplyInfo with _$UserReplyInfo {
  const factory UserReplyInfo({
    required String id,
    required String username,
    required String displayName,
    String? avatarUrl,
    @Default(false) bool isVerified,
  }) = _UserReplyInfo;

  factory UserReplyInfo.fromJson(Map<String, dynamic> json) => _$UserReplyInfoFromJson(json);

  const UserReplyInfo._();

  String get displayNameOrUsername => displayName.isNotEmpty ? displayName : username;
}

@freezed
class StoryHighlight with _$StoryHighlight {
  const factory StoryHighlight({
    required String id,
    required String userId,
    required String title,
    required String coverImageUrl,
    required List<String> storyIds,
    required DateTime createdAt,
    @Default(0) int storiesCount,
    @Default(0) int viewsCount,
    @Default(HighlightVisibility.public) HighlightVisibility visibility,
    @Default([]) List<String> viewerIds,
  }) = _StoryHighlight;

  factory StoryHighlight.fromJson(Map<String, dynamic> json) => _$StoryHighlightFromJson(json);

  const StoryHighlight._();

  String get formattedViewsCount => _formatCount(viewsCount);
  String get formattedStoriesCount => _formatCount(storiesCount);

  static String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}

@freezed
class StoryBundle with _$StoryBundle {
  const factory StoryBundle({
    required UserStoryInfo user,
    required List<Story> stories,
    @Default(0) int currentIndex,
  }) = _StoryBundle;

  factory StoryBundle.fromJson(Map<String, dynamic> json) => _$StoryBundleFromJson(json);

  const StoryBundle._();

  bool get hasStories => stories.isNotEmpty;
  Story? get currentStory => currentIndex < stories.length ? stories[currentIndex] : null;
  bool get isLastStory => currentIndex >= stories.length - 1;
  bool get isFirstStory => currentIndex <= 0;
  Duration get totalDuration {
    return stories.fold(Duration.zero, (sum, story) => sum + const Duration(seconds: 15));
  }
}

enum StoryType {
  photo,
  video,
  boomerang,
  superzoom,
}

enum StoryStatus {
  active,
  expired,
  deleted,
  archived,
}

enum StoryReactionType {
  love,
  laugh,
  wow,
  sad,
  angry,
  like,
}

enum HighlightVisibility {
  public,
  followers,
  private,
}

@freezed
class CreateStoryRequest with _$CreateStoryRequest {
  const factory CreateStoryRequest({
    required dynamic media, // Will be File from dart:io
    required MediaType mediaType,
    String? caption,
    String? location,
    @Default([]) List<String> mentions,
    @Default([]) List<String> hashtags,
  }) = _CreateStoryRequest;

  const CreateStoryRequest._();

  bool get hasCaption => caption != null && caption!.isNotEmpty;
  bool get hasLocation => location != null && location!.isNotEmpty;
  bool get hasMentions => mentions.isNotEmpty;
  bool get hasHashtags => hashtags.isNotEmpty;
}

@freezed
class StoryStats with _$StoryStats {
  const factory StoryStats({
    required int totalStories,
    required int totalViews,
    required int totalReplies,
    required int totalReactions,
    @Default(0) int thisWeekStories,
    @Default(0) int thisMonthStories,
    @Default(0) int averageViewsPerStory,
    @Default(0) int averageRepliesPerStory,
    @Default(0.0) double averageCompletionRate,
  }) = _StoryStats;

  factory StoryStats.fromJson(Map<String, dynamic> json) => _$StoryStatsFromJson(json);
}

@freezed
class StoryView with _$StoryView {
  const factory StoryView({
    required String id,
    required String storyId,
    required String userId,
    required DateTime viewedAt,
    @Default(0.0) double completionRate,
    @Default(0) int timeSpent,
  }) = _StoryView;

  factory StoryView.fromJson(Map<String, dynamic> json) => _$StoryViewFromJson(json);
}

// File media wrapper for story creation
@freezed
class FileStoryMedia with _$FileStoryMedia {
  const factory FileStoryMedia({
    required dynamic file, // Will be File from dart:io
    required MediaType type,
    String? caption,
    @Default(0) int duration,
    Map<String, dynamic>? metadata,
  }) = _FileStoryMedia;

  const FileStoryMedia._();

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