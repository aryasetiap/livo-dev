import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/errors/app_exception.dart';
import '../core/services/supabase_service.dart';
import '../shared/models/notification_model.dart';
import '../shared/models/user_model.dart';

class NotificationService {
  final SupabaseService _supabaseService;
  StreamSubscription? _notificationsSubscription;

  NotificationService(this._supabaseService);

  // Notification Creation
  Future<Notification> createNotification(CreateNotificationRequest request) async {
    try {
      final notificationId = _generateId();
      final notificationData = {
        'id': notificationId,
        'user_id': request.userId,
        'type': request.type.name,
        'title': request.title,
        'body': request.body,
        'created_at': DateTime.now().toIso8601String(),
        'is_read': false,
        'action_url': request.actionUrl,
        'action_text': request.actionText,
        'action_data': request.actionData,
        'metadata': request.metadata,
        'actor_id': request.actor?.id,
        'target_id': request.target?.id,
        'actor_data': request.actor?.toJson(),
        'target_data': request.target?.toJson(),
      };

      final response = await _supabaseService.client
          .from('notifications')
          .insert(notificationData)
          .select()
          .single();

      // Send push notification (if enabled)
      await _sendPushNotification(request);

      return Notification.fromDatabaseJson(response);
    } catch (e) {
      throw AppException('Failed to create notification: ${e.toString()}');
    }
  }

  // Convenience methods for common notification types
  Future<Notification> createLikeNotification({
    required String userId,
    required User actor,
    required String targetId,
    String targetType = 'post',
  }) async {
    final request = CreateNotificationRequest(
      userId: userId,
      type: NotificationType.like,
      title: actor.displayNameOrUsername,
      body: 'liked your $targetType',
      actionUrl: '/post/$targetId',
      actionText: 'View Post',
      actor: NotificationActor(
        id: actor.id,
        username: actor.usernameOrEmail,
        displayName: actor.displayNameOrUsername,
        avatarUrl: actor.avatarUrl,
        isVerified: actor.isVerified,
      ),
      target: NotificationTarget(
        id: targetId,
        type: targetType,
      ),
    );

    return await createNotification(request);
  }

  Future<Notification> createCommentNotification({
    required String userId,
    required User actor,
    required String targetId,
    required String commentContent,
    String targetType = 'post',
  }) async {
    final request = CreateNotificationRequest(
      userId: userId,
      type: NotificationType.comment,
      title: actor.displayNameOrUsername,
      body: 'commented: "${commentContent.length > 50 ? '${commentContent.substring(0, 50)}...' : commentContent}"',
      actionUrl: '/post/$targetId',
      actionText: 'View Comment',
      actor: NotificationActor(
        id: actor.id,
        username: actor.usernameOrEmail,
        displayName: actor.displayNameOrUsername,
        avatarUrl: actor.avatarUrl,
        isVerified: actor.isVerified,
      ),
      target: NotificationTarget(
        id: targetId,
        type: targetType,
      ),
    );

    return await createNotification(request);
  }

  Future<Notification> createFollowNotification({
    required String userId,
    required User actor,
  }) async {
    final request = CreateNotificationRequest(
      userId: userId,
      type: NotificationType.follow,
      title: actor.displayNameOrUsername,
      body: 'started following you',
      actionUrl: '/profile/${actor.id}',
      actionText: 'View Profile',
      actor: NotificationActor(
        id: actor.id,
        username: actor.usernameOrEmail,
        displayName: actor.displayNameOrUsername,
        avatarUrl: actor.avatarUrl,
        isVerified: actor.isVerified,
      ),
    );

    return await createNotification(request);
  }

  Future<Notification> createMessageNotification({
    required String userId,
    required User actor,
    required String roomId,
    required String messageContent,
    String? roomName,
  }) async {
    final request = CreateNotificationRequest(
      userId: userId,
      type: NotificationType.message,
      title: actor.displayNameOrUsername,
      body: messageContent.isNotEmpty ? messageContent : 'sent you a message',
      actionUrl: '/chat/$roomId',
      actionText: 'Reply',
      actor: NotificationActor(
        id: actor.id,
        username: actor.usernameOrEmail,
        displayName: actor.displayNameOrUsername,
        avatarUrl: actor.avatarUrl,
        isVerified: actor.isVerified,
      ),
      target: NotificationTarget(
        id: roomId,
        type: 'chat_room',
        title: roomName,
      ),
    );

    return await createNotification(request);
  }

