import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    required String id,
    required String name,
    required ChatType type,
    @Default([]) List<String> participantIds,
    @Default([]) List<ChatParticipant> participants,
    Message? lastMessage,
    @Default(0) int unreadCount,
    @Default(false) bool isMuted,
    @Default(false) bool isArchived,
    @Default(false) bool isPinned,
    DateTime? lastActivityAt,
    String? createdBy,
    String? description,
    String? avatarUrl,
    Map<String, dynamic>? metadata,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);

  const ChatRoom._();

  bool get isGroup => type == ChatType.group;
  bool get isDirect => type == ChatType.direct;
  bool get isBroadcast => type == ChatType.broadcast;
  bool get hasLastMessage => lastMessage != null;
  bool get isActive => lastActivityAt != null &&
      DateTime.now().difference(lastActivityAt!).inMinutes < 30;
  String get displayName => name;
  String get formattedLastActivity => _formatTimeAgo(lastActivityAt);
  String get formattedUnreadCount => unreadCount > 99 ? '99+' : unreadCount.toString();

  static String _formatTimeAgo(DateTime? dateTime) {
    if (dateTime == null) return '';
    final difference = DateTime.now().difference(dateTime);
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

  ChatRoom copyWithUpdatedMessage(Message message) {
    return copyWith(
      lastMessage: message,
      lastActivityAt: message.createdAt,
      unreadCount: isDirect ? 0 : unreadCount + 1, // Don't increment unread for direct messages when sending
    );
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'name': name,
      'type': type.name,
      'participant_ids': participantIds,
      'unread_count': unreadCount,
      'is_muted': isMuted,
      'is_archived': isArchived,
      'is_pinned': isPinned,
      'last_activity_at': lastActivityAt?.toIso8601String(),
      'created_by': createdBy,
      'description': description,
      'avatar_url': avatarUrl,
      'metadata': metadata,
    };
  }

  static ChatRoom fromDatabaseJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['id'] as String,
      name: json['name'] as String,
      type: ChatType.values.firstWhere(
        (v) => v.name == json['type'],
        orElse: () => ChatType.direct,
      ),
      participantIds: (json['participant_ids'] as List<dynamic>?)?.cast<String>() ?? [],
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
      isMuted: json['is_muted'] as bool? ?? false,
      isArchived: json['is_archived'] as bool? ?? false,
      isPinned: json['is_pinned'] as bool? ?? false,
      lastActivityAt: json['last_activity_at'] != null
          ? DateTime.parse(json['last_activity_at'] as String)
          : null,
      createdBy: json['created_by'] as String?,
      description: json['description'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }
}

@freezed
class ChatParticipant with _$ChatParticipant {
  const factory ChatParticipant({
    required String userId,
    required String username,
    required String displayName,
    String? avatarUrl,
    @Default(false) bool isAdmin,
    @Default(ParticipantStatus.member) ParticipantStatus status,
    @Default(false) bool isOnline,
    DateTime? lastSeenAt,
    DateTime? joinedAt,
    Map<String, dynamic>? permissions,
  }) = _ChatParticipant;

  factory ChatParticipant.fromJson(Map<String, dynamic> json) => _$ChatParticipantFromJson(json);

  const ChatParticipant._();

  String get displayNameOrUsername => displayName.isNotEmpty ? displayName : username;
  bool get isAway => !isOnline && lastSeenAt != null &&
      DateTime.now().difference(lastSeenAt!).inMinutes < 60;
  String get statusText {
    if (isOnline) return 'Online';
    if (isAway) return 'Away';
    if (lastSeenAt != null) return 'Last seen ${_formatLastSeen(lastSeenAt!)}';
    return 'Offline';
  }

