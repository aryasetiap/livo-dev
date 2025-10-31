import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String id,
    required String userId,
    required NotificationType type,
    required String title,
    required String body,
    required DateTime createdAt,
    @Default(false) bool isRead,
    DateTime? readAt,
    String? actionUrl,
    String? actionText,
    Map<String, dynamic>? actionData,
    Map<String, dynamic>? metadata,
    NotificationActor? actor,
    NotificationTarget? target,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  const Notification._();

  bool get isUnread => !isRead;
  String get timeAgo => _formatTimeAgo(createdAt);
  String get displayTitle => _getDisplayTitle();
  String get displayBody => _getDisplayBody();
  String get getIcon => _getNotificationIcon();

  static String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'just now';
    }
  }

  String _getDisplayTitle() {
    switch (type) {
      case NotificationType.like:
        return actor?.displayNameOrUsername ?? 'Someone';
      case NotificationType.comment:
        return actor?.displayNameOrUsername ?? 'Someone';
      case NotificationType.follow:
        return actor?.displayNameOrUsername ?? 'Someone';
      case NotificationType.message:
        return actor?.displayNameOrUsername ?? 'New message';
      case NotificationType.storyReaction:
        return actor?.displayNameOrUsername ?? 'Someone';
      case NotificationType.storyReply:
        return actor?.displayNameOrUsername ?? 'Someone';
      case NotificationType.mention:
        return actor?.displayNameOrUsername ?? 'Someone mentioned you';
      case NotificationType.postShare:
        return actor?.displayNameOrUsername ?? 'Someone';
      case NotificationType.storyView:
        return 'Story viewed';
      case NotificationType.system:
        return title;
      default:
        return title;
    }
  }

  String _getDisplayBody() {
    switch (type) {
      case NotificationType.like:
        return 'liked your ${target?.type ?? 'post'}';
      case NotificationType.comment:
        return 'commented: "${body.substring(0, Math.min(50, body.length))}${body.length > 50 ? '...' : ''}"';
      case NotificationType.follow:
        return 'started following you';
      case NotificationType.message:
        return body.isNotEmpty ? body : 'sent you a message';
      case NotificationType.storyReaction:
        return 'reacted to your story';
      case NotificationType.storyReply:
        return 'replied to your story';
      case NotificationType.mention:
        return 'mentioned you in a ${target?.type ?? 'post'}';
      case NotificationType.postShare:
        return 'shared your ${target?.type ?? 'post'}';
      case NotificationType.storyView:
        return '${actor?.displayNameOrUsername ?? 'Someone'} viewed your story';
      case NotificationType.system:
        return body;
      default:
        return body;
    }
  }

  String _getNotificationIcon() {
    switch (type) {
      case NotificationType.like:
        return '❤️';
      case NotificationType.comment:
        return '💬';
      case NotificationType.follow:
        return '👤';
      case NotificationType.message:
        return '📨';
      case NotificationType.storyReaction:
        return '😊';
      case NotificationType.storyReply:
        return '↩️';
      case NotificationType.mention:
        return '@';
      case NotificationType.postShare:
        return '🔄';
      case NotificationType.storyView:
        return '👁️';
      case NotificationType.system:
        return '🔔';
      default:
        return '📢';
    }
  }

  Notification markAsRead() {
    return copyWith(
      isRead: true,
      readAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type.name,
      'title': title,
      'body': body,
      'created_at': createdAt.toIso8601String(),
      'is_read': isRead,
      'read_at': readAt?.toIso8601String(),
      'action_url': actionUrl,
      'action_text': actionText,
      'action_data': actionData,
      'metadata': metadata,
      'actor_id': actor?.id,
      'target_id': target?.id,
    };
  }

  static Notification fromDatabaseJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      type: NotificationType.values.firstWhere(
        (v) => v.name == json['type'],
        orElse: () => NotificationType.system,
      ),
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool? ?? false,
      readAt: json['read_at'] != null
          ? DateTime.parse(json['read_at'] as String)
          : null,
      actionUrl: json['action_url'] as String?,
      actionText: json['action_text'] as String?,
      actionData: json['action_data'] as Map<String, dynamic>?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      actor: json['actor_data'] != null
          ? NotificationActor.fromJson(json['actor_data'] as Map<String, dynamic>)
          : null,
      target: json['target_data'] != null
          ? NotificationTarget.fromJson(json['target_data'] as Map<String, dynamic>)
          : null,
    );
  }
}

@freezed
class NotificationActor with _$NotificationActor {
  const factory NotificationActor({
    required String id,
    required String username,
    required String displayName,
    String? avatarUrl,
    @Default(false) bool isVerified,
  }) = _NotificationActor;

  factory NotificationActor.fromJson(Map<String, dynamic> json) => _$NotificationActorFromJson(json);

  const NotificationActor._();

  String get displayNameOrUsername => displayName.isNotEmpty ? displayName : username;
}

@freezed
class NotificationTarget with _$NotificationTarget {
  const factory NotificationTarget({
    required String id,
    required String type,
    String? title,
    String? thumbnailUrl,
    Map<String, dynamic>? metadata,
  }) = _NotificationTarget;

  factory NotificationTarget.fromJson(Map<String, dynamic> json) => _$NotificationTargetFromJson(json);

