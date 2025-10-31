// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRead: json['isRead'] as bool? ?? false,
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      actionUrl: json['actionUrl'] as String?,
      actionText: json['actionText'] as String?,
      actionData: json['actionData'] as Map<String, dynamic>?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      actor: json['actor'] == null
          ? null
          : NotificationActor.fromJson(json['actor'] as Map<String, dynamic>),
      target: json['target'] == null
          ? null
          : NotificationTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'body': instance.body,
      'createdAt': instance.createdAt.toIso8601String(),
      'isRead': instance.isRead,
      'readAt': instance.readAt?.toIso8601String(),
      'actionUrl': instance.actionUrl,
      'actionText': instance.actionText,
      'actionData': instance.actionData,
      'metadata': instance.metadata,
      'actor': instance.actor,
      'target': instance.target,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.like: 'like',
  NotificationType.comment: 'comment',
  NotificationType.follow: 'follow',
  NotificationType.message: 'message',
  NotificationType.storyReaction: 'storyReaction',
  NotificationType.storyReply: 'storyReply',
  NotificationType.mention: 'mention',
  NotificationType.postShare: 'postShare',
  NotificationType.storyView: 'storyView',
  NotificationType.system: 'system',
};

_$NotificationActorImpl _$$NotificationActorImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationActorImpl(
  id: json['id'] as String,
  username: json['username'] as String,
  displayName: json['displayName'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  isVerified: json['isVerified'] as bool? ?? false,
);

Map<String, dynamic> _$$NotificationActorImplToJson(
  _$NotificationActorImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'displayName': instance.displayName,
  'avatarUrl': instance.avatarUrl,
  'isVerified': instance.isVerified,
};

_$NotificationTargetImpl _$$NotificationTargetImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationTargetImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  title: json['title'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$NotificationTargetImplToJson(
  _$NotificationTargetImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'title': instance.title,
  'thumbnailUrl': instance.thumbnailUrl,
  'metadata': instance.metadata,
};

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationSettingsImpl(
  userId: json['userId'] as String,
  pushNotifications: json['pushNotifications'] as bool? ?? true,
  emailNotifications: json['emailNotifications'] as bool? ?? true,
  inAppNotifications: json['inAppNotifications'] as bool? ?? true,
  likesEnabled: json['likesEnabled'] as bool? ?? true,
  commentsEnabled: json['commentsEnabled'] as bool? ?? true,
  followsEnabled: json['followsEnabled'] as bool? ?? true,
  messagesEnabled: json['messagesEnabled'] as bool? ?? true,
  mentionsEnabled: json['mentionsEnabled'] as bool? ?? true,
  storyReactionsEnabled: json['storyReactionsEnabled'] as bool? ?? true,
  storyRepliesEnabled: json['storyRepliesEnabled'] as bool? ?? true,
  storyViewsEnabled: json['storyViewsEnabled'] as bool? ?? true,
  postSharesEnabled: json['postSharesEnabled'] as bool? ?? true,
  systemNotificationsEnabled:
      json['systemNotificationsEnabled'] as bool? ?? true,
  customSettings: (json['customSettings'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool),
  ),
);

Map<String, dynamic> _$$NotificationSettingsImplToJson(
  _$NotificationSettingsImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'pushNotifications': instance.pushNotifications,
  'emailNotifications': instance.emailNotifications,
  'inAppNotifications': instance.inAppNotifications,
  'likesEnabled': instance.likesEnabled,
  'commentsEnabled': instance.commentsEnabled,
  'followsEnabled': instance.followsEnabled,
  'messagesEnabled': instance.messagesEnabled,
  'mentionsEnabled': instance.mentionsEnabled,
  'storyReactionsEnabled': instance.storyReactionsEnabled,
  'storyRepliesEnabled': instance.storyRepliesEnabled,
  'storyViewsEnabled': instance.storyViewsEnabled,
  'postSharesEnabled': instance.postSharesEnabled,
  'systemNotificationsEnabled': instance.systemNotificationsEnabled,
  'customSettings': instance.customSettings,
};

_$PushNotificationPayloadImpl _$$PushNotificationPayloadImplFromJson(
  Map<String, dynamic> json,
) => _$PushNotificationPayloadImpl(
  title: json['title'] as String,
  body: json['body'] as String,
  imageUrl: json['imageUrl'] as String?,
  icon: json['icon'] as String?,
  sound: json['sound'] as String?,
  badge: json['badge'] as String?,
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$PushNotificationPayloadImplToJson(
  _$PushNotificationPayloadImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'body': instance.body,
  'imageUrl': instance.imageUrl,
  'icon': instance.icon,
  'sound': instance.sound,
  'badge': instance.badge,
  'data': instance.data,
};

_$NotificationStatsImpl _$$NotificationStatsImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationStatsImpl(
  totalNotifications: (json['totalNotifications'] as num).toInt(),
  unreadNotifications: (json['unreadNotifications'] as num).toInt(),
  notificationsToday: (json['notificationsToday'] as num?)?.toInt() ?? 0,
  notificationsThisWeek: (json['notificationsThisWeek'] as num?)?.toInt() ?? 0,
  notificationsThisMonth:
      (json['notificationsThisMonth'] as num?)?.toInt() ?? 0,
  typeCounts:
      (json['typeCounts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          $enumDecode(_$NotificationTypeEnumMap, k),
          (e as num).toInt(),
        ),
      ) ??
      const {},
);

Map<String, dynamic> _$$NotificationStatsImplToJson(
  _$NotificationStatsImpl instance,
) => <String, dynamic>{
  'totalNotifications': instance.totalNotifications,
  'unreadNotifications': instance.unreadNotifications,
  'notificationsToday': instance.notificationsToday,
  'notificationsThisWeek': instance.notificationsThisWeek,
  'notificationsThisMonth': instance.notificationsThisMonth,
  'typeCounts': instance.typeCounts.map(
    (k, e) => MapEntry(_$NotificationTypeEnumMap[k]!, e),
  ),
};