  Future<Notification> createStoryReactionNotification({
    required String userId,
    required User actor,
    required String storyId,
    String? reactionEmoji,
  }) async {
    final request = CreateNotificationRequest(
      userId: userId,
      type: NotificationType.storyReaction,
      title: actor.displayNameOrUsername,
      body: 'reacted to your story${reactionEmoji != null ? ' with $reactionEmoji' : ''}',
      actionUrl: '/story/$storyId',
      actionText: 'View Story',
      actor: NotificationActor(
        id: actor.id,
        username: actor.usernameOrEmail,
        displayName: actor.displayNameOrUsername,
        avatarUrl: actor.avatarUrl,
        isVerified: actor.isVerified,
      ),
      target: NotificationTarget(
        id: storyId,
        type: 'story',
      ),
    );

    return await createNotification(request);
  }

  Future<Notification> createMentionNotification({
    required String userId,
    required User actor,
    required String targetId,
    required String targetType,
    String? mentionContent,
  }) async {
    final request = CreateNotificationRequest(
      userId: userId,
      type: NotificationType.mention,
      title: actor.displayNameOrUsername,
      body: 'mentioned you in a $targetType${mentionContent != null ? ': "$mentionContent"' : ''}',
      actionUrl: '/$targetType/$targetId',
      actionText: 'View $targetType',
      actor: NotificationActor(
        id: actor.id,
        username: actor.usernameOrEmail,
        displayName: actor.displayNameOrUsername,
        avatarUrl: actor.avatarUrl,
        isVerified: actor.isVerified,
      ),
      target: NotificationTarget(
        id: targetId,
        type: targetType,
      ),
    );

    return await createNotification(request);
  }

  // Notification Retrieval
  Future<List<Notification>> getUserNotifications({
    required String userId,
    NotificationQuery? query,
  }) async {
    try {
      var dbQuery = _supabaseService.client
          .from('notifications')
          .select('*')
          .eq('user_id', userId);

      // Apply query parameters
      if (query != null) {
        final params = query.toParams();
        for (final entry in params.entries) {
          if (entry.value != null) {
            dbQuery = dbQuery.eq(entry.key, entry.value);
          }
        }
      }

      final response = await dbQuery
          .order('created_at', ascending: false)
          .limit(query?.limit ?? 50);

      return response.map((data) => Notification.fromDatabaseJson(data)).toList();
    } catch (e) {
      throw AppException('Failed to load notifications: ${e.toString()}');
    }
  }

  Future<Notification?> getNotification(String notificationId) async {
    try {
      final response = await _supabaseService.client
          .from('notifications')
          .select('*')
          .eq('id', notificationId)
          .single();

      return Notification.fromDatabaseJson(response);
    } catch (e) {
      if (e is PostgrestException && e.code == 'PGRST116') {
        return null; // Not found
      }
      throw AppException('Failed to get notification: ${e.toString()}');
    }
  }

  Future<int> getUnreadCount(String userId) async {
    try {
      final response = await _supabaseService.client
          .from('notifications')
          .select('id')
          .eq('user_id', userId)
          .eq('is_read', false);

      return response.length;
    } catch (e) {
      throw AppException('Failed to get unread count: ${e.toString()}');
    }
  }

  // Notification Actions
  Future<bool> markAsRead(String notificationId) async {
    try {
      await _supabaseService.client
          .from('notifications')
          .update({
            'is_read': true,
            'read_at': DateTime.now().toIso8601String(),
          })
          .eq('id', notificationId);

      return true;
    } catch (e) {
      throw AppException('Failed to mark notification as read: ${e.toString()}');
    }
  }

  Future<bool> markAllAsRead(String userId) async {
    try {
      await _supabaseService.client
          .from('notifications')
          .update({
            'is_read': true,
            'read_at': DateTime.now().toIso8601String(),
          })
          .eq('user_id', userId)
          .eq('is_read', false);

      return true;
    } catch (e) {
      throw AppException('Failed to mark all notifications as read: ${e.toString()}');
    }
  }

  Future<bool> deleteNotification(String notificationId) async {
    try {
      await _supabaseService.client
          .from('notifications')
          .delete()
          .eq('id', notificationId);

      return true;
    } catch (e) {
      throw AppException('Failed to delete notification: ${e.toString()}');
    }
  }

  // Notification Settings
  Future<NotificationSettings> getNotificationSettings(String userId) async {
    try {
      final response = await _supabaseService.client
          .from('notification_settings')
          .select('*')
          .eq('user_id', userId)
          .single();

      return NotificationSettings.fromJson(response);
    } catch (e) {
      // Return default settings if not found
      return NotificationSettings(userId: userId);
    }
  }

