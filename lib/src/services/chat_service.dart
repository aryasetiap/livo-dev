import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/errors/app_exception.dart';
import '../core/services/supabase_service.dart';
import '../shared/models/chat_model.dart';
import '../shared/models/user_model.dart';

class ChatService {
  final SupabaseService _supabaseService;
  StreamSubscription? _messagesSubscription;
  StreamSubscription? _roomsSubscription;
  StreamSubscription? _typingSubscription;
  StreamSubscription? _presenceSubscription;

  ChatService(this._supabaseService);

  // Chat Room Management
  Future<ChatRoom> createChatRoom(CreateChatRoomRequest request) async {
    try {
      final roomId = _generateId();
      final roomData = {
        'id': roomId,
        'name': request.name,
        'type': request.type.name,
        'participant_ids': [request.type == ChatType.direct
          ? request.participantIds.first
          : _supabaseService.client.auth.currentUser?.id, ...request.participantIds],
        'unread_count': 0,
        'is_muted': false,
        'is_archived': false,
        'is_pinned': false,
        'last_activity_at': DateTime.now().toIso8601String(),
        'created_by': _supabaseService.client.auth.currentUser?.id,
        'description': request.description,
        'avatar_url': request.avatarUrl,
      };

      final response = await _supabaseService.client
          .from('chat_rooms')
          .insert(roomData)
          .select()
          .single();

      // Add participants
      await _addParticipantsToRoom(roomId, request.participantIds);

      return ChatRoom.fromDatabaseJson(response);
    } catch (e) {
      throw AppException('Failed to create chat room: ${e.toString()}');
    }
  }

  Future<ChatRoom?> getDirectChatRoom(String userId1, String userId2) async {
    try {
      final response = await _supabaseService.client
          .from('chat_rooms')
          .select('*')
          .eq('type', ChatType.direct.name)
          .contains('participant_ids', [userId1, userId2])
          .maybeSingle();

      return response != null ? ChatRoom.fromDatabaseJson(response) : null;
    } catch (e) {
      throw AppException('Failed to get direct chat room: ${e.toString()}');
    }
  }

  Future<List<ChatRoom>> getUserChatRooms(String userId, {int limit = 50}) async {
    try {
      final response = await _supabaseService.client
          .from('chat_rooms')
          .select('''
            *,
            last_message:messages(
              id,
              content,
              type,
              created_at,
              sender_id,
              sender_info:sender(
                id,
                username,
                display_name,
                avatar_url
              )
            ).order(created_at, desc: true).limit(1)
          ''')
          .contains('participant_ids', [userId])
          .eq('is_archived', false)
          .order('last_activity_at', ascending: false)
          .limit(limit);

      final rooms = <ChatRoom>[];
      for (final roomData in response) {
        final room = ChatRoom.fromDatabaseJson(roomData);

        // Set last message if available
        if (roomData['last_message'] != null && roomData['last_message'].isNotEmpty) {
          final lastMessageData = roomData['last_message'][0];
          final senderInfo = lastMessageData['sender_info'] != null
              ? SenderInfo(
                  id: lastMessageData['sender_info']['id'],
                  username: lastMessageData['sender_info']['username'] ?? '',
                  displayName: lastMessageData['sender_info']['display_name'] ?? '',
                  avatarUrl: lastMessageData['sender_info']['avatar_url'],
                )
              : null;

          final lastMessage = Message(
            id: lastMessageData['id'],
            roomId: room.id,
            senderId: lastMessageData['sender_id'],
            content: lastMessageData['content'],
            type: MessageType.values.firstWhere(
              (v) => v.name == lastMessageData['type'],
              orElse: () => MessageType.text,
            ),
            status: MessageStatus.sent,
            createdAt: DateTime.parse(lastMessageData['created_at']),
            sender: senderInfo,
          );

          rooms.add(room.copyWith(lastMessage: lastMessage));
        } else {
          rooms.add(room);
        }
      }

      return rooms;
    } catch (e) {
      throw AppException('Failed to load chat rooms: ${e.toString()}');
    }
  }

  Future<ChatRoom> getChatRoom(String roomId) async {
    try {
      final response = await _supabaseService.client
          .from('chat_rooms')
          .select('*')
          .eq('id', roomId)
          .single();

      return ChatRoom.fromDatabaseJson(response);
    } catch (e) {
      throw AppException('Failed to get chat room: ${e.toString()}');
    }
  }

