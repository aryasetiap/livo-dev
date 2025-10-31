// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return _ChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatRoom {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ChatType get type => throw _privateConstructorUsedError;
  List<String> get participantIds => throw _privateConstructorUsedError;
  List<ChatParticipant> get participants => throw _privateConstructorUsedError;
  Message? get lastMessage => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  bool get isMuted => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  DateTime? get lastActivityAt => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this ChatRoom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) then) =
      _$ChatRoomCopyWithImpl<$Res, ChatRoom>;
  @useResult
  $Res call({
    String id,
    String name,
    ChatType type,
    List<String> participantIds,
    List<ChatParticipant> participants,
    Message? lastMessage,
    int unreadCount,
    bool isMuted,
    bool isArchived,
    bool isPinned,
    DateTime? lastActivityAt,
    String? createdBy,
    String? description,
    String? avatarUrl,
    Map<String, dynamic>? metadata,
  });

  $MessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$ChatRoomCopyWithImpl<$Res, $Val extends ChatRoom>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? participantIds = null,
    Object? participants = null,
    Object? lastMessage = freezed,
    Object? unreadCount = null,
    Object? isMuted = null,
    Object? isArchived = null,
    Object? isPinned = null,
    Object? lastActivityAt = freezed,
    Object? createdBy = freezed,
    Object? description = freezed,
    Object? avatarUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ChatType,
            participantIds: null == participantIds
                ? _value.participantIds
                : participantIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            participants: null == participants
                ? _value.participants
                : participants // ignore: cast_nullable_to_non_nullable
                      as List<ChatParticipant>,
            lastMessage: freezed == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as Message?,
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isMuted: null == isMuted
                ? _value.isMuted
                : isMuted // ignore: cast_nullable_to_non_nullable
                      as bool,
            isArchived: null == isArchived
                ? _value.isArchived
                : isArchived // ignore: cast_nullable_to_non_nullable
                      as bool,
            isPinned: null == isPinned
                ? _value.isPinned
                : isPinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastActivityAt: freezed == lastActivityAt
                ? _value.lastActivityAt
                : lastActivityAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdBy: freezed == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $MessageCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatRoomImplCopyWith<$Res>
    implements $ChatRoomCopyWith<$Res> {
  factory _$$ChatRoomImplCopyWith(
    _$ChatRoomImpl value,
    $Res Function(_$ChatRoomImpl) then,
  ) = __$$ChatRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    ChatType type,
    List<String> participantIds,
    List<ChatParticipant> participants,
    Message? lastMessage,
    int unreadCount,
    bool isMuted,
    bool isArchived,
    bool isPinned,
    DateTime? lastActivityAt,
    String? createdBy,
    String? description,
    String? avatarUrl,
    Map<String, dynamic>? metadata,
  });

  @override
  $MessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$$ChatRoomImplCopyWithImpl<$Res>
    extends _$ChatRoomCopyWithImpl<$Res, _$ChatRoomImpl>
    implements _$$ChatRoomImplCopyWith<$Res> {
  __$$ChatRoomImplCopyWithImpl(
    _$ChatRoomImpl _value,
    $Res Function(_$ChatRoomImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? participantIds = null,
    Object? participants = null,
    Object? lastMessage = freezed,
    Object? unreadCount = null,
    Object? isMuted = null,
    Object? isArchived = null,
    Object? isPinned = null,
    Object? lastActivityAt = freezed,
    Object? createdBy = freezed,
    Object? description = freezed,
    Object? avatarUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$ChatRoomImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ChatType,
        participantIds: null == participantIds
            ? _value._participantIds
            : participantIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        participants: null == participants
            ? _value._participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<ChatParticipant>,
        lastMessage: freezed == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as Message?,
        unreadCount: null == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isMuted: null == isMuted
            ? _value.isMuted
            : isMuted // ignore: cast_nullable_to_non_nullable
                  as bool,
        isArchived: null == isArchived
            ? _value.isArchived
            : isArchived // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPinned: null == isPinned
            ? _value.isPinned
            : isPinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastActivityAt: freezed == lastActivityAt
            ? _value.lastActivityAt
            : lastActivityAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdBy: freezed == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomImpl extends _ChatRoom {
  const _$ChatRoomImpl({
    required this.id,
    required this.name,
    required this.type,
    final List<String> participantIds = const [],
    final List<ChatParticipant> participants = const [],
    this.lastMessage,
    this.unreadCount = 0,
    this.isMuted = false,
    this.isArchived = false,
    this.isPinned = false,
    this.lastActivityAt,
    this.createdBy,
    this.description,
    this.avatarUrl,
    final Map<String, dynamic>? metadata,
  }) : _participantIds = participantIds,
       _participants = participants,
       _metadata = metadata,
       super._();

  factory _$ChatRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ChatType type;
  final List<String> _participantIds;
  @override
  @JsonKey()
  List<String> get participantIds {
    if (_participantIds is EqualUnmodifiableListView) return _participantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantIds);
  }

  final List<ChatParticipant> _participants;
  @override
  @JsonKey()
  List<ChatParticipant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final Message? lastMessage;
  @override
  @JsonKey()
  final int unreadCount;
  @override
  @JsonKey()
  final bool isMuted;
  @override
  @JsonKey()
  final bool isArchived;
  @override
  @JsonKey()
  final bool isPinned;
  @override
  final DateTime? lastActivityAt;
  @override
  final String? createdBy;
  @override
  final String? description;
  @override
  final String? avatarUrl;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ChatRoom(id: $id, name: $name, type: $type, participantIds: $participantIds, participants: $participants, lastMessage: $lastMessage, unreadCount: $unreadCount, isMuted: $isMuted, isArchived: $isArchived, isPinned: $isPinned, lastActivityAt: $lastActivityAt, createdBy: $createdBy, description: $description, avatarUrl: $avatarUrl, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._participantIds,
              _participantIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.lastActivityAt, lastActivityAt) ||
                other.lastActivityAt == lastActivityAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    const DeepCollectionEquality().hash(_participantIds),
    const DeepCollectionEquality().hash(_participants),
    lastMessage,
    unreadCount,
    isMuted,
    isArchived,
    isPinned,
    lastActivityAt,
    createdBy,
    description,
    avatarUrl,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      __$$ChatRoomImplCopyWithImpl<_$ChatRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomImplToJson(this);
  }
}

abstract class _ChatRoom extends ChatRoom {
  const factory _ChatRoom({
    required final String id,
    required final String name,
    required final ChatType type,
    final List<String> participantIds,
    final List<ChatParticipant> participants,
    final Message? lastMessage,
    final int unreadCount,
    final bool isMuted,
    final bool isArchived,
    final bool isPinned,
    final DateTime? lastActivityAt,
    final String? createdBy,
    final String? description,
    final String? avatarUrl,
    final Map<String, dynamic>? metadata,
  }) = _$ChatRoomImpl;
  const _ChatRoom._() : super._();

  factory _ChatRoom.fromJson(Map<String, dynamic> json) =
      _$ChatRoomImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ChatType get type;
  @override
  List<String> get participantIds;
  @override
  List<ChatParticipant> get participants;
  @override
  Message? get lastMessage;
  @override
  int get unreadCount;
  @override
  bool get isMuted;
  @override
  bool get isArchived;
  @override
  bool get isPinned;
  @override
  DateTime? get lastActivityAt;
  @override
  String? get createdBy;
  @override
  String? get description;
  @override
  String? get avatarUrl;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatParticipant _$ChatParticipantFromJson(Map<String, dynamic> json) {
  return _ChatParticipant.fromJson(json);
}

/// @nodoc
mixin _$ChatParticipant {
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  ParticipantStatus get status => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  DateTime? get lastSeenAt => throw _privateConstructorUsedError;
  DateTime? get joinedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get permissions => throw _privateConstructorUsedError;

  /// Serializes this ChatParticipant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatParticipantCopyWith<ChatParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatParticipantCopyWith<$Res> {
  factory $ChatParticipantCopyWith(
    ChatParticipant value,
    $Res Function(ChatParticipant) then,
  ) = _$ChatParticipantCopyWithImpl<$Res, ChatParticipant>;
  @useResult
  $Res call({
    String userId,
    String username,
    String displayName,
    String? avatarUrl,
    bool isAdmin,
    ParticipantStatus status,
    bool isOnline,
    DateTime? lastSeenAt,
    DateTime? joinedAt,
    Map<String, dynamic>? permissions,
  });
}

/// @nodoc
class _$ChatParticipantCopyWithImpl<$Res, $Val extends ChatParticipant>
    implements $ChatParticipantCopyWith<$Res> {
  _$ChatParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? isAdmin = null,
    Object? status = null,
    Object? isOnline = null,
    Object? lastSeenAt = freezed,
    Object? joinedAt = freezed,
    Object? permissions = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAdmin: null == isAdmin
                ? _value.isAdmin
                : isAdmin // ignore: cast_nullable_to_non_nullable
                      as bool,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ParticipantStatus,
            isOnline: null == isOnline
                ? _value.isOnline
                : isOnline // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastSeenAt: freezed == lastSeenAt
                ? _value.lastSeenAt
                : lastSeenAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            joinedAt: freezed == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            permissions: freezed == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatParticipantImplCopyWith<$Res>
    implements $ChatParticipantCopyWith<$Res> {
  factory _$$ChatParticipantImplCopyWith(
    _$ChatParticipantImpl value,
    $Res Function(_$ChatParticipantImpl) then,
  ) = __$$ChatParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    String username,
    String displayName,
    String? avatarUrl,
    bool isAdmin,
    ParticipantStatus status,
    bool isOnline,
    DateTime? lastSeenAt,
    DateTime? joinedAt,
    Map<String, dynamic>? permissions,
  });
}

/// @nodoc
class __$$ChatParticipantImplCopyWithImpl<$Res>
    extends _$ChatParticipantCopyWithImpl<$Res, _$ChatParticipantImpl>
    implements _$$ChatParticipantImplCopyWith<$Res> {
  __$$ChatParticipantImplCopyWithImpl(
    _$ChatParticipantImpl _value,
    $Res Function(_$ChatParticipantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? isAdmin = null,
    Object? status = null,
    Object? isOnline = null,
    Object? lastSeenAt = freezed,
    Object? joinedAt = freezed,
    Object? permissions = freezed,
  }) {
    return _then(
      _$ChatParticipantImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAdmin: null == isAdmin
            ? _value.isAdmin
            : isAdmin // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ParticipantStatus,
        isOnline: null == isOnline
            ? _value.isOnline
            : isOnline // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastSeenAt: freezed == lastSeenAt
            ? _value.lastSeenAt
            : lastSeenAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        joinedAt: freezed == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        permissions: freezed == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatParticipantImpl extends _ChatParticipant {
  const _$ChatParticipantImpl({
    required this.userId,
    required this.username,
    required this.displayName,
    this.avatarUrl,
    this.isAdmin = false,
    this.status = ParticipantStatus.member,
    this.isOnline = false,
    this.lastSeenAt,
    this.joinedAt,
    final Map<String, dynamic>? permissions,
  }) : _permissions = permissions,
       super._();

  factory _$ChatParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatParticipantImplFromJson(json);

  @override
  final String userId;
  @override
  final String username;
  @override
  final String displayName;
  @override
  final String? avatarUrl;
  @override
  @JsonKey()
  final bool isAdmin;
  @override
  @JsonKey()
  final ParticipantStatus status;
  @override
  @JsonKey()
  final bool isOnline;
  @override
  final DateTime? lastSeenAt;
  @override
  final DateTime? joinedAt;
  final Map<String, dynamic>? _permissions;
  @override
  Map<String, dynamic>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ChatParticipant(userId: $userId, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, isAdmin: $isAdmin, status: $status, isOnline: $isOnline, lastSeenAt: $lastSeenAt, joinedAt: $joinedAt, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatParticipantImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    username,
    displayName,
    avatarUrl,
    isAdmin,
    status,
    isOnline,
    lastSeenAt,
    joinedAt,
    const DeepCollectionEquality().hash(_permissions),
  );

  /// Create a copy of ChatParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatParticipantImplCopyWith<_$ChatParticipantImpl> get copyWith =>
      __$$ChatParticipantImplCopyWithImpl<_$ChatParticipantImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatParticipantImplToJson(this);
  }
}

abstract class _ChatParticipant extends ChatParticipant {
  const factory _ChatParticipant({
    required final String userId,
    required final String username,
    required final String displayName,
    final String? avatarUrl,
    final bool isAdmin,
    final ParticipantStatus status,
    final bool isOnline,
    final DateTime? lastSeenAt,
    final DateTime? joinedAt,
    final Map<String, dynamic>? permissions,
  }) = _$ChatParticipantImpl;
  const _ChatParticipant._() : super._();

  factory _ChatParticipant.fromJson(Map<String, dynamic> json) =
      _$ChatParticipantImpl.fromJson;

  @override
  String get userId;
  @override
  String get username;
  @override
  String get displayName;
  @override
  String? get avatarUrl;
  @override
  bool get isAdmin;
  @override
  ParticipantStatus get status;
  @override
  bool get isOnline;
  @override
  DateTime? get lastSeenAt;
  @override
  DateTime? get joinedAt;
  @override
  Map<String, dynamic>? get permissions;

  /// Create a copy of ChatParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatParticipantImplCopyWith<_$ChatParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  MessageStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  String? get replyToId => throw _privateConstructorUsedError;
  Message? get replyToMessage => throw _privateConstructorUsedError;
  List<MessageAttachment> get attachments => throw _privateConstructorUsedError;
  List<MessageReaction> get reactions => throw _privateConstructorUsedError;
  bool get isEdited => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  SenderInfo? get sender => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({
    String id,
    String roomId,
    String senderId,
    String content,
    MessageType type,
    MessageStatus status,
    DateTime createdAt,
    DateTime? updatedAt,
    DateTime? readAt,
    String? replyToId,
    Message? replyToMessage,
    List<MessageAttachment> attachments,
    List<MessageReaction> reactions,
    bool isEdited,
    Map<String, dynamic>? metadata,
    SenderInfo? sender,
  });

  $MessageCopyWith<$Res>? get replyToMessage;
  $SenderInfoCopyWith<$Res>? get sender;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
    Object? senderId = null,
    Object? content = null,
    Object? type = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? readAt = freezed,
    Object? replyToId = freezed,
    Object? replyToMessage = freezed,
    Object? attachments = null,
    Object? reactions = null,
    Object? isEdited = null,
    Object? metadata = freezed,
    Object? sender = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String,
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as MessageType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MessageStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            readAt: freezed == readAt
                ? _value.readAt
                : readAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            replyToId: freezed == replyToId
                ? _value.replyToId
                : replyToId // ignore: cast_nullable_to_non_nullable
                      as String?,
            replyToMessage: freezed == replyToMessage
                ? _value.replyToMessage
                : replyToMessage // ignore: cast_nullable_to_non_nullable
                      as Message?,
            attachments: null == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                      as List<MessageAttachment>,
            reactions: null == reactions
                ? _value.reactions
                : reactions // ignore: cast_nullable_to_non_nullable
                      as List<MessageReaction>,
            isEdited: null == isEdited
                ? _value.isEdited
                : isEdited // ignore: cast_nullable_to_non_nullable
                      as bool,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            sender: freezed == sender
                ? _value.sender
                : sender // ignore: cast_nullable_to_non_nullable
                      as SenderInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res>? get replyToMessage {
    if (_value.replyToMessage == null) {
      return null;
    }

    return $MessageCopyWith<$Res>(_value.replyToMessage!, (value) {
      return _then(_value.copyWith(replyToMessage: value) as $Val);
    });
  }

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SenderInfoCopyWith<$Res>? get sender {
    if (_value.sender == null) {
      return null;
    }

    return $SenderInfoCopyWith<$Res>(_value.sender!, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
    _$MessageImpl value,
    $Res Function(_$MessageImpl) then,
  ) = __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String roomId,
    String senderId,
    String content,
    MessageType type,
    MessageStatus status,
    DateTime createdAt,
    DateTime? updatedAt,
    DateTime? readAt,
    String? replyToId,
    Message? replyToMessage,
    List<MessageAttachment> attachments,
    List<MessageReaction> reactions,
    bool isEdited,
    Map<String, dynamic>? metadata,
    SenderInfo? sender,
  });

  @override
  $MessageCopyWith<$Res>? get replyToMessage;
  @override
  $SenderInfoCopyWith<$Res>? get sender;
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
    _$MessageImpl _value,
    $Res Function(_$MessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
    Object? senderId = null,
    Object? content = null,
    Object? type = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? readAt = freezed,
    Object? replyToId = freezed,
    Object? replyToMessage = freezed,
    Object? attachments = null,
    Object? reactions = null,
    Object? isEdited = null,
    Object? metadata = freezed,
    Object? sender = freezed,
  }) {
    return _then(
      _$MessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MessageType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        readAt: freezed == readAt
            ? _value.readAt
            : readAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        replyToId: freezed == replyToId
            ? _value.replyToId
            : replyToId // ignore: cast_nullable_to_non_nullable
                  as String?,
        replyToMessage: freezed == replyToMessage
            ? _value.replyToMessage
            : replyToMessage // ignore: cast_nullable_to_non_nullable
                  as Message?,
        attachments: null == attachments
            ? _value._attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<MessageAttachment>,
        reactions: null == reactions
            ? _value._reactions
            : reactions // ignore: cast_nullable_to_non_nullable
                  as List<MessageReaction>,
        isEdited: null == isEdited
            ? _value.isEdited
            : isEdited // ignore: cast_nullable_to_non_nullable
                  as bool,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        sender: freezed == sender
            ? _value.sender
            : sender // ignore: cast_nullable_to_non_nullable
                  as SenderInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl extends _Message {
  const _$MessageImpl({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.content,
    required this.type,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.readAt,
    this.replyToId,
    this.replyToMessage,
    final List<MessageAttachment> attachments = const [],
    final List<MessageReaction> reactions = const [],
    this.isEdited = false,
    final Map<String, dynamic>? metadata,
    this.sender,
  }) : _attachments = attachments,
       _reactions = reactions,
       _metadata = metadata,
       super._();

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String id;
  @override
  final String roomId;
  @override
  final String senderId;
  @override
  final String content;
  @override
  final MessageType type;
  @override
  final MessageStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? readAt;
  @override
  final String? replyToId;
  @override
  final Message? replyToMessage;
  final List<MessageAttachment> _attachments;
  @override
  @JsonKey()
  List<MessageAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  final List<MessageReaction> _reactions;
  @override
  @JsonKey()
  List<MessageReaction> get reactions {
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reactions);
  }

  @override
  @JsonKey()
  final bool isEdited;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final SenderInfo? sender;

  @override
  String toString() {
    return 'Message(id: $id, roomId: $roomId, senderId: $senderId, content: $content, type: $type, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, readAt: $readAt, replyToId: $replyToId, replyToMessage: $replyToMessage, attachments: $attachments, reactions: $reactions, isEdited: $isEdited, metadata: $metadata, sender: $sender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.replyToId, replyToId) ||
                other.replyToId == replyToId) &&
            (identical(other.replyToMessage, replyToMessage) ||
                other.replyToMessage == replyToMessage) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ) &&
            const DeepCollectionEquality().equals(
              other._reactions,
              _reactions,
            ) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.sender, sender) || other.sender == sender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roomId,
    senderId,
    content,
    type,
    status,
    createdAt,
    updatedAt,
    readAt,
    replyToId,
    replyToMessage,
    const DeepCollectionEquality().hash(_attachments),
    const DeepCollectionEquality().hash(_reactions),
    isEdited,
    const DeepCollectionEquality().hash(_metadata),
    sender,
  );

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(this);
  }
}