  static String _formatLastSeen(DateTime lastSeen) {
    final difference = DateTime.now().difference(lastSeen);
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
class Message with _$Message {
  const factory Message({
    required String id,
    required String roomId,
    required String senderId,
    required String content,
    required MessageType type,
    required MessageStatus status,
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? readAt,
    String? replyToId,
    Message? replyToMessage,
    @Default([]) List<MessageAttachment> attachments,
    @Default([]) List<MessageReaction> reactions,
    @Default(false) bool isEdited,
    Map<String, dynamic>? metadata,
    SenderInfo? sender,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  const Message._();

  bool get isText => type == MessageType.text;
  bool get isImage => type == MessageType.image;
  bool get isVideo => type == MessageType.video;
  bool get isAudio => type == MessageType.audio;
  bool get isFile => type == MessageType.file;
  bool get isSystem => type == MessageType.system;
  bool get hasAttachments => attachments.isNotEmpty;
  bool get hasReactions => reactions.isNotEmpty;
  bool get isReply => replyToId != null;
  bool get isFromCurrentUser => false; // Will be set by provider
  String get timeAgo => _formatTimeAgo(createdAt);
  String get displayContent => _getDisplayContent();

  static String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return dateTime.toString().substring(0, 10);
    } else if (difference.inHours > 0) {
      return '${difference.inHours}:${(difference.inMinutes % 60).toString().padLeft(2, '0')}';
    } else {
      return '${difference.inMinutes}:${(difference.inSeconds % 60).toString().padLeft(2, '0')}';
    }
  }

  String _getDisplayContent() {
    switch (type) {
      case MessageType.text:
        return content;
      case MessageType.image:
        return '📷 Photo';
      case MessageType.video:
        return '🎥 Video';
      case MessageType.audio:
        return '🎵 Audio';
      case MessageType.file:
        return '📎 File';
      case MessageType.system:
        return content;
      default:
        return content;
    }
  }

  Message copyWithRead() {
    return copyWith(
      status: MessageStatus.read,
      readAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'room_id': roomId,
      'sender_id': senderId,
      'content': content,
      'type': type.name,
      'status': status.name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'read_at': readAt?.toIso8601String(),
      'reply_to_id': replyToId,
      'is_edited': isEdited,
      'metadata': metadata,
    };
  }

  static Message fromDatabaseJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      roomId: json['room_id'] as String,
      senderId: json['sender_id'] as String,
      content: json['content'] as String,
      type: MessageType.values.firstWhere(
        (v) => v.name == json['type'],
        orElse: () => MessageType.text,
      ),
      status: MessageStatus.values.firstWhere(
        (v) => v.name == json['status'],
        orElse: () => MessageStatus.sent,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      readAt: json['read_at'] != null
          ? DateTime.parse(json['read_at'] as String)
          : null,
      replyToId: json['reply_to_id'] as String?,
      isEdited: json['is_edited'] as bool? ?? false,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }
}

@freezed
class SenderInfo with _$SenderInfo {
  const factory SenderInfo({
    required String id,
    required String username,
    required String displayName,
    String? avatarUrl,
    @Default(false) bool isVerified,
    @Default(false) bool isOnline,
  }) = _SenderInfo;

  factory SenderInfo.fromJson(Map<String, dynamic> json) => _$SenderInfoFromJson(json);

  const SenderInfo._();

  String get displayNameOrUsername => displayName.isNotEmpty ? displayName : username;
}

@freezed
class MessageAttachment with _$MessageAttachment {
  const factory MessageAttachment({
    required String id,
    required String messageId,
    required String url,
    required AttachmentType type,
    required String filename,
    @Default(0) int sizeBytes,
    @Default(0) int width,
    @Default(0) int height,
    @Default(0) int duration,
    String? thumbnailUrl,
    String? mimeType,
    Map<String, dynamic>? metadata,
  }) = _MessageAttachment;

  factory MessageAttachment.fromJson(Map<String, dynamic> json) => _$MessageAttachmentFromJson(json);

  const MessageAttachment._();

  bool get isImage => type == AttachmentType.image;
  bool get isVideo => type == AttachmentType.video;
  bool get isAudio => type == AttachmentType.audio;
  bool get isDocument => type == AttachmentType.document;
  String get formattedSize => _formatSize(sizeBytes);
  String get formattedDuration => _formatDuration(duration);

  static String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  static String _formatDuration(int seconds) {
    if (seconds <= 0) return '0:00';
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

@freezed
class MessageReaction with _$MessageReaction {
  const factory MessageReaction({
    required String id,
    required String messageId,
    required String userId,
    required String emoji,
    required DateTime createdAt,
  }) = _MessageReaction;

  factory MessageReaction.fromJson(Map<String, dynamic> json) => _$MessageReactionFromJson(json);
}

@freezed
class TypingIndicator with _$TypingIndicator {
  const factory TypingIndicator({
    required String roomId,
    required String userId,
    required DateTime startedAt,
  }) = _TypingIndicator;

  factory TypingIndicator.fromJson(Map<String, dynamic> json) => _$TypingIndicatorFromJson(json);
}

@freezed
class OnlineStatus with _$OnlineStatus {
  const factory OnlineStatus({
    required String userId,
    required UserPresence presence,
    DateTime? lastSeenAt,
    String? status,
  }) = _OnlineStatus;

  factory OnlineStatus.fromJson(Map<String, dynamic> json) => _$OnlineStatusFromJson(json);
}

// Enums
enum ChatType {
  direct,
  group,
  broadcast,
}

enum MessageType {
  text,
  image,
  video,
  audio,
  file,
  system,
}

enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
  failed,
}

enum AttachmentType {
  image,
  video,
  audio,
  document,
}

enum ParticipantStatus {
  member,
  admin,
  owner,
  left,
  removed,
}

enum UserPresence {
  online,
  away,
  offline,
  invisible,
}

// Request Models
@freezed
class CreateChatRoomRequest with _$CreateChatRoomRequest {
  const factory CreateChatRoomRequest({
    required String name,
    required ChatType type,
    @Default([]) List<String> participantIds,
    String? description,
    String? avatarUrl,
  }) = _CreateChatRoomRequest;

  const CreateChatRoomRequest._();

  bool get isGroup => type == ChatType.group;
  bool get isDirect => type == ChatType.direct;
}

@freezed
class SendMessageRequest with _$SendMessageRequest {
  const factory SendMessageRequest({
    required String roomId,
    required String content,
    required MessageType type,
    String? replyToId,
    @Default([]) List<FileAttachment> attachments,
  }) = _SendMessageRequest;

  const SendMessageRequest._();

  bool get hasAttachments => attachments.isNotEmpty;
  bool get isTextMessage => type == MessageType.text && attachments.isEmpty;
}

@freezed
class FileAttachment with _$FileAttachment {
  const factory FileAttachment({
    required dynamic file, // Will be File from dart:io
    required AttachmentType type,
    required String filename,
    Map<String, dynamic>? metadata,
  }) = _FileAttachment;

  const FileAttachment._();
}

// Chat Statistics
@freezed
class ChatStats with _$ChatStats {
  const factory ChatStats({
    required int totalMessages,
    required int totalRooms,
    required int unreadMessages,
    @Default(0) int messagesToday,
    @Default(0) int messagesThisWeek,
    @Default(0) int messagesThisMonth,
    @Default(0) int activeRooms,
  }) = _ChatStats;

  factory ChatStats.fromJson(Map<String, dynamic> json) => _$ChatStatsFromJson(json);
}

// Search Results
@freezed
class ChatSearchResult with _$ChatSearchResult {
  const factory ChatSearchResult({
    required List<ChatRoom> rooms,
    required List<Message> messages,
    required List<ChatParticipant> participants,
    required String query,
    required DateTime searchedAt,
  }) = _ChatSearchResult;

  factory ChatSearchResult.fromJson(Map<String, dynamic> json) => _$ChatSearchResultFromJson(json);

  const ChatSearchResult._();

  bool get hasResults => rooms.isNotEmpty || messages.isNotEmpty || participants.isNotEmpty;
  int get totalResults => rooms.length + messages.length + participants.length;
}