  // Message Management
  Future<Message> sendMessage(SendMessageRequest request) async {
    try {
      final messageId = _generateId();
      final messageData = {
        'id': messageId,
        'room_id': request.roomId,
        'sender_id': _supabaseService.client.auth.currentUser?.id,
        'content': request.content,
        'type': request.type.name,
        'status': MessageStatus.sending.name,
        'created_at': DateTime.now().toIso8601String(),
        'reply_to_id': request.replyToId,
        'is_edited': false,
      };

      // Insert message
      final response = await _supabaseService.client
          .from('messages')
          .insert(messageData)
          .select()
          .single();

      // Update room's last activity
      await _supabaseService.client
          .from('chat_rooms')
          .update({
            'last_activity_at': DateTime.now().toIso8601String(),
          })
          .eq('id', request.roomId);

      // Process attachments
      final attachments = <MessageAttachment>[];
      if (request.attachments.isNotEmpty) {
        attachments.addAll(await _uploadAttachments(messageId, request.attachments));
      }

      // Get sender info
      final senderResponse = await _supabaseService.client
          .from('profiles')
          .select('id, username, display_name, avatar_url, is_verified')
          .eq('id', _supabaseService.client.auth.currentUser?.id)
          .single();

      final senderInfo = SenderInfo(
        id: senderResponse['id'],
        username: senderResponse['username'] ?? '',
        displayName: senderResponse['display_name'] ?? '',
        avatarUrl: senderResponse['avatar_url'],
        isVerified: senderResponse['is_verified'] ?? false,
      );

      final message = Message(
        id: response['id'],
        roomId: response['room_id'],
        senderId: response['sender_id'],
        content: response['content'],
        type: MessageType.values.firstWhere(
          (v) => v.name == response['type'],
          orElse: () => MessageType.text,
        ),
        status: MessageStatus.sent,
        createdAt: DateTime.parse(response['created_at']),
        replyToId: response['reply_to_id'],
        isEdited: response['is_edited'] ?? false,
        attachments: attachments,
        sender: senderInfo,
      );

      return message;
    } catch (e) {
      throw AppException('Failed to send message: ${e.toString()}');
    }
  }

  Future<List<Message>> getMessages(String roomId, {int limit = 50, String? beforeMessageId}) async {
    try {
      var query = _supabaseService.client
          .from('messages')
          .select('''
            *,
            reply_to_message:reply_to(
              id,
              content,
              type,
              sender_id
            ),
            sender_info:sender(
              id,
              username,
              display_name,
              avatar_url,
              is_verified
            ),
            attachments:message_attachments(*)
          ''')
          .eq('room_id', roomId)
          .order('created_at', ascending: false)
          .limit(limit);

      if (beforeMessageId != null) {
        // Get the timestamp of the before message
        final beforeMessage = await _supabaseService.client
            .from('messages')
            .select('created_at')
            .eq('id', beforeMessageId)
            .single();

        query = query.lt('created_at', beforeMessage['created_at']);
      }

      final response = await query;

      final messages = response.map((data) {
        final replyToMessage = data['reply_to_message'] != null
            ? Message(
                id: data['reply_to_message']['id'],
                roomId: roomId,
                senderId: data['reply_to_message']['sender_id'],
                content: data['reply_to_message']['content'],
                type: MessageType.values.firstWhere(
                  (v) => v.name == data['reply_to_message']['type'],
                  orElse: () => MessageType.text,
                ),
                status: MessageStatus.sent,
                createdAt: DateTime.now(), // Will be set properly
              )
            : null;

        final senderInfo = data['sender_info'] != null
            ? SenderInfo(
                id: data['sender_info']['id'],
                username: data['sender_info']['username'] ?? '',
                displayName: data['sender_info']['display_name'] ?? '',
                avatarUrl: data['sender_info']['avatar_url'],
                isVerified: data['sender_info']['is_verified'] ?? false,
              )
            : null;

        final attachments = (data['attachments'] as List<dynamic>?)
            ?.map((att) => MessageAttachment(
                  id: att['id'],
                  messageId: att['message_id'],
                  url: att['url'],
                  type: AttachmentType.values.firstWhere(
                    (v) => v.name == att['type'],
                    orElse: () => AttachmentType.document,
                  ),
                  filename: att['filename'],
                  sizeBytes: att['size_bytes'] ?? 0,
                  width: att['width'] ?? 0,
                  height: att['height'] ?? 0,
                  duration: att['duration'] ?? 0,
                  thumbnailUrl: att['thumbnail_url'],
                  mimeType: att['mime_type'],
                ))
            .toList() ?? [];

        return Message(
          id: data['id'],
          roomId: data['room_id'],
          senderId: data['sender_id'],
          content: data['content'],
          type: MessageType.values.firstWhere(
            (v) => v.name == data['type'],
            orElse: () => MessageType.text,
          ),
          status: MessageStatus.values.firstWhere(
            (v) => v.name == data['status'],
            orElse: () => MessageStatus.sent,
          ),
          createdAt: DateTime.parse(data['created_at']),
          updatedAt: data['updated_at'] != null
              ? DateTime.parse(data['updated_at'])
              : null,
          readAt: data['read_at'] != null
              ? DateTime.parse(data['read_at'])
              : null,
          replyToId: data['reply_to_id'],
          replyToMessage: replyToMessage,
          isEdited: data['is_edited'] ?? false,
          metadata: data['metadata'],
          attachments: attachments,
          sender: senderInfo,
        );
      }).toList();

      // Reverse to get chronological order
      return messages.reversed.toList();
    } catch (e) {
      throw AppException('Failed to load messages: ${e.toString()}');
    }
  }