abstract class _Message extends Message {
  const factory _Message({
    required final String id,
    required final String roomId,
    required final String senderId,
    required final String content,
    required final MessageType type,
    required final MessageStatus status,
    required final DateTime createdAt,
    final DateTime? updatedAt,
    final DateTime? readAt,
    final String? replyToId,
    final Message? replyToMessage,
    final List<MessageAttachment> attachments,
    final List<MessageReaction> reactions,
    final bool isEdited,
    final Map<String, dynamic>? metadata,
    final SenderInfo? sender,
  }) = _$MessageImpl;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get id;
  @override
  String get roomId;
  @override
  String get senderId;
  @override
  String get content;
  @override
  MessageType get type;
  @override
  MessageStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get readAt;
  @override
  String? get replyToId;
  @override
  Message? get replyToMessage;
  @override
  List<MessageAttachment> get attachments;
  @override
  List<MessageReaction> get reactions;
  @override
  bool get isEdited;
  @override
  Map<String, dynamic>? get metadata;
  @override
  SenderInfo? get sender;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SenderInfo _$SenderInfoFromJson(Map<String, dynamic> json) {
  return _SenderInfo.fromJson(json);
}

/// @nodoc
mixin _$SenderInfo {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;

  /// Serializes this SenderInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SenderInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SenderInfoCopyWith<SenderInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SenderInfoCopyWith<$Res> {
  factory $SenderInfoCopyWith(
    SenderInfo value,
    $Res Function(SenderInfo) then,
  ) = _$SenderInfoCopyWithImpl<$Res, SenderInfo>;
  @useResult
  $Res call({
    String id,
    String username,
    String displayName,
    String? avatarUrl,
    bool isVerified,
    bool isOnline,
  });
}

/// @nodoc
class _$SenderInfoCopyWithImpl<$Res, $Val extends SenderInfo>
    implements $SenderInfoCopyWith<$Res> {
  _$SenderInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SenderInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? isVerified = null,
    Object? isOnline = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            isOnline: null == isOnline
                ? _value.isOnline
                : isOnline // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SenderInfoImplCopyWith<$Res>
    implements $SenderInfoCopyWith<$Res> {
  factory _$$SenderInfoImplCopyWith(
    _$SenderInfoImpl value,
    $Res Function(_$SenderInfoImpl) then,
  ) = __$$SenderInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String username,
    String displayName,
    String? avatarUrl,
    bool isVerified,
    bool isOnline,
  });
}

