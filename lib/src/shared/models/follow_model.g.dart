// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowImpl _$$FollowImplFromJson(Map<String, dynamic> json) => _$FollowImpl(
  id: json['id'] as String,
  followerId: json['followerId'] as String,
  followingId: json['followingId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  follower: json['follower'] == null
      ? null
      : User.fromJson(json['follower'] as Map<String, dynamic>),
  following: json['following'] == null
      ? null
      : User.fromJson(json['following'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$FollowImplToJson(_$FollowImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'followerId': instance.followerId,
      'followingId': instance.followingId,
      'createdAt': instance.createdAt.toIso8601String(),
      'follower': instance.follower,
      'following': instance.following,
    };

_$FollowRequestImpl _$$FollowRequestImplFromJson(Map<String, dynamic> json) =>
    _$FollowRequestImpl(
      id: json['id'] as String,
      requesterId: json['requesterId'] as String,
      targetUserId: json['targetUserId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      message: json['message'] as String?,
      status: json['status'] == null
          ? 'pending'
          : _followRequestStatusFromJson(json['status'] as String?),
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
      requester: json['requester'] == null
          ? null
          : User.fromJson(json['requester'] as Map<String, dynamic>),
      targetUser: json['targetUser'] == null
          ? null
          : User.fromJson(json['targetUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowRequestImplToJson(_$FollowRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requesterId': instance.requesterId,
      'targetUserId': instance.targetUserId,
      'createdAt': instance.createdAt.toIso8601String(),
      'message': instance.message,
      'status': _followRequestStatusToJson(instance.status),
      'respondedAt': instance.respondedAt?.toIso8601String(),
      'requester': instance.requester,
      'targetUser': instance.targetUser,
    };

_$FollowStatsImpl _$$FollowStatsImplFromJson(Map<String, dynamic> json) =>
    _$FollowStatsImpl(
      followersCount: (json['followersCount'] as num?)?.toInt() ?? 0,
      followingCount: (json['followingCount'] as num?)?.toInt() ?? 0,
      pendingRequestsCount:
          (json['pendingRequestsCount'] as num?)?.toInt() ?? 0,
      recentFollowers:
          (json['recentFollowers'] as List<dynamic>?)
              ?.map((e) => Follow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recentFollowing:
          (json['recentFollowing'] as List<dynamic>?)
              ?.map((e) => Follow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FollowStatsImplToJson(_$FollowStatsImpl instance) =>
    <String, dynamic>{
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
      'pendingRequestsCount': instance.pendingRequestsCount,
      'recentFollowers': instance.recentFollowers,
      'recentFollowing': instance.recentFollowing,
    };
