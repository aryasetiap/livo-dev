// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  String? get actionUrl => throw _privateConstructorUsedError;
  String? get actionText => throw _privateConstructorUsedError;
  Map<String, dynamic>? get actionData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  NotificationActor? get actor => throw _privateConstructorUsedError;
  NotificationTarget? get target => throw _privateConstructorUsedError;

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
    Notification value,
    $Res Function(Notification) then,
  ) = _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call({
    String id,
    String userId,
    NotificationType type,
    String title,
    String body,
    DateTime createdAt,
    bool isRead,
    DateTime? readAt,
    String? actionUrl,
    String? actionText,
    Map<String, dynamic>? actionData,
    Map<String, dynamic>? metadata,
    NotificationActor? actor,
    NotificationTarget? target,
  });

  $NotificationActorCopyWith<$Res>? get actor;
  $NotificationTargetCopyWith<$Res>? get target;
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? readAt = freezed,
    Object? actionUrl = freezed,
    Object? actionText = freezed,
    Object? actionData = freezed,
    Object? metadata = freezed,
    Object? actor = freezed,
    Object? target = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as NotificationType,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isRead: null == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                      as bool,
            readAt: freezed == readAt
                ? _value.readAt
                : readAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            actionUrl: freezed == actionUrl
                ? _value.actionUrl
                : actionUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            actionText: freezed == actionText
                ? _value.actionText
                : actionText // ignore: cast_nullable_to_non_nullable
                      as String?,
            actionData: freezed == actionData
                ? _value.actionData
                : actionData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            actor: freezed == actor
                ? _value.actor
                : actor // ignore: cast_nullable_to_non_nullable
                      as NotificationActor?,
            target: freezed == target
                ? _value.target
                : target // ignore: cast_nullable_to_non_nullable
                      as NotificationTarget?,
          )
          as $Val,
    );
  }

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationActorCopyWith<$Res>? get actor {
    if (_value.actor == null) {
      return null;
    }

    return $NotificationActorCopyWith<$Res>(_value.actor!, (value) {
      return _then(_value.copyWith(actor: value) as $Val);
    });
  }

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationTargetCopyWith<$Res>? get target {
    if (_value.target == null) {
      return null;
    }

    return $NotificationTargetCopyWith<$Res>(_value.target!, (value) {
      return _then(_value.copyWith(target: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
    _$NotificationImpl value,
    $Res Function(_$NotificationImpl) then,
  ) = __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    NotificationType type,
    String title,
    String body,
    DateTime createdAt,
    bool isRead,
    DateTime? readAt,
    String? actionUrl,
    String? actionText,
    Map<String, dynamic>? actionData,
    Map<String, dynamic>? metadata,
    NotificationActor? actor,
    NotificationTarget? target,
  });

  @override
  $NotificationActorCopyWith<$Res>? get actor;
  @override
  $NotificationTargetCopyWith<$Res>? get target;
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
    _$NotificationImpl _value,
    $Res Function(_$NotificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? readAt = freezed,
    Object? actionUrl = freezed,
    Object? actionText = freezed,
    Object? actionData = freezed,
    Object? metadata = freezed,
    Object? actor = freezed,
    Object? target = freezed,
  }) {
    return _then(
      _$NotificationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as NotificationType,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isRead: null == isRead
            ? _value.isRead
            : isRead // ignore: cast_nullable_to_non_nullable
                  as bool,
        readAt: freezed == readAt
            ? _value.readAt
            : readAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        actionUrl: freezed == actionUrl
            ? _value.actionUrl
            : actionUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionText: freezed == actionText
            ? _value.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionData: freezed == actionData
            ? _value._actionData
            : actionData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        actor: freezed == actor
            ? _value.actor
            : actor // ignore: cast_nullable_to_non_nullable
                  as NotificationActor?,
        target: freezed == target
            ? _value.target
            : target // ignore: cast_nullable_to_non_nullable
                  as NotificationTarget?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl extends _Notification {
  const _$NotificationImpl({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    required this.createdAt,
    this.isRead = false,
    this.readAt,
    this.actionUrl,
    this.actionText,
    final Map<String, dynamic>? actionData,
    final Map<String, dynamic>? metadata,
    this.actor,
    this.target,
  }) : _actionData = actionData,
       _metadata = metadata,
       super._();

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final NotificationType type;
  @override
  final String title;
  @override
  final String body;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isRead;
  @override
  final DateTime? readAt;
  @override
  final String? actionUrl;
  @override
  final String? actionText;
  final Map<String, dynamic>? _actionData;
  @override
  Map<String, dynamic>? get actionData {
    final value = _actionData;
    if (value == null) return null;
    if (_actionData is EqualUnmodifiableMapView) return _actionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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
  final NotificationActor? actor;
  @override
  final NotificationTarget? target;

  @override
  String toString() {
    return 'Notification(id: $id, userId: $userId, type: $type, title: $title, body: $body, createdAt: $createdAt, isRead: $isRead, readAt: $readAt, actionUrl: $actionUrl, actionText: $actionText, actionData: $actionData, metadata: $metadata, actor: $actor, target: $target)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            const DeepCollectionEquality().equals(
              other._actionData,
              _actionData,
            ) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.actor, actor) || other.actor == actor) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    type,
    title,
    body,
    createdAt,
    isRead,
    readAt,
    actionUrl,
    actionText,
    const DeepCollectionEquality().hash(_actionData),
    const DeepCollectionEquality().hash(_metadata),
    actor,
    target,
  );

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(this);
  }
}

