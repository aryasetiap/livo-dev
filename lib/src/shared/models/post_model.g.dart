// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  media:
      (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  likesCount: (json['likesCount'] as num?)?.toInt() ?? 0,
  commentsCount: (json['commentsCount'] as num?)?.toInt() ?? 0,
  sharesCount: (json['sharesCount'] as num?)?.toInt() ?? 0,
  isLiked: json['isLiked'] as bool? ?? false,
  isBookmarked: json['isBookmarked'] as bool? ?? false,
  visibility:
      $enumDecodeNullable(_$PostVisibilityEnumMap, json['visibility']) ??
      PostVisibility.public,
  location: json['location'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  status:
      $enumDecodeNullable(_$PostStatusEnumMap, json['status']) ??
      PostStatus.published,
  user: json['user'] == null
      ? null
      : UserPostInfo.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'media': instance.media,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
      'sharesCount': instance.sharesCount,
      'isLiked': instance.isLiked,
      'isBookmarked': instance.isBookmarked,
      'visibility': _$PostVisibilityEnumMap[instance.visibility]!,
      'location': instance.location,
      'tags': instance.tags,
      'status': _$PostStatusEnumMap[instance.status]!,
      'user': instance.user,
    };

const _$PostVisibilityEnumMap = {
  PostVisibility.public: 'public',
  PostVisibility.followers: 'followers',
  PostVisibility.private: 'private',
};

const _$PostStatusEnumMap = {
  PostStatus.draft: 'draft',
  PostStatus.published: 'published',
  PostStatus.archived: 'archived',
  PostStatus.deleted: 'deleted',
};

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
  id: json['id'] as String,
  postId: json['postId'] as String,
  type: $enumDecode(_$MediaTypeEnumMap, json['type']),
  url: json['url'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String,
  width: (json['width'] as num?)?.toInt() ?? 0,
  height: (json['height'] as num?)?.toInt() ?? 0,
  sizeBytes: (json['sizeBytes'] as num?)?.toInt() ?? 0,
  duration: (json['duration'] as num?)?.toInt() ?? 0,
  orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
  status:
      $enumDecodeNullable(_$MediaStatusEnumMap, json['status']) ??
      MediaStatus.processed,
  caption: json['caption'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'width': instance.width,
      'height': instance.height,
      'sizeBytes': instance.sizeBytes,
      'duration': instance.duration,
      'orderIndex': instance.orderIndex,
      'status': _$MediaStatusEnumMap[instance.status]!,
      'caption': instance.caption,
      'metadata': instance.metadata,
    };

const _$MediaTypeEnumMap = {MediaType.image: 'image', MediaType.video: 'video'};

const _$MediaStatusEnumMap = {
  MediaStatus.uploading: 'uploading',
  MediaStatus.processing: 'processing',
  MediaStatus.processed: 'processed',
  MediaStatus.failed: 'failed',
};

_$UserPostInfoImpl _$$UserPostInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserPostInfoImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      displayName: json['displayName'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserPostInfoImplToJson(_$UserPostInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'isVerified': instance.isVerified,
    };

_$PostInteractionImpl _$$PostInteractionImplFromJson(
  Map<String, dynamic> json,
) => _$PostInteractionImpl(
  id: json['id'] as String,
  postId: json['postId'] as String,
  userId: json['userId'] as String,
  type: $enumDecode(_$PostInteractionTypeEnumMap, json['type']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$$PostInteractionImplToJson(
  _$PostInteractionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'postId': instance.postId,
  'userId': instance.userId,
  'type': _$PostInteractionTypeEnumMap[instance.type]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'comment': instance.comment,
};

const _$PostInteractionTypeEnumMap = {
  PostInteractionType.like: 'like',
  PostInteractionType.comment: 'comment',
  PostInteractionType.share: 'share',
  PostInteractionType.bookmark: 'bookmark',
};

_$PostStatsImpl _$$PostStatsImplFromJson(Map<String, dynamic> json) =>
    _$PostStatsImpl(
      totalPosts: (json['totalPosts'] as num).toInt(),
      totalLikes: (json['totalLikes'] as num).toInt(),
      totalComments: (json['totalComments'] as num).toInt(),
      totalShares: (json['totalShares'] as num).toInt(),
      thisWeekPosts: (json['thisWeekPosts'] as num?)?.toInt() ?? 0,
      thisMonthPosts: (json['thisMonthPosts'] as num?)?.toInt() ?? 0,
      thisYearPosts: (json['thisYearPosts'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PostStatsImplToJson(_$PostStatsImpl instance) =>
    <String, dynamic>{
      'totalPosts': instance.totalPosts,
      'totalLikes': instance.totalLikes,
      'totalComments': instance.totalComments,
      'totalShares': instance.totalShares,
      'thisWeekPosts': instance.thisWeekPosts,
      'thisMonthPosts': instance.thisMonthPosts,
      'thisYearPosts': instance.thisYearPosts,
    };

_$FeedPostImpl _$$FeedPostImplFromJson(Map<String, dynamic> json) =>
    _$FeedPostImpl(
      post: Post.fromJson(json['post'] as Map<String, dynamic>),
      user: UserPostInfo.fromJson(json['user'] as Map<String, dynamic>),
      interactions:
          (json['interactions'] as List<dynamic>?)
              ?.map((e) => PostInteraction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLiked: json['isLiked'] as bool?,
      isBookmarked: json['isBookmarked'] as bool?,
    );

Map<String, dynamic> _$$FeedPostImplToJson(_$FeedPostImpl instance) =>
    <String, dynamic>{
      'post': instance.post,
      'user': instance.user,
      'interactions': instance.interactions,
      'isLiked': instance.isLiked,
      'isBookmarked': instance.isBookmarked,
    };