/// @nodoc
class __$$SenderInfoImplCopyWithImpl<$Res>
    extends _$SenderInfoCopyWithImpl<$Res, _$SenderInfoImpl>
    implements _$$SenderInfoImplCopyWith<$Res> {
  __$$SenderInfoImplCopyWithImpl(
    _$SenderInfoImpl _value,
    $Res Function(_$SenderInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SenderInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? isVerified = null,
    Object? isOnline = null,
  }) {
    return _then(
      _$SenderInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        isOnline: null == isOnline
            ? _value.isOnline
            : isOnline // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SenderInfoImpl extends _SenderInfo {
  const _$SenderInfoImpl({
    required this.id,
    required this.username,
    required this.displayName,
    this.avatarUrl,
    this.isVerified = false,
    this.isOnline = false,
  }) : super._();

  factory _$SenderInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SenderInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String displayName;
  @override
  final String? avatarUrl;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool isOnline;

  @override
  String toString() {
    return 'SenderInfo(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, isVerified: $isVerified, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SenderInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    username,
    displayName,
    avatarUrl,
    isVerified,
    isOnline,
  );

  /// Create a copy of SenderInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SenderInfoImplCopyWith<_$SenderInfoImpl> get copyWith =>
      __$$SenderInfoImplCopyWithImpl<_$SenderInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SenderInfoImplToJson(this);
  }
}

abstract class _SenderInfo extends SenderInfo {
  const factory _SenderInfo({
    required final String id,
    required final String username,
    required final String displayName,
    final String? avatarUrl,
    final bool isVerified,
    final bool isOnline,
  }) = _$SenderInfoImpl;
  const _SenderInfo._() : super._();

  factory _SenderInfo.fromJson(Map<String, dynamic> json) =
      _$SenderInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get displayName;
  @override
  String? get avatarUrl;
  @override
  bool get isVerified;
  @override
  bool get isOnline;

  /// Create a copy of SenderInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SenderInfoImplCopyWith<_$SenderInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageAttachment _$MessageAttachmentFromJson(Map<String, dynamic> json) {
  return _MessageAttachment.fromJson(json);
}

/// @nodoc
mixin _$MessageAttachment {
  String get id => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  AttachmentType get type => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  int get sizeBytes => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this MessageAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageAttachmentCopyWith<MessageAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageAttachmentCopyWith<$Res> {
  factory $MessageAttachmentCopyWith(
    MessageAttachment value,
    $Res Function(MessageAttachment) then,
  ) = _$MessageAttachmentCopyWithImpl<$Res, MessageAttachment>;
  @useResult
  $Res call({
    String id,
    String messageId,
    String url,
    AttachmentType type,
    String filename,
    int sizeBytes,
    int width,
    int height,
    int duration,
    String? thumbnailUrl,
    String? mimeType,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$MessageAttachmentCopyWithImpl<$Res, $Val extends MessageAttachment>
    implements $MessageAttachmentCopyWith<$Res> {
  _$MessageAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageId = null,
    Object? url = null,
    Object? type = null,
    Object? filename = null,
    Object? sizeBytes = null,
    Object? width = null,
    Object? height = null,
    Object? duration = null,
    Object? thumbnailUrl = freezed,
    Object? mimeType = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            messageId: null == messageId
                ? _value.messageId
                : messageId // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AttachmentType,
            filename: null == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                      as String,
            sizeBytes: null == sizeBytes
                ? _value.sizeBytes
                : sizeBytes // ignore: cast_nullable_to_non_nullable
                      as int,
            width: null == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as int,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            mimeType: freezed == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageAttachmentImplCopyWith<$Res>
    implements $MessageAttachmentCopyWith<$Res> {
  factory _$$MessageAttachmentImplCopyWith(
    _$MessageAttachmentImpl value,
    $Res Function(_$MessageAttachmentImpl) then,
  ) = __$$MessageAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String messageId,
    String url,
    AttachmentType type,
    String filename,
    int sizeBytes,
    int width,
    int height,
    int duration,
    String? thumbnailUrl,
    String? mimeType,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$MessageAttachmentImplCopyWithImpl<$Res>
    extends _$MessageAttachmentCopyWithImpl<$Res, _$MessageAttachmentImpl>
    implements _$$MessageAttachmentImplCopyWith<$Res> {
  __$$MessageAttachmentImplCopyWithImpl(
    _$MessageAttachmentImpl _value,
    $Res Function(_$MessageAttachmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageId = null,
    Object? url = null,
    Object? type = null,
    Object? filename = null,
    Object? sizeBytes = null,
    Object? width = null,
    Object? height = null,
    Object? duration = null,
    Object? thumbnailUrl = freezed,
    Object? mimeType = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$MessageAttachmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        messageId: null == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AttachmentType,
        filename: null == filename
            ? _value.filename
            : filename // ignore: cast_nullable_to_non_nullable
                  as String,
        sizeBytes: null == sizeBytes
            ? _value.sizeBytes
            : sizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
        width: null == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as int,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        mimeType: freezed == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageAttachmentImpl extends _MessageAttachment {
  const _$MessageAttachmentImpl({
    required this.id,
    required this.messageId,
    required this.url,
    required this.type,
    required this.filename,
    this.sizeBytes = 0,
    this.width = 0,
    this.height = 0,
    this.duration = 0,
    this.thumbnailUrl,
    this.mimeType,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata,
       super._();

  factory _$MessageAttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageAttachmentImplFromJson(json);

  @override
  final String id;
  @override
  final String messageId;
  @override
  final String url;
  @override
  final AttachmentType type;
  @override
  final String filename;
  @override
  @JsonKey()
  final int sizeBytes;
  @override
  @JsonKey()
  final int width;
  @override
  @JsonKey()
  final int height;
  @override
  @JsonKey()
  final int duration;
  @override
  final String? thumbnailUrl;
  @override
  final String? mimeType;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MessageAttachment(id: $id, messageId: $messageId, url: $url, type: $type, filename: $filename, sizeBytes: $sizeBytes, width: $width, height: $height, duration: $duration, thumbnailUrl: $thumbnailUrl, mimeType: $mimeType, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageAttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    messageId,
    url,
    type,
    filename,
    sizeBytes,
    width,
    height,
    duration,
    thumbnailUrl,
    mimeType,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageAttachmentImplCopyWith<_$MessageAttachmentImpl> get copyWith =>
      __$$MessageAttachmentImplCopyWithImpl<_$MessageAttachmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageAttachmentImplToJson(this);
  }
}

abstract class _MessageAttachment extends MessageAttachment {
  const factory _MessageAttachment({
    required final String id,
    required final String messageId,
    required final String url,
    required final AttachmentType type,
    required final String filename,
    final int sizeBytes,
    final int width,
    final int height,
    final int duration,
    final String? thumbnailUrl,
    final String? mimeType,
    final Map<String, dynamic>? metadata,
  }) = _$MessageAttachmentImpl;
  const _MessageAttachment._() : super._();

  factory _MessageAttachment.fromJson(Map<String, dynamic> json) =
      _$MessageAttachmentImpl.fromJson;

  @override
  String get id;
  @override
  String get messageId;
  @override
  String get url;
  @override
  AttachmentType get type;
  @override
  String get filename;
  @override
  int get sizeBytes;
  @override
  int get width;
  @override
  int get height;
  @override
  int get duration;
  @override
  String? get thumbnailUrl;
  @override
  String? get mimeType;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageAttachmentImplCopyWith<_$MessageAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageReaction _$MessageReactionFromJson(Map<String, dynamic> json) {
  return _MessageReaction.fromJson(json);
}

/// @nodoc
mixin _$MessageReaction {
  String get id => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MessageReaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageReaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageReactionCopyWith<MessageReaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageReactionCopyWith<$Res> {
  factory $MessageReactionCopyWith(
    MessageReaction value,
    $Res Function(MessageReaction) then,
  ) = _$MessageReactionCopyWithImpl<$Res, MessageReaction>;
  @useResult
  $Res call({
    String id,
    String messageId,
    String userId,
    String emoji,
    DateTime createdAt,
  });
}

/// @nodoc
class _$MessageReactionCopyWithImpl<$Res, $Val extends MessageReaction>
    implements $MessageReactionCopyWith<$Res> {
  _$MessageReactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageReaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageId = null,
    Object? userId = null,
    Object? emoji = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            messageId: null == messageId
                ? _value.messageId
                : messageId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            emoji: null == emoji
                ? _value.emoji
                : emoji // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageReactionImplCopyWith<$Res>
    implements $MessageReactionCopyWith<$Res> {
  factory _$$MessageReactionImplCopyWith(
    _$MessageReactionImpl value,
    $Res Function(_$MessageReactionImpl) then,
  ) = __$$MessageReactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String messageId,
    String userId,
    String emoji,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$MessageReactionImplCopyWithImpl<$Res>
    extends _$MessageReactionCopyWithImpl<$Res, _$MessageReactionImpl>
    implements _$$MessageReactionImplCopyWith<$Res> {
  __$$MessageReactionImplCopyWithImpl(
    _$MessageReactionImpl _value,
    $Res Function(_$MessageReactionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageReaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageId = null,
    Object? userId = null,
    Object? emoji = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$MessageReactionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        messageId: null == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        emoji: null == emoji
            ? _value.emoji
            : emoji // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageReactionImpl implements _MessageReaction {
  const _$MessageReactionImpl({
    required this.id,
    required this.messageId,
    required this.userId,
    required this.emoji,
    required this.createdAt,
  });

  factory _$MessageReactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageReactionImplFromJson(json);

  @override
  final String id;
  @override
  final String messageId;
  @override
  final String userId;
  @override
  final String emoji;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MessageReaction(id: $id, messageId: $messageId, userId: $userId, emoji: $emoji, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageReactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, messageId, userId, emoji, createdAt);

  /// Create a copy of MessageReaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageReactionImplCopyWith<_$MessageReactionImpl> get copyWith =>
      __$$MessageReactionImplCopyWithImpl<_$MessageReactionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageReactionImplToJson(this);
  }
}

abstract class _MessageReaction implements MessageReaction {
  const factory _MessageReaction({
    required final String id,
    required final String messageId,
    required final String userId,
    required final String emoji,
    required final DateTime createdAt,
  }) = _$MessageReactionImpl;

  factory _MessageReaction.fromJson(Map<String, dynamic> json) =
      _$MessageReactionImpl.fromJson;

  @override
  String get id;
  @override
  String get messageId;
  @override
  String get userId;
  @override
  String get emoji;
  @override
  DateTime get createdAt;

  /// Create a copy of MessageReaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageReactionImplCopyWith<_$MessageReactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypingIndicator _$TypingIndicatorFromJson(Map<String, dynamic> json) {
  return _TypingIndicator.fromJson(json);
}

/// @nodoc
mixin _$TypingIndicator {
  String get roomId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;

  /// Serializes this TypingIndicator to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypingIndicatorCopyWith<TypingIndicator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypingIndicatorCopyWith<$Res> {
  factory $TypingIndicatorCopyWith(
    TypingIndicator value,
    $Res Function(TypingIndicator) then,
  ) = _$TypingIndicatorCopyWithImpl<$Res, TypingIndicator>;
  @useResult
  $Res call({String roomId, String userId, DateTime startedAt});
}

/// @nodoc
class _$TypingIndicatorCopyWithImpl<$Res, $Val extends TypingIndicator>
    implements $TypingIndicatorCopyWith<$Res> {
  _$TypingIndicatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? startedAt = null,
  }) {
    return _then(
      _value.copyWith(
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TypingIndicatorImplCopyWith<$Res>
    implements $TypingIndicatorCopyWith<$Res> {
  factory _$$TypingIndicatorImplCopyWith(
    _$TypingIndicatorImpl value,
    $Res Function(_$TypingIndicatorImpl) then,
  ) = __$$TypingIndicatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomId, String userId, DateTime startedAt});
}

/// @nodoc
class __$$TypingIndicatorImplCopyWithImpl<$Res>
    extends _$TypingIndicatorCopyWithImpl<$Res, _$TypingIndicatorImpl>
    implements _$$TypingIndicatorImplCopyWith<$Res> {
  __$$TypingIndicatorImplCopyWithImpl(
    _$TypingIndicatorImpl _value,
    $Res Function(_$TypingIndicatorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? startedAt = null,
  }) {
    return _then(
      _$TypingIndicatorImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TypingIndicatorImpl implements _TypingIndicator {
  const _$TypingIndicatorImpl({
    required this.roomId,
    required this.userId,
    required this.startedAt,
  });

  factory _$TypingIndicatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypingIndicatorImplFromJson(json);

  @override
  final String roomId;
  @override
  final String userId;
  @override
  final DateTime startedAt;

  @override
  String toString() {
    return 'TypingIndicator(roomId: $roomId, userId: $userId, startedAt: $startedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingIndicatorImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, userId, startedAt);

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingIndicatorImplCopyWith<_$TypingIndicatorImpl> get copyWith =>
      __$$TypingIndicatorImplCopyWithImpl<_$TypingIndicatorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TypingIndicatorImplToJson(this);
  }
}

abstract class _TypingIndicator implements TypingIndicator {
  const factory _TypingIndicator({
    required final String roomId,
    required final String userId,
    required final DateTime startedAt,
  }) = _$TypingIndicatorImpl;

  factory _TypingIndicator.fromJson(Map<String, dynamic> json) =
      _$TypingIndicatorImpl.fromJson;

  @override
  String get roomId;
  @override
  String get userId;
  @override
  DateTime get startedAt;

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypingIndicatorImplCopyWith<_$TypingIndicatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OnlineStatus _$OnlineStatusFromJson(Map<String, dynamic> json) {
  return _OnlineStatus.fromJson(json);
}

/// @nodoc
mixin _$OnlineStatus {
  String get userId => throw _privateConstructorUsedError;
  UserPresence get presence => throw _privateConstructorUsedError;
  DateTime? get lastSeenAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this OnlineStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnlineStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnlineStatusCopyWith<OnlineStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineStatusCopyWith<$Res> {
  factory $OnlineStatusCopyWith(
    OnlineStatus value,
    $Res Function(OnlineStatus) then,
  ) = _$OnlineStatusCopyWithImpl<$Res, OnlineStatus>;
  @useResult
  $Res call({
    String userId,
    UserPresence presence,
    DateTime? lastSeenAt,
    String? status,
  });
}

/// @nodoc
class _$OnlineStatusCopyWithImpl<$Res, $Val extends OnlineStatus>
    implements $OnlineStatusCopyWith<$Res> {
  _$OnlineStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnlineStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? presence = null,
    Object? lastSeenAt = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            presence: null == presence
                ? _value.presence
                : presence // ignore: cast_nullable_to_non_nullable
                      as UserPresence,
            lastSeenAt: freezed == lastSeenAt
                ? _value.lastSeenAt
                : lastSeenAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnlineStatusImplCopyWith<$Res>
    implements $OnlineStatusCopyWith<$Res> {
  factory _$$OnlineStatusImplCopyWith(
    _$OnlineStatusImpl value,
    $Res Function(_$OnlineStatusImpl) then,
  ) = __$$OnlineStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    UserPresence presence,
    DateTime? lastSeenAt,
    String? status,
  });
}

/// @nodoc
class __$$OnlineStatusImplCopyWithImpl<$Res>
    extends _$OnlineStatusCopyWithImpl<$Res, _$OnlineStatusImpl>
    implements _$$OnlineStatusImplCopyWith<$Res> {
  __$$OnlineStatusImplCopyWithImpl(
    _$OnlineStatusImpl _value,
    $Res Function(_$OnlineStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnlineStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? presence = null,
    Object? lastSeenAt = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$OnlineStatusImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        presence: null == presence
            ? _value.presence
            : presence // ignore: cast_nullable_to_non_nullable
                  as UserPresence,
        lastSeenAt: freezed == lastSeenAt
            ? _value.lastSeenAt
            : lastSeenAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OnlineStatusImpl implements _OnlineStatus {
  const _$OnlineStatusImpl({
    required this.userId,
    required this.presence,
    this.lastSeenAt,
    this.status,
  });

  factory _$OnlineStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnlineStatusImplFromJson(json);

  @override
  final String userId;
  @override
  final UserPresence presence;
  @override
  final DateTime? lastSeenAt;
  @override
  final String? status;

  @override
  String toString() {
    return 'OnlineStatus(userId: $userId, presence: $presence, lastSeenAt: $lastSeenAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineStatusImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.presence, presence) ||
                other.presence == presence) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, presence, lastSeenAt, status);

  /// Create a copy of OnlineStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineStatusImplCopyWith<_$OnlineStatusImpl> get copyWith =>
      __$$OnlineStatusImplCopyWithImpl<_$OnlineStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnlineStatusImplToJson(this);
  }
}

abstract class _OnlineStatus implements OnlineStatus {
  const factory _OnlineStatus({
    required final String userId,
    required final UserPresence presence,
    final DateTime? lastSeenAt,
    final String? status,
  }) = _$OnlineStatusImpl;

  factory _OnlineStatus.fromJson(Map<String, dynamic> json) =
      _$OnlineStatusImpl.fromJson;

  @override
  String get userId;
  @override
  UserPresence get presence;
  @override
  DateTime? get lastSeenAt;
  @override
  String? get status;

  /// Create a copy of OnlineStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnlineStatusImplCopyWith<_$OnlineStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateChatRoomRequest {
  String get name => throw _privateConstructorUsedError;
  ChatType get type => throw _privateConstructorUsedError;
  List<String> get participantIds => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Create a copy of CreateChatRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateChatRoomRequestCopyWith<CreateChatRoomRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateChatRoomRequestCopyWith<$Res> {
  factory $CreateChatRoomRequestCopyWith(
    CreateChatRoomRequest value,
    $Res Function(CreateChatRoomRequest) then,
  ) = _$CreateChatRoomRequestCopyWithImpl<$Res, CreateChatRoomRequest>;
  @useResult
  $Res call({
    String name,
    ChatType type,
    List<String> participantIds,
    String? description,
    String? avatarUrl,
  });
}

/// @nodoc
class _$CreateChatRoomRequestCopyWithImpl<
  $Res,
  $Val extends CreateChatRoomRequest
>
    implements $CreateChatRoomRequestCopyWith<$Res> {
  _$CreateChatRoomRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateChatRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? participantIds = null,
    Object? description = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ChatType,
            participantIds: null == participantIds
                ? _value.participantIds
                : participantIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateChatRoomRequestImplCopyWith<$Res>
    implements $CreateChatRoomRequestCopyWith<$Res> {
  factory _$$CreateChatRoomRequestImplCopyWith(
    _$CreateChatRoomRequestImpl value,
    $Res Function(_$CreateChatRoomRequestImpl) then,
  ) = __$$CreateChatRoomRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    ChatType type,
    List<String> participantIds,
    String? description,
    String? avatarUrl,
  });
}

/// @nodoc
class __$$CreateChatRoomRequestImplCopyWithImpl<$Res>
    extends
        _$CreateChatRoomRequestCopyWithImpl<$Res, _$CreateChatRoomRequestImpl>
    implements _$$CreateChatRoomRequestImplCopyWith<$Res> {
  __$$CreateChatRoomRequestImplCopyWithImpl(
    _$CreateChatRoomRequestImpl _value,
    $Res Function(_$CreateChatRoomRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateChatRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? participantIds = null,
    Object? description = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _$CreateChatRoomRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ChatType,
        participantIds: null == participantIds
            ? _value._participantIds
            : participantIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CreateChatRoomRequestImpl extends _CreateChatRoomRequest {
  const _$CreateChatRoomRequestImpl({
    required this.name,
    required this.type,
    final List<String> participantIds = const [],
    this.description,
    this.avatarUrl,
  }) : _participantIds = participantIds,
       super._();

  @override
  final String name;
  @override
  final ChatType type;
  final List<String> _participantIds;
  @override
  @JsonKey()
  List<String> get participantIds {
    if (_participantIds is EqualUnmodifiableListView) return _participantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantIds);
  }

  @override
  final String? description;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'CreateChatRoomRequest(name: $name, type: $type, participantIds: $participantIds, description: $description, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateChatRoomRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._participantIds,
              _participantIds,
            ) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    type,
    const DeepCollectionEquality().hash(_participantIds),
    description,
    avatarUrl,
  );

  /// Create a copy of CreateChatRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateChatRoomRequestImplCopyWith<_$CreateChatRoomRequestImpl>
  get copyWith =>
      __$$CreateChatRoomRequestImplCopyWithImpl<_$CreateChatRoomRequestImpl>(
        this,
        _$identity,
      );
}

abstract class _CreateChatRoomRequest extends CreateChatRoomRequest {
  const factory _CreateChatRoomRequest({
    required final String name,
    required final ChatType type,
    final List<String> participantIds,
    final String? description,
    final String? avatarUrl,
  }) = _$CreateChatRoomRequestImpl;
  const _CreateChatRoomRequest._() : super._();

  @override
  String get name;
  @override
  ChatType get type;
  @override
  List<String> get participantIds;
  @override
  String? get description;
  @override
  String? get avatarUrl;

  /// Create a copy of CreateChatRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateChatRoomRequestImplCopyWith<_$CreateChatRoomRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SendMessageRequest {
  String get roomId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  String? get replyToId => throw _privateConstructorUsedError;
  List<FileAttachment> get attachments => throw _privateConstructorUsedError;

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendMessageRequestCopyWith<SendMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageRequestCopyWith<$Res> {
  factory $SendMessageRequestCopyWith(
    SendMessageRequest value,
    $Res Function(SendMessageRequest) then,
  ) = _$SendMessageRequestCopyWithImpl<$Res, SendMessageRequest>;
  @useResult
  $Res call({
    String roomId,
    String content,
    MessageType type,
    String? replyToId,
    List<FileAttachment> attachments,
  });
}

/// @nodoc
class _$SendMessageRequestCopyWithImpl<$Res, $Val extends SendMessageRequest>
    implements $SendMessageRequestCopyWith<$Res> {
  _$SendMessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? content = null,
    Object? type = null,
    Object? replyToId = freezed,
    Object? attachments = null,
  }) {
    return _then(
      _value.copyWith(
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as MessageType,
            replyToId: freezed == replyToId
                ? _value.replyToId
                : replyToId // ignore: cast_nullable_to_non_nullable
                      as String?,
            attachments: null == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                      as List<FileAttachment>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendMessageRequestImplCopyWith<$Res>
    implements $SendMessageRequestCopyWith<$Res> {
  factory _$$SendMessageRequestImplCopyWith(
    _$SendMessageRequestImpl value,
    $Res Function(_$SendMessageRequestImpl) then,
  ) = __$$SendMessageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String roomId,
    String content,
    MessageType type,
    String? replyToId,
    List<FileAttachment> attachments,
  });
}

/// @nodoc
class __$$SendMessageRequestImplCopyWithImpl<$Res>
    extends _$SendMessageRequestCopyWithImpl<$Res, _$SendMessageRequestImpl>
    implements _$$SendMessageRequestImplCopyWith<$Res> {
  __$$SendMessageRequestImplCopyWithImpl(
    _$SendMessageRequestImpl _value,
    $Res Function(_$SendMessageRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? content = null,
    Object? type = null,
    Object? replyToId = freezed,
    Object? attachments = null,
  }) {
    return _then(
      _$SendMessageRequestImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MessageType,
        replyToId: freezed == replyToId
            ? _value.replyToId
            : replyToId // ignore: cast_nullable_to_non_nullable
                  as String?,
        attachments: null == attachments
            ? _value._attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<FileAttachment>,
      ),
    );
  }
}

/// @nodoc

class _$SendMessageRequestImpl extends _SendMessageRequest {
  const _$SendMessageRequestImpl({
    required this.roomId,
    required this.content,
    required this.type,
    this.replyToId,
    final List<FileAttachment> attachments = const [],
  }) : _attachments = attachments,
       super._();

  @override
  final String roomId;
  @override
  final String content;
  @override
  final MessageType type;
  @override
  final String? replyToId;
  final List<FileAttachment> _attachments;
  @override
  @JsonKey()
  List<FileAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'SendMessageRequest(roomId: $roomId, content: $content, type: $type, replyToId: $replyToId, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageRequestImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.replyToId, replyToId) ||
                other.replyToId == replyToId) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomId,
    content,
    type,
    replyToId,
    const DeepCollectionEquality().hash(_attachments),
  );

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageRequestImplCopyWith<_$SendMessageRequestImpl> get copyWith =>
      __$$SendMessageRequestImplCopyWithImpl<_$SendMessageRequestImpl>(
        this,
        _$identity,
      );
}

abstract class _SendMessageRequest extends SendMessageRequest {
  const factory _SendMessageRequest({
    required final String roomId,
    required final String content,
    required final MessageType type,
    final String? replyToId,
    final List<FileAttachment> attachments,
  }) = _$SendMessageRequestImpl;
  const _SendMessageRequest._() : super._();

  @override
  String get roomId;
  @override
  String get content;
  @override
  MessageType get type;
  @override
  String? get replyToId;
  @override
  List<FileAttachment> get attachments;

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageRequestImplCopyWith<_$SendMessageRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FileAttachment {
  dynamic get file =>
      throw _privateConstructorUsedError; // Will be File from dart:io
  AttachmentType get type => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Create a copy of FileAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileAttachmentCopyWith<FileAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileAttachmentCopyWith<$Res> {
  factory $FileAttachmentCopyWith(
    FileAttachment value,
    $Res Function(FileAttachment) then,
  ) = _$FileAttachmentCopyWithImpl<$Res, FileAttachment>;
  @useResult
  $Res call({
    dynamic file,
    AttachmentType type,
    String filename,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$FileAttachmentCopyWithImpl<$Res, $Val extends FileAttachment>
    implements $FileAttachmentCopyWith<$Res> {
  _$FileAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? type = null,
    Object? filename = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            file: freezed == file
                ? _value.file
                : file // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AttachmentType,
            filename: null == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                      as String,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FileAttachmentImplCopyWith<$Res>
    implements $FileAttachmentCopyWith<$Res> {
  factory _$$FileAttachmentImplCopyWith(
    _$FileAttachmentImpl value,
    $Res Function(_$FileAttachmentImpl) then,
  ) = __$$FileAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    dynamic file,
    AttachmentType type,
    String filename,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$FileAttachmentImplCopyWithImpl<$Res>
    extends _$FileAttachmentCopyWithImpl<$Res, _$FileAttachmentImpl>
    implements _$$FileAttachmentImplCopyWith<$Res> {
  __$$FileAttachmentImplCopyWithImpl(
    _$FileAttachmentImpl _value,
    $Res Function(_$FileAttachmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FileAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? type = null,
    Object? filename = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _$FileAttachmentImpl(
        file: freezed == file
            ? _value.file
            : file // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AttachmentType,
        filename: null == filename
            ? _value.filename
            : filename // ignore: cast_nullable_to_non_nullable
                  as String,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$FileAttachmentImpl extends _FileAttachment {
  const _$FileAttachmentImpl({
    required this.file,
    required this.type,
    required this.filename,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata,
       super._();

  @override
  final dynamic file;
  // Will be File from dart:io
  @override
  final AttachmentType type;
  @override
  final String filename;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'FileAttachment(file: $file, type: $type, filename: $filename, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileAttachmentImpl &&
            const DeepCollectionEquality().equals(other.file, file) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(file),
    type,
    filename,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of FileAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileAttachmentImplCopyWith<_$FileAttachmentImpl> get copyWith =>
      __$$FileAttachmentImplCopyWithImpl<_$FileAttachmentImpl>(
        this,
        _$identity,
      );
}

abstract class _FileAttachment extends FileAttachment {
  const factory _FileAttachment({
    required final dynamic file,
    required final AttachmentType type,
    required final String filename,
    final Map<String, dynamic>? metadata,
  }) = _$FileAttachmentImpl;
  const _FileAttachment._() : super._();

  @override
  dynamic get file; // Will be File from dart:io
  @override
  AttachmentType get type;
  @override
  String get filename;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of FileAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileAttachmentImplCopyWith<_$FileAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatStats _$ChatStatsFromJson(Map<String, dynamic> json) {
  return _ChatStats.fromJson(json);
}

/// @nodoc
mixin _$ChatStats {
  int get totalMessages => throw _privateConstructorUsedError;
  int get totalRooms => throw _privateConstructorUsedError;
  int get unreadMessages => throw _privateConstructorUsedError;
  int get messagesToday => throw _privateConstructorUsedError;
  int get messagesThisWeek => throw _privateConstructorUsedError;
  int get messagesThisMonth => throw _privateConstructorUsedError;
  int get activeRooms => throw _privateConstructorUsedError;

  /// Serializes this ChatStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStatsCopyWith<ChatStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStatsCopyWith<$Res> {
  factory $ChatStatsCopyWith(ChatStats value, $Res Function(ChatStats) then) =
      _$ChatStatsCopyWithImpl<$Res, ChatStats>;
  @useResult
  $Res call({
    int totalMessages,
    int totalRooms,
    int unreadMessages,
    int messagesToday,
    int messagesThisWeek,
    int messagesThisMonth,
    int activeRooms,
  });
}

/// @nodoc
class _$ChatStatsCopyWithImpl<$Res, $Val extends ChatStats>
    implements $ChatStatsCopyWith<$Res> {
  _$ChatStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMessages = null,
    Object? totalRooms = null,
    Object? unreadMessages = null,
    Object? messagesToday = null,
    Object? messagesThisWeek = null,
    Object? messagesThisMonth = null,
    Object? activeRooms = null,
  }) {
    return _then(
      _value.copyWith(
            totalMessages: null == totalMessages
                ? _value.totalMessages
                : totalMessages // ignore: cast_nullable_to_non_nullable
                      as int,
            totalRooms: null == totalRooms
                ? _value.totalRooms
                : totalRooms // ignore: cast_nullable_to_non_nullable
                      as int,
            unreadMessages: null == unreadMessages
                ? _value.unreadMessages
                : unreadMessages // ignore: cast_nullable_to_non_nullable
                      as int,
            messagesToday: null == messagesToday
                ? _value.messagesToday
                : messagesToday // ignore: cast_nullable_to_non_nullable
                      as int,
            messagesThisWeek: null == messagesThisWeek
                ? _value.messagesThisWeek
                : messagesThisWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            messagesThisMonth: null == messagesThisMonth
                ? _value.messagesThisMonth
                : messagesThisMonth // ignore: cast_nullable_to_non_nullable
                      as int,
            activeRooms: null == activeRooms
                ? _value.activeRooms
                : activeRooms // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatStatsImplCopyWith<$Res>
    implements $ChatStatsCopyWith<$Res> {
  factory _$$ChatStatsImplCopyWith(
    _$ChatStatsImpl value,
    $Res Function(_$ChatStatsImpl) then,
  ) = __$$ChatStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalMessages,
    int totalRooms,
    int unreadMessages,
    int messagesToday,
    int messagesThisWeek,
    int messagesThisMonth,
    int activeRooms,
  });
}

/// @nodoc
class __$$ChatStatsImplCopyWithImpl<$Res>
    extends _$ChatStatsCopyWithImpl<$Res, _$ChatStatsImpl>
    implements _$$ChatStatsImplCopyWith<$Res> {
  __$$ChatStatsImplCopyWithImpl(
    _$ChatStatsImpl _value,
    $Res Function(_$ChatStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMessages = null,
    Object? totalRooms = null,
    Object? unreadMessages = null,
    Object? messagesToday = null,
    Object? messagesThisWeek = null,
    Object? messagesThisMonth = null,
    Object? activeRooms = null,
  }) {
    return _then(
      _$ChatStatsImpl(
        totalMessages: null == totalMessages
            ? _value.totalMessages
            : totalMessages // ignore: cast_nullable_to_non_nullable
                  as int,
        totalRooms: null == totalRooms
            ? _value.totalRooms
            : totalRooms // ignore: cast_nullable_to_non_nullable
                  as int,
        unreadMessages: null == unreadMessages
            ? _value.unreadMessages
            : unreadMessages // ignore: cast_nullable_to_non_nullable
                  as int,
        messagesToday: null == messagesToday
            ? _value.messagesToday
            : messagesToday // ignore: cast_nullable_to_non_nullable
                  as int,
        messagesThisWeek: null == messagesThisWeek
            ? _value.messagesThisWeek
            : messagesThisWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        messagesThisMonth: null == messagesThisMonth
            ? _value.messagesThisMonth
            : messagesThisMonth // ignore: cast_nullable_to_non_nullable
                  as int,
        activeRooms: null == activeRooms
            ? _value.activeRooms
            : activeRooms // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatStatsImpl implements _ChatStats {
  const _$ChatStatsImpl({
    required this.totalMessages,
    required this.totalRooms,
    required this.unreadMessages,
    this.messagesToday = 0,
    this.messagesThisWeek = 0,
    this.messagesThisMonth = 0,
    this.activeRooms = 0,
  });

  factory _$ChatStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatStatsImplFromJson(json);

  @override
  final int totalMessages;
  @override
  final int totalRooms;
  @override
  final int unreadMessages;
  @override
  @JsonKey()
  final int messagesToday;
  @override
  @JsonKey()
  final int messagesThisWeek;
  @override
  @JsonKey()
  final int messagesThisMonth;
  @override
  @JsonKey()
  final int activeRooms;

  @override
  String toString() {
    return 'ChatStats(totalMessages: $totalMessages, totalRooms: $totalRooms, unreadMessages: $unreadMessages, messagesToday: $messagesToday, messagesThisWeek: $messagesThisWeek, messagesThisMonth: $messagesThisMonth, activeRooms: $activeRooms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStatsImpl &&
            (identical(other.totalMessages, totalMessages) ||
                other.totalMessages == totalMessages) &&
            (identical(other.totalRooms, totalRooms) ||
                other.totalRooms == totalRooms) &&
            (identical(other.unreadMessages, unreadMessages) ||
                other.unreadMessages == unreadMessages) &&
            (identical(other.messagesToday, messagesToday) ||
                other.messagesToday == messagesToday) &&
            (identical(other.messagesThisWeek, messagesThisWeek) ||
                other.messagesThisWeek == messagesThisWeek) &&
            (identical(other.messagesThisMonth, messagesThisMonth) ||
                other.messagesThisMonth == messagesThisMonth) &&
            (identical(other.activeRooms, activeRooms) ||
                other.activeRooms == activeRooms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalMessages,
    totalRooms,
    unreadMessages,
    messagesToday,
    messagesThisWeek,
    messagesThisMonth,
    activeRooms,
  );

  /// Create a copy of ChatStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStatsImplCopyWith<_$ChatStatsImpl> get copyWith =>
      __$$ChatStatsImplCopyWithImpl<_$ChatStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatStatsImplToJson(this);
  }
}

abstract class _ChatStats implements ChatStats {
  const factory _ChatStats({
    required final int totalMessages,
    required final int totalRooms,
    required final int unreadMessages,
    final int messagesToday,
    final int messagesThisWeek,
    final int messagesThisMonth,
    final int activeRooms,
  }) = _$ChatStatsImpl;

  factory _ChatStats.fromJson(Map<String, dynamic> json) =
      _$ChatStatsImpl.fromJson;

  @override
  int get totalMessages;
  @override
  int get totalRooms;
  @override
  int get unreadMessages;
  @override
  int get messagesToday;
  @override
  int get messagesThisWeek;
  @override
  int get messagesThisMonth;
  @override
  int get activeRooms;

  /// Create a copy of ChatStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStatsImplCopyWith<_$ChatStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatSearchResult _$ChatSearchResultFromJson(Map<String, dynamic> json) {
  return _ChatSearchResult.fromJson(json);
}

/// @nodoc
mixin _$ChatSearchResult {
  List<ChatRoom> get rooms => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;
  List<ChatParticipant> get participants => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  DateTime get searchedAt => throw _privateConstructorUsedError;

  /// Serializes this ChatSearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatSearchResultCopyWith<ChatSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSearchResultCopyWith<$Res> {
  factory $ChatSearchResultCopyWith(
    ChatSearchResult value,
    $Res Function(ChatSearchResult) then,
  ) = _$ChatSearchResultCopyWithImpl<$Res, ChatSearchResult>;
  @useResult
  $Res call({
    List<ChatRoom> rooms,
    List<Message> messages,
    List<ChatParticipant> participants,
    String query,
    DateTime searchedAt,
  });
}

/// @nodoc
class _$ChatSearchResultCopyWithImpl<$Res, $Val extends ChatSearchResult>
    implements $ChatSearchResultCopyWith<$Res> {
  _$ChatSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? messages = null,
    Object? participants = null,
    Object? query = null,
    Object? searchedAt = null,
  }) {
    return _then(
      _value.copyWith(
            rooms: null == rooms
                ? _value.rooms
                : rooms // ignore: cast_nullable_to_non_nullable
                      as List<ChatRoom>,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<Message>,
            participants: null == participants
                ? _value.participants
                : participants // ignore: cast_nullable_to_non_nullable
                      as List<ChatParticipant>,
            query: null == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                      as String,
            searchedAt: null == searchedAt
                ? _value.searchedAt
                : searchedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatSearchResultImplCopyWith<$Res>
    implements $ChatSearchResultCopyWith<$Res> {
  factory _$$ChatSearchResultImplCopyWith(
    _$ChatSearchResultImpl value,
    $Res Function(_$ChatSearchResultImpl) then,
  ) = __$$ChatSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ChatRoom> rooms,
    List<Message> messages,
    List<ChatParticipant> participants,
    String query,
    DateTime searchedAt,
  });
}

/// @nodoc
class __$$ChatSearchResultImplCopyWithImpl<$Res>
    extends _$ChatSearchResultCopyWithImpl<$Res, _$ChatSearchResultImpl>
    implements _$$ChatSearchResultImplCopyWith<$Res> {
  __$$ChatSearchResultImplCopyWithImpl(
    _$ChatSearchResultImpl _value,
    $Res Function(_$ChatSearchResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? messages = null,
    Object? participants = null,
    Object? query = null,
    Object? searchedAt = null,
  }) {
    return _then(
      _$ChatSearchResultImpl(
        rooms: null == rooms
            ? _value._rooms
            : rooms // ignore: cast_nullable_to_non_nullable
                  as List<ChatRoom>,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<Message>,
        participants: null == participants
            ? _value._participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<ChatParticipant>,
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        searchedAt: null == searchedAt
            ? _value.searchedAt
            : searchedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatSearchResultImpl extends _ChatSearchResult {
  const _$ChatSearchResultImpl({
    required final List<ChatRoom> rooms,
    required final List<Message> messages,
    required final List<ChatParticipant> participants,
    required this.query,
    required this.searchedAt,
  }) : _rooms = rooms,
       _messages = messages,
       _participants = participants,
       super._();

  factory _$ChatSearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSearchResultImplFromJson(json);

  final List<ChatRoom> _rooms;
  @override
  List<ChatRoom> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<ChatParticipant> _participants;
  @override
  List<ChatParticipant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final String query;
  @override
  final DateTime searchedAt;

  @override
  String toString() {
    return 'ChatSearchResult(rooms: $rooms, messages: $messages, participants: $participants, query: $query, searchedAt: $searchedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSearchResultImpl &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.searchedAt, searchedAt) ||
                other.searchedAt == searchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_rooms),
    const DeepCollectionEquality().hash(_messages),
    const DeepCollectionEquality().hash(_participants),
    query,
    searchedAt,
  );

  /// Create a copy of ChatSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSearchResultImplCopyWith<_$ChatSearchResultImpl> get copyWith =>
      __$$ChatSearchResultImplCopyWithImpl<_$ChatSearchResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatSearchResultImplToJson(this);
  }
}

abstract class _ChatSearchResult extends ChatSearchResult {
  const factory _ChatSearchResult({
    required final List<ChatRoom> rooms,
    required final List<Message> messages,
    required final List<ChatParticipant> participants,
    required final String query,
    required final DateTime searchedAt,
  }) = _$ChatSearchResultImpl;
  const _ChatSearchResult._() : super._();

  factory _ChatSearchResult.fromJson(Map<String, dynamic> json) =
      _$ChatSearchResultImpl.fromJson;

  @override
  List<ChatRoom> get rooms;
  @override
  List<Message> get messages;
  @override
  List<ChatParticipant> get participants;
  @override
  String get query;
  @override
  DateTime get searchedAt;

  /// Create a copy of ChatSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatSearchResultImplCopyWith<_$ChatSearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