abstract class _Notification extends Notification {
  const factory _Notification({
    required final String id,
    required final String userId,
    required final NotificationType type,
    required final String title,
    required final String body,
    required final DateTime createdAt,
    final bool isRead,
    final DateTime? readAt,
    final String? actionUrl,
    final String? actionText,
    final Map<String, dynamic>? actionData,
    final Map<String, dynamic>? metadata,
    final NotificationActor? actor,
    final NotificationTarget? target,
  }) = _$NotificationImpl;
  const _Notification._() : super._();

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  NotificationType get type;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get createdAt;
  @override
  bool get isRead;
  @override
  DateTime? get readAt;
  @override
  String? get actionUrl;
  @override
  String? get actionText;
  @override
  Map<String, dynamic>? get actionData;
  @override
  Map<String, dynamic>? get metadata;
  @override
  NotificationActor? get actor;
  @override
  NotificationTarget? get target;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationActor _$NotificationActorFromJson(Map<String, dynamic> json) {
  return _NotificationActor.fromJson(json);
}

/// @nodoc
mixin _$NotificationActor {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Serializes this NotificationActor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationActor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationActorCopyWith<NotificationActor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationActorCopyWith<$Res> {
  factory $NotificationActorCopyWith(
    NotificationActor value,
    $Res Function(NotificationActor) then,
  ) = _$NotificationActorCopyWithImpl<$Res, NotificationActor>;
  @useResult
  $Res call({
    String id,
    String username,
    String displayName,
    String? avatarUrl,
    bool isVerified,
  });
}

/// @nodoc
class _$NotificationActorCopyWithImpl<$Res, $Val extends NotificationActor>
    implements $NotificationActorCopyWith<$Res> {
  _$NotificationActorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationActor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? isVerified = null,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationActorImplCopyWith<$Res>
    implements $NotificationActorCopyWith<$Res> {
  factory _$$NotificationActorImplCopyWith(
    _$NotificationActorImpl value,
    $Res Function(_$NotificationActorImpl) then,
  ) = __$$NotificationActorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String username,
    String displayName,
    String? avatarUrl,
    bool isVerified,
  });
}

/// @nodoc
class __$$NotificationActorImplCopyWithImpl<$Res>
    extends _$NotificationActorCopyWithImpl<$Res, _$NotificationActorImpl>
    implements _$$NotificationActorImplCopyWith<$Res> {
  __$$NotificationActorImplCopyWithImpl(
    _$NotificationActorImpl _value,
    $Res Function(_$NotificationActorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationActor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? isVerified = null,
  }) {
    return _then(
      _$NotificationActorImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationActorImpl extends _NotificationActor {
  const _$NotificationActorImpl({
    required this.id,
    required this.username,
    required this.displayName,
    this.avatarUrl,
    this.isVerified = false,
  }) : super._();

  factory _$NotificationActorImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationActorImplFromJson(json);

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
  String toString() {
    return 'NotificationActor(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationActorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
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
  );

  /// Create a copy of NotificationActor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationActorImplCopyWith<_$NotificationActorImpl> get copyWith =>
      __$$NotificationActorImplCopyWithImpl<_$NotificationActorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationActorImplToJson(this);
  }
}

abstract class _NotificationActor extends NotificationActor {
  const factory _NotificationActor({
    required final String id,
    required final String username,
    required final String displayName,
    final String? avatarUrl,
    final bool isVerified,
  }) = _$NotificationActorImpl;
  const _NotificationActor._() : super._();

  factory _NotificationActor.fromJson(Map<String, dynamic> json) =
      _$NotificationActorImpl.fromJson;

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

  /// Create a copy of NotificationActor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationActorImplCopyWith<_$NotificationActorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationTarget _$NotificationTargetFromJson(Map<String, dynamic> json) {
  return _NotificationTarget.fromJson(json);
}

/// @nodoc
mixin _$NotificationTarget {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this NotificationTarget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationTargetCopyWith<NotificationTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTargetCopyWith<$Res> {
  factory $NotificationTargetCopyWith(
    NotificationTarget value,
    $Res Function(NotificationTarget) then,
  ) = _$NotificationTargetCopyWithImpl<$Res, NotificationTarget>;
  @useResult
  $Res call({
    String id,
    String type,
    String? title,
    String? thumbnailUrl,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$NotificationTargetCopyWithImpl<$Res, $Val extends NotificationTarget>
    implements $NotificationTargetCopyWith<$Res> {
  _$NotificationTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = freezed,
    Object? thumbnailUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
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
abstract class _$$NotificationTargetImplCopyWith<$Res>
    implements $NotificationTargetCopyWith<$Res> {
  factory _$$NotificationTargetImplCopyWith(
    _$NotificationTargetImpl value,
    $Res Function(_$NotificationTargetImpl) then,
  ) = __$$NotificationTargetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String? title,
    String? thumbnailUrl,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$NotificationTargetImplCopyWithImpl<$Res>
    extends _$NotificationTargetCopyWithImpl<$Res, _$NotificationTargetImpl>
    implements _$$NotificationTargetImplCopyWith<$Res> {
  __$$NotificationTargetImplCopyWithImpl(
    _$NotificationTargetImpl _value,
    $Res Function(_$NotificationTargetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = freezed,
    Object? thumbnailUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$NotificationTargetImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
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
class _$NotificationTargetImpl extends _NotificationTarget {
  const _$NotificationTargetImpl({
    required this.id,
    required this.type,
    this.title,
    this.thumbnailUrl,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata,
       super._();

  factory _$NotificationTargetImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationTargetImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String? title;
  @override
  final String? thumbnailUrl;
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
    return 'NotificationTarget(id: $id, type: $type, title: $title, thumbnailUrl: $thumbnailUrl, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTargetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    title,
    thumbnailUrl,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of NotificationTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationTargetImplCopyWith<_$NotificationTargetImpl> get copyWith =>
      __$$NotificationTargetImplCopyWithImpl<_$NotificationTargetImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationTargetImplToJson(this);
  }
}

abstract class _NotificationTarget extends NotificationTarget {
  const factory _NotificationTarget({
    required final String id,
    required final String type,
    final String? title,
    final String? thumbnailUrl,
    final Map<String, dynamic>? metadata,
  }) = _$NotificationTargetImpl;
  const _NotificationTarget._() : super._();

  factory _NotificationTarget.fromJson(Map<String, dynamic> json) =
      _$NotificationTargetImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String? get title;
  @override
  String? get thumbnailUrl;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of NotificationTarget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationTargetImplCopyWith<_$NotificationTargetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  String get userId => throw _privateConstructorUsedError;
  bool get pushNotifications => throw _privateConstructorUsedError;
  bool get emailNotifications => throw _privateConstructorUsedError;
  bool get inAppNotifications => throw _privateConstructorUsedError;
  bool get likesEnabled => throw _privateConstructorUsedError;
  bool get commentsEnabled => throw _privateConstructorUsedError;
  bool get followsEnabled => throw _privateConstructorUsedError;
  bool get messagesEnabled => throw _privateConstructorUsedError;
  bool get mentionsEnabled => throw _privateConstructorUsedError;
  bool get storyReactionsEnabled => throw _privateConstructorUsedError;
  bool get storyRepliesEnabled => throw _privateConstructorUsedError;
  bool get storyViewsEnabled => throw _privateConstructorUsedError;
  bool get postSharesEnabled => throw _privateConstructorUsedError;
  bool get systemNotificationsEnabled => throw _privateConstructorUsedError;
  Map<String, bool>? get customSettings => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(
    NotificationSettings value,
    $Res Function(NotificationSettings) then,
  ) = _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call({
    String userId,
    bool pushNotifications,
    bool emailNotifications,
    bool inAppNotifications,
    bool likesEnabled,
    bool commentsEnabled,
    bool followsEnabled,
    bool messagesEnabled,
    bool mentionsEnabled,
    bool storyReactionsEnabled,
    bool storyRepliesEnabled,
    bool storyViewsEnabled,
    bool postSharesEnabled,
    bool systemNotificationsEnabled,
    Map<String, bool>? customSettings,
  });
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<
  $Res,
  $Val extends NotificationSettings
>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pushNotifications = null,
    Object? emailNotifications = null,
    Object? inAppNotifications = null,
    Object? likesEnabled = null,
    Object? commentsEnabled = null,
    Object? followsEnabled = null,
    Object? messagesEnabled = null,
    Object? mentionsEnabled = null,
    Object? storyReactionsEnabled = null,
    Object? storyRepliesEnabled = null,
    Object? storyViewsEnabled = null,
    Object? postSharesEnabled = null,
    Object? systemNotificationsEnabled = null,
    Object? customSettings = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            pushNotifications: null == pushNotifications
                ? _value.pushNotifications
                : pushNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            emailNotifications: null == emailNotifications
                ? _value.emailNotifications
                : emailNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            inAppNotifications: null == inAppNotifications
                ? _value.inAppNotifications
                : inAppNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            likesEnabled: null == likesEnabled
                ? _value.likesEnabled
                : likesEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            commentsEnabled: null == commentsEnabled
                ? _value.commentsEnabled
                : commentsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            followsEnabled: null == followsEnabled
                ? _value.followsEnabled
                : followsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            messagesEnabled: null == messagesEnabled
                ? _value.messagesEnabled
                : messagesEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            mentionsEnabled: null == mentionsEnabled
                ? _value.mentionsEnabled
                : mentionsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            storyReactionsEnabled: null == storyReactionsEnabled
                ? _value.storyReactionsEnabled
                : storyReactionsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            storyRepliesEnabled: null == storyRepliesEnabled
                ? _value.storyRepliesEnabled
                : storyRepliesEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            storyViewsEnabled: null == storyViewsEnabled
                ? _value.storyViewsEnabled
                : storyViewsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            postSharesEnabled: null == postSharesEnabled
                ? _value.postSharesEnabled
                : postSharesEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            systemNotificationsEnabled: null == systemNotificationsEnabled
                ? _value.systemNotificationsEnabled
                : systemNotificationsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            customSettings: freezed == customSettings
                ? _value.customSettings
                : customSettings // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(
    _$NotificationSettingsImpl value,
    $Res Function(_$NotificationSettingsImpl) then,
  ) = __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    bool pushNotifications,
    bool emailNotifications,
    bool inAppNotifications,
    bool likesEnabled,
    bool commentsEnabled,
    bool followsEnabled,
    bool messagesEnabled,
    bool mentionsEnabled,
    bool storyReactionsEnabled,
    bool storyRepliesEnabled,
    bool storyViewsEnabled,
    bool postSharesEnabled,
    bool systemNotificationsEnabled,
    Map<String, bool>? customSettings,
  });
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(
    _$NotificationSettingsImpl _value,
    $Res Function(_$NotificationSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pushNotifications = null,
    Object? emailNotifications = null,
    Object? inAppNotifications = null,
    Object? likesEnabled = null,
    Object? commentsEnabled = null,
    Object? followsEnabled = null,
    Object? messagesEnabled = null,
    Object? mentionsEnabled = null,
    Object? storyReactionsEnabled = null,
    Object? storyRepliesEnabled = null,
    Object? storyViewsEnabled = null,
    Object? postSharesEnabled = null,
    Object? systemNotificationsEnabled = null,
    Object? customSettings = freezed,
  }) {
    return _then(
      _$NotificationSettingsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        pushNotifications: null == pushNotifications
            ? _value.pushNotifications
            : pushNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        emailNotifications: null == emailNotifications
            ? _value.emailNotifications
            : emailNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        inAppNotifications: null == inAppNotifications
            ? _value.inAppNotifications
            : inAppNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        likesEnabled: null == likesEnabled
            ? _value.likesEnabled
            : likesEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        commentsEnabled: null == commentsEnabled
            ? _value.commentsEnabled
            : commentsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        followsEnabled: null == followsEnabled
            ? _value.followsEnabled
            : followsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        messagesEnabled: null == messagesEnabled
            ? _value.messagesEnabled
            : messagesEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        mentionsEnabled: null == mentionsEnabled
            ? _value.mentionsEnabled
            : mentionsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        storyReactionsEnabled: null == storyReactionsEnabled
            ? _value.storyReactionsEnabled
            : storyReactionsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        storyRepliesEnabled: null == storyRepliesEnabled
            ? _value.storyRepliesEnabled
            : storyRepliesEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        storyViewsEnabled: null == storyViewsEnabled
            ? _value.storyViewsEnabled
            : storyViewsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        postSharesEnabled: null == postSharesEnabled
            ? _value.postSharesEnabled
            : postSharesEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        systemNotificationsEnabled: null == systemNotificationsEnabled
            ? _value.systemNotificationsEnabled
            : systemNotificationsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        customSettings: freezed == customSettings
            ? _value._customSettings
            : customSettings // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl extends _NotificationSettings {
  const _$NotificationSettingsImpl({
    required this.userId,
    this.pushNotifications = true,
    this.emailNotifications = true,
    this.inAppNotifications = true,
    this.likesEnabled = true,
    this.commentsEnabled = true,
    this.followsEnabled = true,
    this.messagesEnabled = true,
    this.mentionsEnabled = true,
    this.storyReactionsEnabled = true,
    this.storyRepliesEnabled = true,
    this.storyViewsEnabled = true,
    this.postSharesEnabled = true,
    this.systemNotificationsEnabled = true,
    final Map<String, bool>? customSettings,
  }) : _customSettings = customSettings,
       super._();

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey()
  final bool pushNotifications;
  @override
  @JsonKey()
  final bool emailNotifications;
  @override
  @JsonKey()
  final bool inAppNotifications;
  @override
  @JsonKey()
  final bool likesEnabled;
  @override
  @JsonKey()
  final bool commentsEnabled;
  @override
  @JsonKey()
  final bool followsEnabled;
  @override
  @JsonKey()
  final bool messagesEnabled;
  @override
  @JsonKey()
  final bool mentionsEnabled;
  @override
  @JsonKey()
  final bool storyReactionsEnabled;
  @override
  @JsonKey()
  final bool storyRepliesEnabled;
  @override
  @JsonKey()
  final bool storyViewsEnabled;
  @override
  @JsonKey()
  final bool postSharesEnabled;
  @override
  @JsonKey()
  final bool systemNotificationsEnabled;
  final Map<String, bool>? _customSettings;
  @override
  Map<String, bool>? get customSettings {
    final value = _customSettings;
    if (value == null) return null;
    if (_customSettings is EqualUnmodifiableMapView) return _customSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'NotificationSettings(userId: $userId, pushNotifications: $pushNotifications, emailNotifications: $emailNotifications, inAppNotifications: $inAppNotifications, likesEnabled: $likesEnabled, commentsEnabled: $commentsEnabled, followsEnabled: $followsEnabled, messagesEnabled: $messagesEnabled, mentionsEnabled: $mentionsEnabled, storyReactionsEnabled: $storyReactionsEnabled, storyRepliesEnabled: $storyRepliesEnabled, storyViewsEnabled: $storyViewsEnabled, postSharesEnabled: $postSharesEnabled, systemNotificationsEnabled: $systemNotificationsEnabled, customSettings: $customSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.inAppNotifications, inAppNotifications) ||
                other.inAppNotifications == inAppNotifications) &&
            (identical(other.likesEnabled, likesEnabled) ||
                other.likesEnabled == likesEnabled) &&
            (identical(other.commentsEnabled, commentsEnabled) ||
                other.commentsEnabled == commentsEnabled) &&
            (identical(other.followsEnabled, followsEnabled) ||
                other.followsEnabled == followsEnabled) &&
            (identical(other.messagesEnabled, messagesEnabled) ||
                other.messagesEnabled == messagesEnabled) &&
            (identical(other.mentionsEnabled, mentionsEnabled) ||
                other.mentionsEnabled == mentionsEnabled) &&
            (identical(other.storyReactionsEnabled, storyReactionsEnabled) ||
                other.storyReactionsEnabled == storyReactionsEnabled) &&
            (identical(other.storyRepliesEnabled, storyRepliesEnabled) ||
                other.storyRepliesEnabled == storyRepliesEnabled) &&
            (identical(other.storyViewsEnabled, storyViewsEnabled) ||
                other.storyViewsEnabled == storyViewsEnabled) &&
            (identical(other.postSharesEnabled, postSharesEnabled) ||
                other.postSharesEnabled == postSharesEnabled) &&
            (identical(
                  other.systemNotificationsEnabled,
                  systemNotificationsEnabled,
                ) ||
                other.systemNotificationsEnabled ==
                    systemNotificationsEnabled) &&
            const DeepCollectionEquality().equals(
              other._customSettings,
              _customSettings,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    pushNotifications,
    emailNotifications,
    inAppNotifications,
    likesEnabled,
    commentsEnabled,
    followsEnabled,
    messagesEnabled,
    mentionsEnabled,
    storyReactionsEnabled,
    storyRepliesEnabled,
    storyViewsEnabled,
    postSharesEnabled,
    systemNotificationsEnabled,
    const DeepCollectionEquality().hash(_customSettings),
  );

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
  get copyWith =>
      __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(this);
  }
}

abstract class _NotificationSettings extends NotificationSettings {
  const factory _NotificationSettings({
    required final String userId,
    final bool pushNotifications,
    final bool emailNotifications,
    final bool inAppNotifications,
    final bool likesEnabled,
    final bool commentsEnabled,
    final bool followsEnabled,
    final bool messagesEnabled,
    final bool mentionsEnabled,
    final bool storyReactionsEnabled,
    final bool storyRepliesEnabled,
    final bool storyViewsEnabled,
    final bool postSharesEnabled,
    final bool systemNotificationsEnabled,
    final Map<String, bool>? customSettings,
  }) = _$NotificationSettingsImpl;
  const _NotificationSettings._() : super._();

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  String get userId;
  @override
  bool get pushNotifications;
  @override
  bool get emailNotifications;
  @override
  bool get inAppNotifications;
  @override
  bool get likesEnabled;
  @override
  bool get commentsEnabled;
  @override
  bool get followsEnabled;
  @override
  bool get messagesEnabled;
  @override
  bool get mentionsEnabled;
  @override
  bool get storyReactionsEnabled;
  @override
  bool get storyRepliesEnabled;
  @override
  bool get storyViewsEnabled;
  @override
  bool get postSharesEnabled;
  @override
  bool get systemNotificationsEnabled;
  @override
  Map<String, bool>? get customSettings;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PushNotificationPayload _$PushNotificationPayloadFromJson(
  Map<String, dynamic> json,
) {
  return _PushNotificationPayload.fromJson(json);
}

/// @nodoc
mixin _$PushNotificationPayload {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get sound => throw _privateConstructorUsedError;
  String? get badge => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  /// Serializes this PushNotificationPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PushNotificationPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PushNotificationPayloadCopyWith<PushNotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationPayloadCopyWith<$Res> {
  factory $PushNotificationPayloadCopyWith(
    PushNotificationPayload value,
    $Res Function(PushNotificationPayload) then,
  ) = _$PushNotificationPayloadCopyWithImpl<$Res, PushNotificationPayload>;
  @useResult
  $Res call({
    String title,
    String body,
    String? imageUrl,
    String? icon,
    String? sound,
    String? badge,
    Map<String, dynamic>? data,
  });
}

/// @nodoc
class _$PushNotificationPayloadCopyWithImpl<
  $Res,
  $Val extends PushNotificationPayload
>
    implements $PushNotificationPayloadCopyWith<$Res> {
  _$PushNotificationPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PushNotificationPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? imageUrl = freezed,
    Object? icon = freezed,
    Object? sound = freezed,
    Object? badge = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String?,
            sound: freezed == sound
                ? _value.sound
                : sound // ignore: cast_nullable_to_non_nullable
                      as String?,
            badge: freezed == badge
                ? _value.badge
                : badge // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PushNotificationPayloadImplCopyWith<$Res>
    implements $PushNotificationPayloadCopyWith<$Res> {
  factory _$$PushNotificationPayloadImplCopyWith(
    _$PushNotificationPayloadImpl value,
    $Res Function(_$PushNotificationPayloadImpl) then,
  ) = __$$PushNotificationPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String body,
    String? imageUrl,
    String? icon,
    String? sound,
    String? badge,
    Map<String, dynamic>? data,
  });
}

/// @nodoc
class __$$PushNotificationPayloadImplCopyWithImpl<$Res>
    extends
        _$PushNotificationPayloadCopyWithImpl<
          $Res,
          _$PushNotificationPayloadImpl
        >
    implements _$$PushNotificationPayloadImplCopyWith<$Res> {
  __$$PushNotificationPayloadImplCopyWithImpl(
    _$PushNotificationPayloadImpl _value,
    $Res Function(_$PushNotificationPayloadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PushNotificationPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? imageUrl = freezed,
    Object? icon = freezed,
    Object? sound = freezed,
    Object? badge = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$PushNotificationPayloadImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String?,
        sound: freezed == sound
            ? _value.sound
            : sound // ignore: cast_nullable_to_non_nullable
                  as String?,
        badge: freezed == badge
            ? _value.badge
            : badge // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationPayloadImpl implements _PushNotificationPayload {
  const _$PushNotificationPayloadImpl({
    required this.title,
    required this.body,
    this.imageUrl,
    this.icon,
    this.sound,
    this.badge,
    final Map<String, dynamic>? data,
  }) : _data = data;

  factory _$PushNotificationPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationPayloadImplFromJson(json);

  @override
  final String title;
  @override
  final String body;
  @override
  final String? imageUrl;
  @override
  final String? icon;
  @override
  final String? sound;
  @override
  final String? badge;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PushNotificationPayload(title: $title, body: $body, imageUrl: $imageUrl, icon: $icon, sound: $sound, badge: $badge, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationPayloadImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    body,
    imageUrl,
    icon,
    sound,
    badge,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of PushNotificationPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationPayloadImplCopyWith<_$PushNotificationPayloadImpl>
  get copyWith =>
      __$$PushNotificationPayloadImplCopyWithImpl<
        _$PushNotificationPayloadImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationPayloadImplToJson(this);
  }
}

abstract class _PushNotificationPayload implements PushNotificationPayload {
  const factory _PushNotificationPayload({
    required final String title,
    required final String body,
    final String? imageUrl,
    final String? icon,
    final String? sound,
    final String? badge,
    final Map<String, dynamic>? data,
  }) = _$PushNotificationPayloadImpl;

  factory _PushNotificationPayload.fromJson(Map<String, dynamic> json) =
      _$PushNotificationPayloadImpl.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  String? get imageUrl;
  @override
  String? get icon;
  @override
  String? get sound;
  @override
  String? get badge;
  @override
  Map<String, dynamic>? get data;

  /// Create a copy of PushNotificationPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushNotificationPayloadImplCopyWith<_$PushNotificationPayloadImpl>
  get copyWith => throw _privateConstructorUsedError;
}

NotificationStats _$NotificationStatsFromJson(Map<String, dynamic> json) {
  return _NotificationStats.fromJson(json);
}

/// @nodoc
mixin _$NotificationStats {
  int get totalNotifications => throw _privateConstructorUsedError;
  int get unreadNotifications => throw _privateConstructorUsedError;
  int get notificationsToday => throw _privateConstructorUsedError;
  int get notificationsThisWeek => throw _privateConstructorUsedError;
  int get notificationsThisMonth => throw _privateConstructorUsedError;
  Map<NotificationType, int> get typeCounts =>
      throw _privateConstructorUsedError;

  /// Serializes this NotificationStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationStatsCopyWith<NotificationStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStatsCopyWith<$Res> {
  factory $NotificationStatsCopyWith(
    NotificationStats value,
    $Res Function(NotificationStats) then,
  ) = _$NotificationStatsCopyWithImpl<$Res, NotificationStats>;
  @useResult
  $Res call({
    int totalNotifications,
    int unreadNotifications,
    int notificationsToday,
    int notificationsThisWeek,
    int notificationsThisMonth,
    Map<NotificationType, int> typeCounts,
  });
}

/// @nodoc
class _$NotificationStatsCopyWithImpl<$Res, $Val extends NotificationStats>
    implements $NotificationStatsCopyWith<$Res> {
  _$NotificationStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalNotifications = null,
    Object? unreadNotifications = null,
    Object? notificationsToday = null,
    Object? notificationsThisWeek = null,
    Object? notificationsThisMonth = null,
    Object? typeCounts = null,
  }) {
    return _then(
      _value.copyWith(
            totalNotifications: null == totalNotifications
                ? _value.totalNotifications
                : totalNotifications // ignore: cast_nullable_to_non_nullable
                      as int,
            unreadNotifications: null == unreadNotifications
                ? _value.unreadNotifications
                : unreadNotifications // ignore: cast_nullable_to_non_nullable
                      as int,
            notificationsToday: null == notificationsToday
                ? _value.notificationsToday
                : notificationsToday // ignore: cast_nullable_to_non_nullable
                      as int,
            notificationsThisWeek: null == notificationsThisWeek
                ? _value.notificationsThisWeek
                : notificationsThisWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            notificationsThisMonth: null == notificationsThisMonth
                ? _value.notificationsThisMonth
                : notificationsThisMonth // ignore: cast_nullable_to_non_nullable
                      as int,
            typeCounts: null == typeCounts
                ? _value.typeCounts
                : typeCounts // ignore: cast_nullable_to_non_nullable
                      as Map<NotificationType, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationStatsImplCopyWith<$Res>
    implements $NotificationStatsCopyWith<$Res> {
  factory _$$NotificationStatsImplCopyWith(
    _$NotificationStatsImpl value,
    $Res Function(_$NotificationStatsImpl) then,
  ) = __$$NotificationStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalNotifications,
    int unreadNotifications,
    int notificationsToday,
    int notificationsThisWeek,
    int notificationsThisMonth,
    Map<NotificationType, int> typeCounts,
  });
}

/// @nodoc
class __$$NotificationStatsImplCopyWithImpl<$Res>
    extends _$NotificationStatsCopyWithImpl<$Res, _$NotificationStatsImpl>
    implements _$$NotificationStatsImplCopyWith<$Res> {
  __$$NotificationStatsImplCopyWithImpl(
    _$NotificationStatsImpl _value,
    $Res Function(_$NotificationStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalNotifications = null,
    Object? unreadNotifications = null,
    Object? notificationsToday = null,
    Object? notificationsThisWeek = null,
    Object? notificationsThisMonth = null,
    Object? typeCounts = null,
  }) {
    return _then(
      _$NotificationStatsImpl(
        totalNotifications: null == totalNotifications
            ? _value.totalNotifications
            : totalNotifications // ignore: cast_nullable_to_non_nullable
                  as int,
        unreadNotifications: null == unreadNotifications
            ? _value.unreadNotifications
            : unreadNotifications // ignore: cast_nullable_to_non_nullable
                  as int,
        notificationsToday: null == notificationsToday
            ? _value.notificationsToday
            : notificationsToday // ignore: cast_nullable_to_non_nullable
                  as int,
        notificationsThisWeek: null == notificationsThisWeek
            ? _value.notificationsThisWeek
            : notificationsThisWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        notificationsThisMonth: null == notificationsThisMonth
            ? _value.notificationsThisMonth
            : notificationsThisMonth // ignore: cast_nullable_to_non_nullable
                  as int,
        typeCounts: null == typeCounts
            ? _value._typeCounts
            : typeCounts // ignore: cast_nullable_to_non_nullable
                  as Map<NotificationType, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationStatsImpl extends _NotificationStats {
  const _$NotificationStatsImpl({
    required this.totalNotifications,
    required this.unreadNotifications,
    this.notificationsToday = 0,
    this.notificationsThisWeek = 0,
    this.notificationsThisMonth = 0,
    final Map<NotificationType, int> typeCounts = const {},
  }) : _typeCounts = typeCounts,
       super._();

  factory _$NotificationStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationStatsImplFromJson(json);

  @override
  final int totalNotifications;
  @override
  final int unreadNotifications;
  @override
  @JsonKey()
  final int notificationsToday;
  @override
  @JsonKey()
  final int notificationsThisWeek;
  @override
  @JsonKey()
  final int notificationsThisMonth;
  final Map<NotificationType, int> _typeCounts;
  @override
  @JsonKey()
  Map<NotificationType, int> get typeCounts {
    if (_typeCounts is EqualUnmodifiableMapView) return _typeCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_typeCounts);
  }

  @override
  String toString() {
    return 'NotificationStats(totalNotifications: $totalNotifications, unreadNotifications: $unreadNotifications, notificationsToday: $notificationsToday, notificationsThisWeek: $notificationsThisWeek, notificationsThisMonth: $notificationsThisMonth, typeCounts: $typeCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStatsImpl &&
            (identical(other.totalNotifications, totalNotifications) ||
                other.totalNotifications == totalNotifications) &&
            (identical(other.unreadNotifications, unreadNotifications) ||
                other.unreadNotifications == unreadNotifications) &&
            (identical(other.notificationsToday, notificationsToday) ||
                other.notificationsToday == notificationsToday) &&
            (identical(other.notificationsThisWeek, notificationsThisWeek) ||
                other.notificationsThisWeek == notificationsThisWeek) &&
            (identical(other.notificationsThisMonth, notificationsThisMonth) ||
                other.notificationsThisMonth == notificationsThisMonth) &&
            const DeepCollectionEquality().equals(
              other._typeCounts,
              _typeCounts,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalNotifications,
    unreadNotifications,
    notificationsToday,
    notificationsThisWeek,
    notificationsThisMonth,
    const DeepCollectionEquality().hash(_typeCounts),
  );

  /// Create a copy of NotificationStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStatsImplCopyWith<_$NotificationStatsImpl> get copyWith =>
      __$$NotificationStatsImplCopyWithImpl<_$NotificationStatsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationStatsImplToJson(this);
  }
}

abstract class _NotificationStats extends NotificationStats {
  const factory _NotificationStats({
    required final int totalNotifications,
    required final int unreadNotifications,
    final int notificationsToday,
    final int notificationsThisWeek,
    final int notificationsThisMonth,
    final Map<NotificationType, int> typeCounts,
  }) = _$NotificationStatsImpl;
  const _NotificationStats._() : super._();

  factory _NotificationStats.fromJson(Map<String, dynamic> json) =
      _$NotificationStatsImpl.fromJson;

  @override
  int get totalNotifications;
  @override
  int get unreadNotifications;
  @override
  int get notificationsToday;
  @override
  int get notificationsThisWeek;
  @override
  int get notificationsThisMonth;
  @override
  Map<NotificationType, int> get typeCounts;

  /// Create a copy of NotificationStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationStatsImplCopyWith<_$NotificationStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateNotificationRequest {
  String get userId => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String? get actionUrl => throw _privateConstructorUsedError;
  String? get actionText => throw _privateConstructorUsedError;
  Map<String, dynamic>? get actionData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  NotificationActor? get actor => throw _privateConstructorUsedError;
  NotificationTarget? get target => throw _privateConstructorUsedError;
  NotificationPriority get priority => throw _privateConstructorUsedError;

  /// Create a copy of CreateNotificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateNotificationRequestCopyWith<CreateNotificationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNotificationRequestCopyWith<$Res> {
  factory $CreateNotificationRequestCopyWith(
    CreateNotificationRequest value,
    $Res Function(CreateNotificationRequest) then,
  ) = _$CreateNotificationRequestCopyWithImpl<$Res, CreateNotificationRequest>;
  @useResult
  $Res call({
    String userId,
    NotificationType type,
    String title,
    String body,
    String? actionUrl,
    String? actionText,
    Map<String, dynamic>? actionData,
    Map<String, dynamic>? metadata,
    NotificationActor? actor,
    NotificationTarget? target,
    NotificationPriority priority,
  });

  $NotificationActorCopyWith<$Res>? get actor;
  $NotificationTargetCopyWith<$Res>? get target;
}

/// @nodoc
class _$CreateNotificationRequestCopyWithImpl<
  $Res,
  $Val extends CreateNotificationRequest
>
    implements $CreateNotificationRequestCopyWith<$Res> {
  _$CreateNotificationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateNotificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? actionUrl = freezed,
    Object? actionText = freezed,
    Object? actionData = freezed,
    Object? metadata = freezed,
    Object? actor = freezed,
    Object? target = freezed,
    Object? priority = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as NotificationType,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String,
            actionUrl: freezed == actionUrl
                ? _value.actionUrl
                : actionUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            actionText: freezed == actionText
                ? _value.actionText
                : actionText // ignore: cast_nullable_to_non_nullable
                      as String?,
            actionData: freezed == actionData
                ? _value.actionData
                : actionData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            actor: freezed == actor
                ? _value.actor
                : actor // ignore: cast_nullable_to_non_nullable
                      as NotificationActor?,
            target: freezed == target
                ? _value.target
                : target // ignore: cast_nullable_to_non_nullable
                      as NotificationTarget?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as NotificationPriority,
          )
          as $Val,
    );
  }

  /// Create a copy of CreateNotificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationActorCopyWith<$Res>? get actor {
    if (_value.actor == null) {
      return null;
    }

    return $NotificationActorCopyWith<$Res>(_value.actor!, (value) {
      return _then(_value.copyWith(actor: value) as $Val);
    });
  }

  /// Create a copy of CreateNotificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationTargetCopyWith<$Res>? get target {
    if (_value.target == null) {
      return null;
    }

    return $NotificationTargetCopyWith<$Res>(_value.target!, (value) {
      return _then(_value.copyWith(target: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateNotificationRequestImplCopyWith<$Res>
    implements $CreateNotificationRequestCopyWith<$Res> {
  factory _$$CreateNotificationRequestImplCopyWith(
    _$CreateNotificationRequestImpl value,
    $Res Function(_$CreateNotificationRequestImpl) then,
  ) = __$$CreateNotificationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    NotificationType type,
    String title,
    String body,
    String? actionUrl,
    String? actionText,
    Map<String, dynamic>? actionData,
    Map<String, dynamic>? metadata,
    NotificationActor? actor,
    NotificationTarget? target,
    NotificationPriority priority,
  });

  @override
  $NotificationActorCopyWith<$Res>? get actor;
  @override
  $NotificationTargetCopyWith<$Res>? get target;
}

/// @nodoc
class __$$CreateNotificationRequestImplCopyWithImpl<$Res>
    extends
        _$CreateNotificationRequestCopyWithImpl<
          $Res,
          _$CreateNotificationRequestImpl
        >
    implements _$$CreateNotificationRequestImplCopyWith<$Res> {
  __$$CreateNotificationRequestImplCopyWithImpl(
    _$CreateNotificationRequestImpl _value,
    $Res Function(_$CreateNotificationRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateNotificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? actionUrl = freezed,
    Object? actionText = freezed,
    Object? actionData = freezed,
    Object? metadata = freezed,
    Object? actor = freezed,
    Object? target = freezed,
    Object? priority = null,
  }) {
    return _then(
      _$CreateNotificationRequestImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as NotificationType,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
        actionUrl: freezed == actionUrl
            ? _value.actionUrl
            : actionUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionText: freezed == actionText
            ? _value.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionData: freezed == actionData
            ? _value._actionData
            : actionData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        actor: freezed == actor
            ? _value.actor
            : actor // ignore: cast_nullable_to_non_nullable
                  as NotificationActor?,
        target: freezed == target
            ? _value.target
            : target // ignore: cast_nullable_to_non_nullable
                  as NotificationTarget?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as NotificationPriority,
      ),
    );
  }
}

/// @nodoc

class _$CreateNotificationRequestImpl extends _CreateNotificationRequest {
  const _$CreateNotificationRequestImpl({
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    this.actionUrl,
    this.actionText,
    final Map<String, dynamic>? actionData,
    final Map<String, dynamic>? metadata,
    this.actor,
    this.target,
    this.priority = NotificationPriority.normal,
  }) : _actionData = actionData,
       _metadata = metadata,
       super._();

  @override
  final String userId;
  @override
  final NotificationType type;
  @override
  final String title;
  @override
  final String body;
  @override
  final String? actionUrl;
  @override
  final String? actionText;
  final Map<String, dynamic>? _actionData;
  @override
  Map<String, dynamic>? get actionData {
    final value = _actionData;
    if (value == null) return null;
    if (_actionData is EqualUnmodifiableMapView) return _actionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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
  final NotificationActor? actor;
  @override
  final NotificationTarget? target;
  @override
  @JsonKey()
  final NotificationPriority priority;

  @override
  String toString() {
    return 'CreateNotificationRequest(userId: $userId, type: $type, title: $title, body: $body, actionUrl: $actionUrl, actionText: $actionText, actionData: $actionData, metadata: $metadata, actor: $actor, target: $target, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNotificationRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            const DeepCollectionEquality().equals(
              other._actionData,
              _actionData,
            ) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.actor, actor) || other.actor == actor) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    type,
    title,
    body,
    actionUrl,
    actionText,
    const DeepCollectionEquality().hash(_actionData),
    const DeepCollectionEquality().hash(_metadata),
    actor,
    target,
    priority,
  );

  /// Create a copy of CreateNotificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNotificationRequestImplCopyWith<_$CreateNotificationRequestImpl>
  get copyWith =>
      __$$CreateNotificationRequestImplCopyWithImpl<
        _$CreateNotificationRequestImpl
      >(this, _$identity);
}

abstract class _CreateNotificationRequest extends CreateNotificationRequest {
  const factory _CreateNotificationRequest({
    required final String userId,
    required final NotificationType type,
    required final String title,
    required final String body,
    final String? actionUrl,
    final String? actionText,
    final Map<String, dynamic>? actionData,
    final Map<String, dynamic>? metadata,
    final NotificationActor? actor,
    final NotificationTarget? target,
    final NotificationPriority priority,
  }) = _$CreateNotificationRequestImpl;
  const _CreateNotificationRequest._() : super._();

  @override
  String get userId;
  @override
  NotificationType get type;
  @override
  String get title;
  @override
  String get body;
  @override
  String? get actionUrl;
  @override
  String? get actionText;
  @override
  Map<String, dynamic>? get actionData;
  @override
  Map<String, dynamic>? get metadata;
  @override
  NotificationActor? get actor;
  @override
  NotificationTarget? get target;
  @override
  NotificationPriority get priority;

  /// Create a copy of CreateNotificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateNotificationRequestImplCopyWith<_$CreateNotificationRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MarkNotificationsReadRequest {
  String get userId => throw _privateConstructorUsedError;
  String? get notificationId => throw _privateConstructorUsedError;

  /// Create a copy of MarkNotificationsReadRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarkNotificationsReadRequestCopyWith<MarkNotificationsReadRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkNotificationsReadRequestCopyWith<$Res> {
  factory $MarkNotificationsReadRequestCopyWith(
    MarkNotificationsReadRequest value,
    $Res Function(MarkNotificationsReadRequest) then,
  ) =
      _$MarkNotificationsReadRequestCopyWithImpl<
        $Res,
        MarkNotificationsReadRequest
      >;
  @useResult
  $Res call({String userId, String? notificationId});
}

/// @nodoc
class _$MarkNotificationsReadRequestCopyWithImpl<
  $Res,
  $Val extends MarkNotificationsReadRequest
>
    implements $MarkNotificationsReadRequestCopyWith<$Res> {
  _$MarkNotificationsReadRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarkNotificationsReadRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? notificationId = freezed}) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            notificationId: freezed == notificationId
                ? _value.notificationId
                : notificationId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MarkNotificationsReadRequestImplCopyWith<$Res>
    implements $MarkNotificationsReadRequestCopyWith<$Res> {
  factory _$$MarkNotificationsReadRequestImplCopyWith(
    _$MarkNotificationsReadRequestImpl value,
    $Res Function(_$MarkNotificationsReadRequestImpl) then,
  ) = __$$MarkNotificationsReadRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String? notificationId});
}

/// @nodoc
class __$$MarkNotificationsReadRequestImplCopyWithImpl<$Res>
    extends
        _$MarkNotificationsReadRequestCopyWithImpl<
          $Res,
          _$MarkNotificationsReadRequestImpl
        >
    implements _$$MarkNotificationsReadRequestImplCopyWith<$Res> {
  __$$MarkNotificationsReadRequestImplCopyWithImpl(
    _$MarkNotificationsReadRequestImpl _value,
    $Res Function(_$MarkNotificationsReadRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarkNotificationsReadRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? notificationId = freezed}) {
    return _then(
      _$MarkNotificationsReadRequestImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        notificationId: freezed == notificationId
            ? _value.notificationId
            : notificationId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$MarkNotificationsReadRequestImpl
    implements _MarkNotificationsReadRequest {
  const _$MarkNotificationsReadRequestImpl({
    required this.userId,
    this.notificationId,
  });

  @override
  final String userId;
  @override
  final String? notificationId;

  @override
  String toString() {
    return 'MarkNotificationsReadRequest(userId: $userId, notificationId: $notificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkNotificationsReadRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, notificationId);

  /// Create a copy of MarkNotificationsReadRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkNotificationsReadRequestImplCopyWith<
    _$MarkNotificationsReadRequestImpl
  >
  get copyWith =>
      __$$MarkNotificationsReadRequestImplCopyWithImpl<
        _$MarkNotificationsReadRequestImpl
      >(this, _$identity);
}

abstract class _MarkNotificationsReadRequest
    implements MarkNotificationsReadRequest {
  const factory _MarkNotificationsReadRequest({
    required final String userId,
    final String? notificationId,
  }) = _$MarkNotificationsReadRequestImpl;

  @override
  String get userId;
  @override
  String? get notificationId;

  /// Create a copy of MarkNotificationsReadRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkNotificationsReadRequestImplCopyWith<
    _$MarkNotificationsReadRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationQuery {
  String? get userId => throw _privateConstructorUsedError;
  NotificationType? get type => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  String? get orderBy => throw _privateConstructorUsedError;
  bool? get descending => throw _privateConstructorUsedError;

  /// Create a copy of NotificationQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationQueryCopyWith<NotificationQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationQueryCopyWith<$Res> {
  factory $NotificationQueryCopyWith(
    NotificationQuery value,
    $Res Function(NotificationQuery) then,
  ) = _$NotificationQueryCopyWithImpl<$Res, NotificationQuery>;
  @useResult
  $Res call({
    String? userId,
    NotificationType? type,
    bool? isRead,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    int? offset,
    String? orderBy,
    bool? descending,
  });
}

/// @nodoc
class _$NotificationQueryCopyWithImpl<$Res, $Val extends NotificationQuery>
    implements $NotificationQueryCopyWith<$Res> {
  _$NotificationQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? type = freezed,
    Object? isRead = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? orderBy = freezed,
    Object? descending = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as NotificationType?,
            isRead: freezed == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                      as bool?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            limit: freezed == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int?,
            offset: freezed == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as int?,
            orderBy: freezed == orderBy
                ? _value.orderBy
                : orderBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            descending: freezed == descending
                ? _value.descending
                : descending // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationQueryImplCopyWith<$Res>
    implements $NotificationQueryCopyWith<$Res> {
  factory _$$NotificationQueryImplCopyWith(
    _$NotificationQueryImpl value,
    $Res Function(_$NotificationQueryImpl) then,
  ) = __$$NotificationQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? userId,
    NotificationType? type,
    bool? isRead,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    int? offset,
    String? orderBy,
    bool? descending,
  });
}

/// @nodoc
class __$$NotificationQueryImplCopyWithImpl<$Res>
    extends _$NotificationQueryCopyWithImpl<$Res, _$NotificationQueryImpl>
    implements _$$NotificationQueryImplCopyWith<$Res> {
  __$$NotificationQueryImplCopyWithImpl(
    _$NotificationQueryImpl _value,
    $Res Function(_$NotificationQueryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? type = freezed,
    Object? isRead = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? orderBy = freezed,
    Object? descending = freezed,
  }) {
    return _then(
      _$NotificationQueryImpl(
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as NotificationType?,
        isRead: freezed == isRead
            ? _value.isRead
            : isRead // ignore: cast_nullable_to_non_nullable
                  as bool?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        limit: freezed == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int?,
        offset: freezed == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int?,
        orderBy: freezed == orderBy
            ? _value.orderBy
            : orderBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        descending: freezed == descending
            ? _value.descending
            : descending // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc

class _$NotificationQueryImpl extends _NotificationQuery {
  const _$NotificationQueryImpl({
    this.userId,
    this.type,
    this.isRead,
    this.startDate,
    this.endDate,
    this.limit,
    this.offset,
    this.orderBy,
    this.descending,
  }) : super._();

  @override
  final String? userId;
  @override
  final NotificationType? type;
  @override
  final bool? isRead;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final int? limit;
  @override
  final int? offset;
  @override
  final String? orderBy;
  @override
  final bool? descending;

  @override
  String toString() {
    return 'NotificationQuery(userId: $userId, type: $type, isRead: $isRead, startDate: $startDate, endDate: $endDate, limit: $limit, offset: $offset, orderBy: $orderBy, descending: $descending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationQueryImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.descending, descending) ||
                other.descending == descending));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    type,
    isRead,
    startDate,
    endDate,
    limit,
    offset,
    orderBy,
    descending,
  );

  /// Create a copy of NotificationQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationQueryImplCopyWith<_$NotificationQueryImpl> get copyWith =>
      __$$NotificationQueryImplCopyWithImpl<_$NotificationQueryImpl>(
        this,
        _$identity,
      );
}

abstract class _NotificationQuery extends NotificationQuery {
  const factory _NotificationQuery({
    final String? userId,
    final NotificationType? type,
    final bool? isRead,
    final DateTime? startDate,
    final DateTime? endDate,
    final int? limit,
    final int? offset,
    final String? orderBy,
    final bool? descending,
  }) = _$NotificationQueryImpl;
  const _NotificationQuery._() : super._();

  @override
  String? get userId;
  @override
  NotificationType? get type;
  @override
  bool? get isRead;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  int? get limit;
  @override
  int? get offset;
  @override
  String? get orderBy;
  @override
  bool? get descending;

  /// Create a copy of NotificationQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationQueryImplCopyWith<_$NotificationQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