  Future<bool> updateNotificationSettings(String userId, NotificationSettings settings) async {
    try {
      await _supabaseService.client
          .from('notification_settings')
          .upsert({
            'user_id': userId,
            'push_notifications': settings.pushNotifications,
            'email_notifications': settings.emailNotifications,
            'in_app_notifications': settings.inAppNotifications,
            'likes_enabled': settings.likesEnabled,
            'comments_enabled': settings.commentsEnabled,
            'follows_enabled': settings.followsEnabled,
            'messages_enabled': settings.messagesEnabled,
            'mentions_enabled': settings.mentionsEnabled,
            'story_reactions_enabled': settings.storyReactionsEnabled,
            'story_replies_enabled': settings.storyRepliesEnabled,
            'story_views_enabled': settings.storyViewsEnabled,
            'post_shares_enabled': settings.postSharesEnabled,
            'system_notifications_enabled': settings.systemNotificationsEnabled,
            'custom_settings': settings.customSettings,
          }, onConflict: 'user_id');

      return true;
    } catch (e) {
      throw AppException('Failed to update notification settings: ${e.toString()}');
    }
  }

  // Statistics
  Future<NotificationStats> getNotificationStats(String userId) async {
    try {
      final response = await _supabaseService.client
          .rpc('get_notification_stats', params: {'user_id': userId});

      return NotificationStats(
        totalNotifications: response['total_notifications'] ?? 0,
        unreadNotifications: response['unread_notifications'] ?? 0,
        notificationsToday: response['notifications_today'] ?? 0,
        notificationsThisWeek: response['notifications_this_week'] ?? 0,
        notificationsThisMonth: response['notifications_this_month'] ?? 0,
        typeCounts: Map<String, int>.from(response['type_counts'] ?? {}),
      );
    } catch (e) {
      throw AppException('Failed to get notification stats: ${e.toString()}');
    }
  }

  // Real-time Subscriptions
  Stream<List<Notification>> subscribeToNotifications(String userId) {
    return _supabaseService.client
        .from('notifications')
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .map((event) {
          return event.map((data) => Notification.fromDatabaseJson(data)).toList();
        });
  }

  Stream<int> subscribeToUnreadCount(String userId) {
    return _supabaseService.client
        .from('notifications')
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .eq('is_read', false)
        .map((event) => event.length);
  }

  // Push Notification Sending
  Future<void> _sendPushNotification(CreateNotificationRequest request) async {
    try {
      // Get user's notification settings
      final settings = await getNotificationSettings(request.userId);

      // Check if notifications are enabled for this type
      if (!settings.isNotificationTypeEnabled(request.type)) {
        return;
      }

      // Create push notification payload
      final payload = PushNotificationPayload(
        title: request.title,
        body: request.body,
        data: {
          'notification_id': _generateId(),
          'type': request.type.name,
          'action_url': request.actionUrl,
          'action_data': request.actionData,
        },
      );

      // In a real implementation, this would use a service like Firebase Cloud Messaging
      // For now, we'll just store the push notification data
      await _supabaseService.client.from('push_notifications').insert({
        'id': _generateId(),
        'user_id': request.userId,
        'title': payload.title,
        'body': payload.body,
        'data': payload.toJson(),
        'created_at': DateTime.now().toIso8601String(),
        'sent_at': DateTime.now().toIso8601String(),
        'status': 'pending',
      });
    } catch (e) {
      // Push notifications are not critical, so we don't throw
      print('Failed to send push notification: $e');
    }
  }

  // Batch Operations
  Future<void> createBulkNotifications(List<CreateNotificationRequest> requests) async {
    try {
      final notificationsData = requests.map((request) => {
        'id': _generateId(),
        'user_id': request.userId,
        'type': request.type.name,
        'title': request.title,
        'body': request.body,
        'created_at': DateTime.now().toIso8601String(),
        'is_read': false,
        'action_url': request.actionUrl,
        'action_text': request.actionText,
        'action_data': request.actionData,
        'metadata': request.metadata,
        'actor_id': request.actor?.id,
        'target_id': request.target?.id,
        'actor_data': request.actor?.toJson(),
        'target_data': request.target?.toJson(),
      }).toList();

      await _supabaseService.client
          .from('notifications')
          .insert(notificationsData);

      // Send push notifications in parallel
      await Future.wait(
        requests.map((request) => _sendPushNotification(request)),
        eagerError: false,
      );
    } catch (e) {
      throw AppException('Failed to create bulk notifications: ${e.toString()}');
    }
  }

  // Cleanup old notifications
  Future<bool> cleanupOldNotifications({int daysToKeep = 30}) async {
    try {
      final cutoffDate = DateTime.now().subtract(Duration(days: daysToKeep));

      await _supabaseService.client
          .from('notifications')
          .delete()
          .lt('created_at', cutoffDate.toIso8601String())
          .eq('is_read', true);

      return true;
    } catch (e) {
      throw AppException('Failed to cleanup old notifications: ${e.toString()}');
    }
  }

  // Helper methods
  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString() +
        (DateTime.now().microsecond % 1000).toString().padLeft(3, '0');
  }

  void dispose() {
    _notificationsSubscription?.cancel();
  }
}