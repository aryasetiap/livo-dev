// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomImpl _$$ChatRoomImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ChatTypeEnumMap, json['type']),
      participantIds:
          (json['participantIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      participants:
          (json['participants'] as List<dynamic>?)
              ?.map((e) => ChatParticipant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastMessage: json['lastMessage'] == null
          ? null
          : Message.fromJson(json['lastMessage'] as Map<String, dynamic>),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      isMuted: json['isMuted'] as bool? ?? false,
      isArchived: json['isArchived'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
      lastActivityAt: json['lastActivityAt'] == null
          ? null
          : DateTime.parse(json['lastActivityAt'] as String),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChatRoomImplToJson(_$ChatRoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ChatTypeEnumMap[instance.type]!,
      'participantIds': instance.participantIds,
      'participants': instance.participants,
      'lastMessage': instance.lastMessage,
      'unreadCount': instance.unreadCount,
      'isMuted': instance.isMuted,
      'isArchived': instance.isArchived,
      'isPinned': instance.isPinned,
      'lastActivityAt': instance.lastActivityAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'description': instance.description,
      'avatarUrl': instance.avatarUrl,
      'metadata': instance.metadata,
    };

const _$ChatTypeEnumMap = {
  ChatType.direct: 'direct',
  ChatType.group: 'group',
  ChatType.broadcast: 'broadcast',
};

_$ChatParticipantImpl _$$ChatParticipantImplFromJson(
  Map<String, dynamic> json,
) => _$ChatParticipantImpl(
  userId: json['userId'] as String,
  username: json['username'] as String,
  displayName: json['displayName'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  isAdmin: json['isAdmin'] as bool? ?? false,
  status:
      $enumDecodeNullable(_$ParticipantStatusEnumMap, json['status']) ??
      ParticipantStatus.member,
  isOnline: json['isOnline'] as bool? ?? false,
  lastSeenAt: json['lastSeenAt'] == null
      ? null
      : DateTime.parse(json['lastSeenAt'] as String),
  joinedAt: json['joinedAt'] == null
      ? null
      : DateTime.parse(json['joinedAt'] as String),
  permissions: json['permissions'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$ChatParticipantImplToJson(
  _$ChatParticipantImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'username': instance.username,
  'displayName': instance.displayName,
  'avatarUrl': instance.avatarUrl,
  'isAdmin': instance.isAdmin,
  'status': _$ParticipantStatusEnumMap[instance.status]!,
  'isOnline': instance.isOnline,
  'lastSeenAt': instance.lastSeenAt?.toIso8601String(),
  'joinedAt': instance.joinedAt?.toIso8601String(),
  'permissions': instance.permissions,
};

const _$ParticipantStatusEnumMap = {
  ParticipantStatus.member: 'member',
  ParticipantStatus.admin: 'admin',
  ParticipantStatus.owner: 'owner',
  ParticipantStatus.left: 'left',
  ParticipantStatus.removed: 'removed',
};

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      roomId: json['roomId'] as String,
      senderId: json['senderId'] as String,
      content: json['content'] as String,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      status: $enumDecode(_$MessageStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      replyToId: json['replyToId'] as String?,
      replyToMessage: json['replyToMessage'] == null
          ? null
          : Message.fromJson(json['replyToMessage'] as Map<String, dynamic>),
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map(
                (e) => MessageAttachment.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      reactions:
          (json['reactions'] as List<dynamic>?)
              ?.map((e) => MessageReaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isEdited: json['isEdited'] as bool? ?? false,
      metadata: json['metadata'] as Map<String, dynamic>?,
      sender: json['sender'] == null
          ? null
          : SenderInfo.fromJson(json['sender'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'senderId': instance.senderId,
      'content': instance.content,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'replyToId': instance.replyToId,
      'replyToMessage': instance.replyToMessage,
      'attachments': instance.attachments,
      'reactions': instance.reactions,
      'isEdited': instance.isEdited,
      'metadata': instance.metadata,
      'sender': instance.sender,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.audio: 'audio',
  MessageType.file: 'file',
  MessageType.system: 'system',
};

const _$MessageStatusEnumMap = {
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
  MessageStatus.failed: 'failed',
};

_$SenderInfoImpl _$$SenderInfoImplFromJson(Map<String, dynamic> json) =>
    _$SenderInfoImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      displayName: json['displayName'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      isOnline: json['isOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$$SenderInfoImplToJson(_$SenderInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'isVerified': instance.isVerified,
      'isOnline': instance.isOnline,
    };

_$MessageAttachmentImpl _$$MessageAttachmentImplFromJson(
  Map<String, dynamic> json,
) => _$MessageAttachmentImpl(
  id: json['id'] as String,
  messageId: json['messageId'] as String,
  url: json['url'] as String,
  type: $enumDecode(_$AttachmentTypeEnumMap, json['type']),
  filename: json['filename'] as String,
  sizeBytes: (json['sizeBytes'] as num?)?.toInt() ?? 0,
  width: (json['width'] as num?)?.toInt() ?? 0,
  height: (json['height'] as num?)?.toInt() ?? 0,
  duration: (json['duration'] as num?)?.toInt() ?? 0,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  mimeType: json['mimeType'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$MessageAttachmentImplToJson(
  _$MessageAttachmentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'messageId': instance.messageId,
  'url': instance.url,
  'type': _$AttachmentTypeEnumMap[instance.type]!,
  'filename': instance.filename,
  'sizeBytes': instance.sizeBytes,
  'width': instance.width,
  'height': instance.height,
  'duration': instance.duration,
  'thumbnailUrl': instance.thumbnailUrl,
  'mimeType': instance.mimeType,
  'metadata': instance.metadata,
};

const _$AttachmentTypeEnumMap = {
  AttachmentType.image: 'image',
  AttachmentType.video: 'video',
  AttachmentType.audio: 'audio',
  AttachmentType.document: 'document',
};

_$MessageReactionImpl _$$MessageReactionImplFromJson(
  Map<String, dynamic> json,
) => _$MessageReactionImpl(
  id: json['id'] as String,
  messageId: json['messageId'] as String,
  userId: json['userId'] as String,
  emoji: json['emoji'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$MessageReactionImplToJson(
  _$MessageReactionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'messageId': instance.messageId,
  'userId': instance.userId,
  'emoji': instance.emoji,
  'createdAt': instance.createdAt.toIso8601String(),
};

_$TypingIndicatorImpl _$$TypingIndicatorImplFromJson(
  Map<String, dynamic> json,
) => _$TypingIndicatorImpl(
  roomId: json['roomId'] as String,
  userId: json['userId'] as String,
  startedAt: DateTime.parse(json['startedAt'] as String),
);

Map<String, dynamic> _$$TypingIndicatorImplToJson(
  _$TypingIndicatorImpl instance,
) => <String, dynamic>{
  'roomId': instance.roomId,
  'userId': instance.userId,
  'startedAt': instance.startedAt.toIso8601String(),
};

_$OnlineStatusImpl _$$OnlineStatusImplFromJson(Map<String, dynamic> json) =>
    _$OnlineStatusImpl(
      userId: json['userId'] as String,
      presence: $enumDecode(_$UserPresenceEnumMap, json['presence']),
      lastSeenAt: json['lastSeenAt'] == null
          ? null
          : DateTime.parse(json['lastSeenAt'] as String),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$OnlineStatusImplToJson(_$OnlineStatusImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'presence': _$UserPresenceEnumMap[instance.presence]!,
      'lastSeenAt': instance.lastSeenAt?.toIso8601String(),
      'status': instance.status,
    };

const _$UserPresenceEnumMap = {
  UserPresence.online: 'online',
  UserPresence.away: 'away',
  UserPresence.offline: 'offline',
  UserPresence.invisible: 'invisible',
};

_$ChatStatsImpl _$$ChatStatsImplFromJson(Map<String, dynamic> json) =>
    _$ChatStatsImpl(
      totalMessages: (json['totalMessages'] as num).toInt(),
      totalRooms: (json['totalRooms'] as num).toInt(),
      unreadMessages: (json['unreadMessages'] as num).toInt(),
      messagesToday: (json['messagesToday'] as num?)?.toInt() ?? 0,
      messagesThisWeek: (json['messagesThisWeek'] as num?)?.toInt() ?? 0,
      messagesThisMonth: (json['messagesThisMonth'] as num?)?.toInt() ?? 0,
      activeRooms: (json['activeRooms'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ChatStatsImplToJson(_$ChatStatsImpl instance) =>
    <String, dynamic>{
      'totalMessages': instance.totalMessages,
      'totalRooms': instance.totalRooms,
      'unreadMessages': instance.unreadMessages,
      'messagesToday': instance.messagesToday,
      'messagesThisWeek': instance.messagesThisWeek,
      'messagesThisMonth': instance.messagesThisMonth,
      'activeRooms': instance.activeRooms,
    };

_$ChatSearchResultImpl _$$ChatSearchResultImplFromJson(
  Map<String, dynamic> json,
) => _$ChatSearchResultImpl(
  rooms: (json['rooms'] as List<dynamic>)
      .map((e) => ChatRoom.fromJson(e as Map<String, dynamic>))
      .toList(),
  messages: (json['messages'] as List<dynamic>)
      .map((e) => Message.fromJson(e as Map<String, dynamic>))
      .toList(),
  participants: (json['participants'] as List<dynamic>)
      .map((e) => ChatParticipant.fromJson(e as Map<String, dynamic>))
      .toList(),
  query: json['query'] as String,
  searchedAt: DateTime.parse(json['searchedAt'] as String),
);

Map<String, dynamic> _$$ChatSearchResultImplToJson(
  _$ChatSearchResultImpl instance,
) => <String, dynamic>{
  'rooms': instance.rooms,
  'messages': instance.messages,
  'participants': instance.participants,
  'query': instance.query,
  'searchedAt': instance.searchedAt.toIso8601String(),
};