  const NotificationTarget._();
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    required String userId,
    @Default(true) bool pushNotifications,
    @Default(true) bool emailNotifications,
    @Default(true) bool inAppNotifications,
    @Default(true) bool likesEnabled,
    @Default(true) bool commentsEnabled,
    @Default(true) bool followsEnabled,
    @Default(true) bool messagesEnabled,
    @Default(true) bool mentionsEnabled,
    @Default(true) bool storyReactionsEnabled,
    @Default(true) bool storyRepliesEnabled,
    @Default(true) bool storyViewsEnabled,
    @Default(true) bool postSharesEnabled,
    @Default(true) bool systemNotificationsEnabled,
    Map<String, bool>? customSettings,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => _$NotificationSettingsFromJson(json);

  const NotificationSettings._();

  bool isNotificationTypeEnabled(NotificationType type) {
    switch (type) {
      case NotificationType.like:
        return likesEnabled;
      case NotificationType.comment:
        return commentsEnabled;
      case NotificationType.follow:
        return followsEnabled;
      case NotificationType.message:
        return messagesEnabled;
      case NotificationType.mention:
        return mentionsEnabled;
      case NotificationType.storyReaction:
        return storyReactionsEnabled;
      case NotificationType.storyReply:
        return storyRepliesEnabled;
      case NotificationType.storyView:
        return storyViewsEnabled;
      case NotificationType.postShare:
        return postSharesEnabled;
      case NotificationType.system:
        return systemNotificationsEnabled;
      default:
        return true;
    }
  }

  NotificationSettings copyWithTypeEnabled(NotificationType type, bool enabled) {
    switch (type) {
      case NotificationType.like:
        return copyWith(likesEnabled: enabled);
      case NotificationType.comment:
        return copyWith(commentsEnabled: enabled);
      case NotificationType.follow:
        return copyWith(followsEnabled: enabled);
      case NotificationType.message:
        return copyWith(messagesEnabled: enabled);
      case NotificationType.mention:
        return copyWith(mentionsEnabled: enabled);
      case NotificationType.storyReaction:
        return copyWith(storyReactionsEnabled: enabled);
      case NotificationType.storyReply:
        return copyWith(storyRepliesEnabled: enabled);
      case NotificationType.storyView:
        return copyWith(storyViewsEnabled: enabled);
      case NotificationType.postShare:
        return copyWith(postSharesEnabled: enabled);
      case NotificationType.system:
        return copyWith(systemNotificationsEnabled: enabled);
      default:
        return this;
    }
  }
}

@freezed
class PushNotificationPayload with _$PushNotificationPayload {
  const factory PushNotificationPayload({
    required String title,
    required String body,
    String? imageUrl,
    String? icon,
    String? sound,
    String? badge,
    Map<String, dynamic>? data,
  }) = _PushNotificationPayload;

  factory PushNotificationPayload.fromJson(Map<String, dynamic> json) => _$PushNotificationPayloadFromJson(json);
}

@freezed
class NotificationStats with _$NotificationStats {
  const factory NotificationStats({
    required int totalNotifications,
    required int unreadNotifications,
    @Default(0) int notificationsToday,
    @Default(0) int notificationsThisWeek,
    @Default(0) int notificationsThisMonth,
    @Default({}) Map<NotificationType, int> typeCounts,
  }) = _NotificationStats;

  factory NotificationStats.fromJson(Map<String, dynamic> json) => _$NotificationStatsFromJson(json);

  const NotificationStats._();

  int getTypeCount(NotificationType type) {
    return typeCounts[type.name] ?? 0;
  }
}

// Enums
enum NotificationType {
  like,
  comment,
  follow,
  message,
  storyReaction,
  storyReply,
  mention,
  postShare,
  storyView,
  system,
}

enum NotificationPriority {
  low,
  normal,
  high,
  urgent,
}

// Request Models
@freezed
class CreateNotificationRequest with _$CreateNotificationRequest {
  const factory CreateNotificationRequest({
    required String userId,
    required NotificationType type,
    required String title,
    required String body,
    String? actionUrl,
    String? actionText,
    Map<String, dynamic>? actionData,
    Map<String, dynamic>? metadata,
    NotificationActor? actor,
    NotificationTarget? target,
    @Default(NotificationPriority.normal) NotificationPriority priority,
  }) = _CreateNotificationRequest;

  const CreateNotificationRequest._();

  CreateNotificationRequest copyWithActor(User user) {
    return copyWith(
      actor: NotificationActor(
        id: user.id,
        username: user.usernameOrEmail,
        displayName: user.displayNameOrUsername,
        avatarUrl: user.avatarUrl,
        isVerified: user.isVerified,
      ),
    );
  }
}

@freezed
class MarkNotificationsReadRequest with _$MarkNotificationsReadRequest {
  const factory MarkNotificationsReadRequest({
    required String userId,
    String? notificationId, // If null, mark all as read
  }) = _MarkNotificationsReadRequest;
}

@freezed
class NotificationQuery with _$NotificationQuery {
  const factory NotificationQuery({
    String? userId,
    NotificationType? type,
    bool? isRead,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    int? offset,
    String? orderBy,
    bool? descending,
  }) = _NotificationQuery;

  const NotificationQuery._();

  Map<String, dynamic> toParams() {
    return {
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type!.name,
      if (isRead != null) 'is_read': isRead,
      if (startDate != null) 'start_date': startDate!.toIso8601String(),
      if (endDate != null) 'end_date': endDate!.toIso8601String(),
      if (limit != null) 'limit': limit,
      if (offset != null) 'offset': offset,
      if (orderBy != null) 'order_by': orderBy,
      if (descending != null) 'descending': descending,
    };
  }
}

// Math utility for substring length
class Math {
  static int min(int a, int b) => a < b ? a : b;
}