  Future<Message?> markMessageAsRead(String messageId, String userId) async {
    try {
      final response = await _supabaseService.client
          .from('messages')
          .update({
            'status': MessageStatus.read.name,
            'read_at': DateTime.now().toIso8601String(),
          })
          .eq('id', messageId)
          .select()
          .single();

      return Message.fromDatabaseJson(response);
    } catch (e) {
      throw AppException('Failed to mark message as read: ${e.toString()}');
    }
  }

  // Typing Indicators
  Future<void> startTyping(String roomId, String userId) async {
    try {
      await _supabaseService.client
          .from('typing_indicators')
          .upsert({
            'room_id': roomId,
            'user_id': userId,
            'started_at': DateTime.now().toIso8601String(),
          }, onConflict: 'room_id,user_id');
    } catch (e) {
      // Typing indicators are not critical, so we don't throw
    }
  }

  Future<void> stopTyping(String roomId, String userId) async {
    try {
      await _supabaseService.client
          .from('typing_indicators')
          .delete()
          .eq('room_id', roomId)
          .eq('user_id', userId);
    } catch (e) {
      // Typing indicators are not critical, so we don't throw
    }
  }

  // Presence Management
  Future<void> updatePresence(String userId, UserPresence presence) async {
    try {
      await _supabaseService.client
          .from('user_presence')
          .upsert({
            'user_id': userId,
            'presence': presence.name,
            'last_seen_at': DateTime.now().toIso8601String(),
          }, onConflict: 'user_id');
    } catch (e) {
      // Presence updates are not critical
    }
  }

  // Real-time Subscriptions
  Stream<List<Message>> subscribeToMessages(String roomId) {
    return _supabaseService.client
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('room_id', roomId)
        .order('created_at')
        .map((event) {
          return event.map((data) => Message.fromDatabaseJson(data)).toList();
        });
  }

  Stream<List<ChatRoom>> subscribeToChatRooms(String userId) {
    return _supabaseService.client
        .from('chat_rooms')
        .stream(primaryKey: ['id'])
        .contains('participant_ids', [userId])
        .order('last_activity_at', ascending: false)
        .map((event) {
          return event.map((data) => ChatRoom.fromDatabaseJson(data)).toList();
        });
  }

  Stream<List<TypingIndicator>> subscribeToTypingIndicators(String roomId) {
    return _supabaseService.client
        .from('typing_indicators')
        .stream(primaryKey: ['room_id', 'user_id'])
        .eq('room_id', roomId)
        .map((event) {
          return event.map((data) => TypingIndicator(
            roomId: data['room_id'],
            userId: data['user_id'],
            startedAt: DateTime.parse(data['started_at']),
          )).toList();
        });
  }

  Stream<List<OnlineStatus>> subscribeToOnlineStatus(List<String> userIds) {
    return _supabaseService.client
        .from('user_presence')
        .stream(primaryKey: ['user_id'])
        .in_('user_id', userIds)
        .map((event) {
          return event.map((data) => OnlineStatus(
            userId: data['user_id'],
            presence: UserPresence.values.firstWhere(
              (v) => v.name == data['presence'],
              orElse: () => UserPresence.offline,
            ),
            lastSeenAt: data['last_seen_at'] != null
                ? DateTime.parse(data['last_seen_at'])
                : null,
            status: data['status'],
          )).toList();
        });
  }

  // Search
  Future<ChatSearchResult> searchChats(String userId, String query) async {
    try {
      // Search chat rooms
      final roomsResponse = await _supabaseService.client
          .from('chat_rooms')
          .select('*')
          .contains('participant_ids', [userId])
          .ilike('name', '%$query%')
          .limit(10);

      final rooms = roomsResponse
          .map((data) => ChatRoom.fromDatabaseJson(data))
          .toList();

      // Search messages
      final messagesResponse = await _supabaseService.client
          .from('messages')
          .select('''
            *,
            room:chat_rooms!messages_room_id_fkey(id, name, type)
          ''')
          .in_('room_id',
            roomsResponse.map((r) => r['id']).toList())
          .ilike('content', '%$query%')
          .order('created_at', ascending: false)
          .limit(20);

      final messages = messagesResponse.map((data) {
        final room = ChatRoom(
          id: data['room']['id'],
          name: data['room']['name'],
          type: ChatType.values.firstWhere(
            (v) => v.name == data['room']['type'],
            orElse: () => ChatType.direct,
          ),
        );

        return Message.fromDatabaseJson(data).copyWith(roomId: room.id);
      }).toList();

      return ChatSearchResult(
        rooms: rooms,
        messages: messages,
        participants: [], // TODO: Implement participant search
        query: query,
        searchedAt: DateTime.now(),
      );
    } catch (e) {
      throw AppException('Failed to search chats: ${e.toString()}');
    }
  }

  // Helper methods
  Future<void> _addParticipantsToRoom(String roomId, List<String> participantIds) async {
    for (final participantId in participantIds) {
      await _supabaseService.client.from('chat_participants').insert({
        'id': _generateId(),
        'room_id': roomId,
        'user_id': participantId,
        'status': ParticipantStatus.member.name,
        'joined_at': DateTime.now().toIso8601String(),
        'is_admin': false,
      });
    }
  }

  Future<List<MessageAttachment>> _uploadAttachments(String messageId, List<FileAttachment> files) async {
    final attachments = <MessageAttachment>[];

    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      try {
        final fileName = 'chat_attachments/$messageId/${file.filename}_${DateTime.now().millisecondsSinceEpoch}';
        final bytes = await file.file.readAsBytes();
        final publicUrl = await _supabaseService.uploadFile(
          'chat_attachments',
          fileName,
          bytes,
          file.type.name,
        );

        // Generate thumbnail for images
        String thumbnailUrl = '';
        if (file.type == AttachmentType.image) {
          thumbnailUrl = await _generateImageThumbnail(file.file);
        }

        final attachment = MessageAttachment(
          id: _generateId(),
          messageId: messageId,
          url: publicUrl,
          type: file.type,
          filename: file.filename,
          sizeBytes: bytes.length,
          thumbnailUrl: thumbnailUrl,
          metadata: file.metadata,
        );

        attachments.add(attachment);
      } catch (e) {
        // Log error but continue with other files
        print('Failed to upload attachment ${file.filename}: $e');
      }
    }

    return attachments;
  }

  Future<String> _generateImageThumbnail(dynamic imageFile) async {
    try {
      final thumbnailFileName = 'chat_thumbnails/${DateTime.now().millisecondsSinceEpoch}_thumb.jpg';
      final thumbnailBytes = await _createImageThumbnailBytes(imageFile);

      return await _supabaseService.uploadFile(
        'chat_thumbnails',
        thumbnailFileName,
        thumbnailBytes,
        'image',
      );
    } catch (e) {
      return '';
    }
  }

  Future<Uint8List> _createImageThumbnailBytes(dynamic imageFile) async {
    // In a real implementation, use image package to create thumbnail
    // Return a placeholder
    return Uint8List.fromList([]);
  }

  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString() +
        (DateTime.now().microsecond % 1000).toString().padLeft(3, '0');
  }

  void dispose() {
    _messagesSubscription?.cancel();
    _roomsSubscription?.cancel();
    _typingSubscription?.cancel();
    _presenceSubscription?.cancel();
  }
}