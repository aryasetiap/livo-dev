// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Follow _$FollowFromJson(Map<String, dynamic> json) {
  return _Follow.fromJson(json);
}

/// @nodoc
mixin _$Follow {
  String get id => throw _privateConstructorUsedError;
  String get followerId => throw _privateConstructorUsedError;
  String get followingId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  User? get follower => throw _privateConstructorUsedError;
  User? get following => throw _privateConstructorUsedError;

  /// Serializes this Follow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Follow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowCopyWith<Follow> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowCopyWith<$Res> {
  factory $FollowCopyWith(Follow value, $Res Function(Follow) then) =
      _$FollowCopyWithImpl<$Res, Follow>;
  @useResult
  $Res call({
    String id,
    String followerId,
    String followingId,
    DateTime createdAt,
    User? follower,
    User? following,
  });

  $UserCopyWith<$Res>? get follower;
  $UserCopyWith<$Res>? get following;
}

/// @nodoc
class _$FollowCopyWithImpl<$Res, $Val extends Follow>
    implements $FollowCopyWith<$Res> {
  _$FollowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Follow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? followerId = null,
    Object? followingId = null,
    Object? createdAt = null,
    Object? follower = freezed,
    Object? following = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            followerId: null == followerId
                ? _value.followerId
                : followerId // ignore: cast_nullable_to_non_nullable
                      as String,
            followingId: null == followingId
                ? _value.followingId
                : followingId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            follower: freezed == follower
                ? _value.follower
                : follower // ignore: cast_nullable_to_non_nullable
                      as User?,
            following: freezed == following
                ? _value.following
                : following // ignore: cast_nullable_to_non_nullable
                      as User?,
          )
          as $Val,
    );
  }

  /// Create a copy of Follow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get follower {
    if (_value.follower == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.follower!, (value) {
      return _then(_value.copyWith(follower: value) as $Val);
    });
  }

  /// Create a copy of Follow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get following {
    if (_value.following == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.following!, (value) {
      return _then(_value.copyWith(following: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowImplCopyWith<$Res> implements $FollowCopyWith<$Res> {
  factory _$$FollowImplCopyWith(
    _$FollowImpl value,
    $Res Function(_$FollowImpl) then,
  ) = __$$FollowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String followerId,
    String followingId,
    DateTime createdAt,
    User? follower,
    User? following,
  });

  @override
  $UserCopyWith<$Res>? get follower;
  @override
  $UserCopyWith<$Res>? get following;
}

/// @nodoc
class __$$FollowImplCopyWithImpl<$Res>
    extends _$FollowCopyWithImpl<$Res, _$FollowImpl>
    implements _$$FollowImplCopyWith<$Res> {
  __$$FollowImplCopyWithImpl(
    _$FollowImpl _value,
    $Res Function(_$FollowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Follow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? followerId = null,
    Object? followingId = null,
    Object? createdAt = null,
    Object? follower = freezed,
    Object? following = freezed,
  }) {
    return _then(
      _$FollowImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        followerId: null == followerId
            ? _value.followerId
            : followerId // ignore: cast_nullable_to_non_nullable
                  as String,
        followingId: null == followingId
            ? _value.followingId
            : followingId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        follower: freezed == follower
            ? _value.follower
            : follower // ignore: cast_nullable_to_non_nullable
                  as User?,
        following: freezed == following
            ? _value.following
            : following // ignore: cast_nullable_to_non_nullable
                  as User?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowImpl extends _Follow {
  const _$FollowImpl({
    required this.id,
    required this.followerId,
    required this.followingId,
    required this.createdAt,
    this.follower,
    this.following,
  }) : super._();

  factory _$FollowImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowImplFromJson(json);

  @override
  final String id;
  @override
  final String followerId;
  @override
  final String followingId;
  @override
  final DateTime createdAt;
  @override
  final User? follower;
  @override
  final User? following;

  @override
  String toString() {
    return 'Follow(id: $id, followerId: $followerId, followingId: $followingId, createdAt: $createdAt, follower: $follower, following: $following)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.followerId, followerId) ||
                other.followerId == followerId) &&
            (identical(other.followingId, followingId) ||
                other.followingId == followingId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.follower, follower) ||
                other.follower == follower) &&
            (identical(other.following, following) ||
                other.following == following));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    followerId,
    followingId,
    createdAt,
    follower,
    following,
  );

  /// Create a copy of Follow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowImplCopyWith<_$FollowImpl> get copyWith =>
      __$$FollowImplCopyWithImpl<_$FollowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowImplToJson(this);
  }
}

abstract class _Follow extends Follow {
  const factory _Follow({
    required final String id,
    required final String followerId,
    required final String followingId,
    required final DateTime createdAt,
    final User? follower,
    final User? following,
  }) = _$FollowImpl;
  const _Follow._() : super._();

  factory _Follow.fromJson(Map<String, dynamic> json) = _$FollowImpl.fromJson;

  @override
  String get id;
  @override
  String get followerId;
  @override
  String get followingId;
  @override
  DateTime get createdAt;
  @override
  User? get follower;
  @override
  User? get following;

  /// Create a copy of Follow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowImplCopyWith<_$FollowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowRequest _$FollowRequestFromJson(Map<String, dynamic> json) {
  return _FollowRequest.fromJson(json);
}

/// @nodoc
mixin _$FollowRequest {
  String get id => throw _privateConstructorUsedError;
  String get requesterId => throw _privateConstructorUsedError;
  String get targetUserId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(
    defaultValue: 'pending',
    fromJson: _followRequestStatusFromJson,
    toJson: _followRequestStatusToJson,
  )
  FollowRequestStatus get status => throw _privateConstructorUsedError;
  DateTime? get respondedAt => throw _privateConstructorUsedError;
  User? get requester => throw _privateConstructorUsedError;
  User? get targetUser => throw _privateConstructorUsedError;

  /// Serializes this FollowRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowRequestCopyWith<FollowRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowRequestCopyWith<$Res> {
  factory $FollowRequestCopyWith(
    FollowRequest value,
    $Res Function(FollowRequest) then,
  ) = _$FollowRequestCopyWithImpl<$Res, FollowRequest>;
  @useResult
  $Res call({
    String id,
    String requesterId,
    String targetUserId,
    DateTime createdAt,
    String? message,
    @JsonKey(
      defaultValue: 'pending',
      fromJson: _followRequestStatusFromJson,
      toJson: _followRequestStatusToJson,
    )
    FollowRequestStatus status,
    DateTime? respondedAt,
    User? requester,
    User? targetUser,
  });

  $UserCopyWith<$Res>? get requester;
  $UserCopyWith<$Res>? get targetUser;
}

/// @nodoc
class _$FollowRequestCopyWithImpl<$Res, $Val extends FollowRequest>
    implements $FollowRequestCopyWith<$Res> {
  _$FollowRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requesterId = null,
    Object? targetUserId = null,
    Object? createdAt = null,
    Object? message = freezed,
    Object? status = null,
    Object? respondedAt = freezed,
    Object? requester = freezed,
    Object? targetUser = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            requesterId: null == requesterId
                ? _value.requesterId
                : requesterId // ignore: cast_nullable_to_non_nullable
                      as String,
            targetUserId: null == targetUserId
                ? _value.targetUserId
                : targetUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as FollowRequestStatus,
            respondedAt: freezed == respondedAt
                ? _value.respondedAt
                : respondedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            requester: freezed == requester
                ? _value.requester
                : requester // ignore: cast_nullable_to_non_nullable
                      as User?,
            targetUser: freezed == targetUser
                ? _value.targetUser
                : targetUser // ignore: cast_nullable_to_non_nullable
                      as User?,
          )
          as $Val,
    );
  }

  /// Create a copy of FollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get requester {
    if (_value.requester == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.requester!, (value) {
      return _then(_value.copyWith(requester: value) as $Val);
    });
  }

  /// Create a copy of FollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get targetUser {
    if (_value.targetUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.targetUser!, (value) {
      return _then(_value.copyWith(targetUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowRequestImplCopyWith<$Res>
    implements $FollowRequestCopyWith<$Res> {
  factory _$$FollowRequestImplCopyWith(
    _$FollowRequestImpl value,
    $Res Function(_$FollowRequestImpl) then,
  ) = __$$FollowRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String requesterId,
    String targetUserId,
    DateTime createdAt,
    String? message,
    @JsonKey(
      defaultValue: 'pending',
      fromJson: _followRequestStatusFromJson,
      toJson: _followRequestStatusToJson,
    )
    FollowRequestStatus status,
    DateTime? respondedAt,
    User? requester,
    User? targetUser,
  });

  @override
  $UserCopyWith<$Res>? get requester;
  @override
  $UserCopyWith<$Res>? get targetUser;
}

/// @nodoc
class __$$FollowRequestImplCopyWithImpl<$Res>
    extends _$FollowRequestCopyWithImpl<$Res, _$FollowRequestImpl>
    implements _$$FollowRequestImplCopyWith<$Res> {
  __$$FollowRequestImplCopyWithImpl(
    _$FollowRequestImpl _value,
    $Res Function(_$FollowRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requesterId = null,
    Object? targetUserId = null,
    Object? createdAt = null,
    Object? message = freezed,
    Object? status = null,
    Object? respondedAt = freezed,
    Object? requester = freezed,
    Object? targetUser = freezed,
  }) {
    return _then(
      _$FollowRequestImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        requesterId: null == requesterId
            ? _value.requesterId
            : requesterId // ignore: cast_nullable_to_non_nullable
                  as String,
        targetUserId: null == targetUserId
            ? _value.targetUserId
            : targetUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FollowRequestStatus,
        respondedAt: freezed == respondedAt
            ? _value.respondedAt
            : respondedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        requester: freezed == requester
            ? _value.requester
            : requester // ignore: cast_nullable_to_non_nullable
                  as User?,
        targetUser: freezed == targetUser
            ? _value.targetUser
            : targetUser // ignore: cast_nullable_to_non_nullable
                  as User?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowRequestImpl extends _FollowRequest {
  const _$FollowRequestImpl({
    required this.id,
    required this.requesterId,
    required this.targetUserId,
    required this.createdAt,
    this.message,
    @JsonKey(
      defaultValue: 'pending',
      fromJson: _followRequestStatusFromJson,
      toJson: _followRequestStatusToJson,
    )
    this.status = FollowRequestStatus.pending,
    this.respondedAt,
    this.requester,
    this.targetUser,
  }) : super._();

  factory _$FollowRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String requesterId;
  @override
  final String targetUserId;
  @override
  final DateTime createdAt;
  @override
  final String? message;
  @override
  @JsonKey(
    defaultValue: 'pending',
    fromJson: _followRequestStatusFromJson,
    toJson: _followRequestStatusToJson,
  )
  final FollowRequestStatus status;
  @override
  final DateTime? respondedAt;
  @override
  final User? requester;
  @override
  final User? targetUser;

  @override
  String toString() {
    return 'FollowRequest(id: $id, requesterId: $requesterId, targetUserId: $targetUserId, createdAt: $createdAt, message: $message, status: $status, respondedAt: $respondedAt, requester: $requester, targetUser: $targetUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requesterId, requesterId) ||
                other.requesterId == requesterId) &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt) &&
            (identical(other.requester, requester) ||
                other.requester == requester) &&
            (identical(other.targetUser, targetUser) ||
                other.targetUser == targetUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    requesterId,
    targetUserId,
    createdAt,
    message,
    status,
    respondedAt,
    requester,
    targetUser,
  );

  /// Create a copy of FollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowRequestImplCopyWith<_$FollowRequestImpl> get copyWith =>
      __$$FollowRequestImplCopyWithImpl<_$FollowRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowRequestImplToJson(this);
  }
}

abstract class _FollowRequest extends FollowRequest {
  const factory _FollowRequest({
    required final String id,
    required final String requesterId,
    required final String targetUserId,
    required final DateTime createdAt,
    final String? message,
    @JsonKey(
      defaultValue: 'pending',
      fromJson: _followRequestStatusFromJson,
      toJson: _followRequestStatusToJson,
    )
    final FollowRequestStatus status,
    final DateTime? respondedAt,
    final User? requester,
    final User? targetUser,
  }) = _$FollowRequestImpl;
  const _FollowRequest._() : super._();

  factory _FollowRequest.fromJson(Map<String, dynamic> json) =
      _$FollowRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get requesterId;
  @override
  String get targetUserId;
  @override
  DateTime get createdAt;
  @override
  String? get message;
  @override
  @JsonKey(
    defaultValue: 'pending',
    fromJson: _followRequestStatusFromJson,
    toJson: _followRequestStatusToJson,
  )
  FollowRequestStatus get status;
  @override
  DateTime? get respondedAt;
  @override
  User? get requester;
  @override
  User? get targetUser;

  /// Create a copy of FollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowRequestImplCopyWith<_$FollowRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowStats _$FollowStatsFromJson(Map<String, dynamic> json) {
  return _FollowStats.fromJson(json);
}

/// @nodoc
mixin _$FollowStats {
  int get followersCount => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  int get pendingRequestsCount => throw _privateConstructorUsedError;
  List<Follow> get recentFollowers => throw _privateConstructorUsedError;
  List<Follow> get recentFollowing => throw _privateConstructorUsedError;

  /// Serializes this FollowStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowStatsCopyWith<FollowStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStatsCopyWith<$Res> {
  factory $FollowStatsCopyWith(
    FollowStats value,
    $Res Function(FollowStats) then,
  ) = _$FollowStatsCopyWithImpl<$Res, FollowStats>;
  @useResult
  $Res call({
    int followersCount,
    int followingCount,
    int pendingRequestsCount,
    List<Follow> recentFollowers,
    List<Follow> recentFollowing,
  });
}

/// @nodoc
class _$FollowStatsCopyWithImpl<$Res, $Val extends FollowStats>
    implements $FollowStatsCopyWith<$Res> {
  _$FollowStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followersCount = null,
    Object? followingCount = null,
    Object? pendingRequestsCount = null,
    Object? recentFollowers = null,
    Object? recentFollowing = null,
  }) {
    return _then(
      _value.copyWith(
            followersCount: null == followersCount
                ? _value.followersCount
                : followersCount // ignore: cast_nullable_to_non_nullable
                      as int,
            followingCount: null == followingCount
                ? _value.followingCount
                : followingCount // ignore: cast_nullable_to_non_nullable
                      as int,
            pendingRequestsCount: null == pendingRequestsCount
                ? _value.pendingRequestsCount
                : pendingRequestsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            recentFollowers: null == recentFollowers
                ? _value.recentFollowers
                : recentFollowers // ignore: cast_nullable_to_non_nullable
                      as List<Follow>,
            recentFollowing: null == recentFollowing
                ? _value.recentFollowing
                : recentFollowing // ignore: cast_nullable_to_non_nullable
                      as List<Follow>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FollowStatsImplCopyWith<$Res>
    implements $FollowStatsCopyWith<$Res> {
  factory _$$FollowStatsImplCopyWith(
    _$FollowStatsImpl value,
    $Res Function(_$FollowStatsImpl) then,
  ) = __$$FollowStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int followersCount,
    int followingCount,
    int pendingRequestsCount,
    List<Follow> recentFollowers,
    List<Follow> recentFollowing,
  });
}

/// @nodoc
class __$$FollowStatsImplCopyWithImpl<$Res>
    extends _$FollowStatsCopyWithImpl<$Res, _$FollowStatsImpl>
    implements _$$FollowStatsImplCopyWith<$Res> {
  __$$FollowStatsImplCopyWithImpl(
    _$FollowStatsImpl _value,
    $Res Function(_$FollowStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followersCount = null,
    Object? followingCount = null,
    Object? pendingRequestsCount = null,
    Object? recentFollowers = null,
    Object? recentFollowing = null,
  }) {
    return _then(
      _$FollowStatsImpl(
        followersCount: null == followersCount
            ? _value.followersCount
            : followersCount // ignore: cast_nullable_to_non_nullable
                  as int,
        followingCount: null == followingCount
            ? _value.followingCount
            : followingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        pendingRequestsCount: null == pendingRequestsCount
            ? _value.pendingRequestsCount
            : pendingRequestsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        recentFollowers: null == recentFollowers
            ? _value._recentFollowers
            : recentFollowers // ignore: cast_nullable_to_non_nullable
                  as List<Follow>,
        recentFollowing: null == recentFollowing
            ? _value._recentFollowing
            : recentFollowing // ignore: cast_nullable_to_non_nullable
                  as List<Follow>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowStatsImpl extends _FollowStats {
  const _$FollowStatsImpl({
    this.followersCount = 0,
    this.followingCount = 0,
    this.pendingRequestsCount = 0,
    final List<Follow> recentFollowers = const [],
    final List<Follow> recentFollowing = const [],
  }) : _recentFollowers = recentFollowers,
       _recentFollowing = recentFollowing,
       super._();

  factory _$FollowStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowStatsImplFromJson(json);

  @override
  @JsonKey()
  final int followersCount;
  @override
  @JsonKey()
  final int followingCount;
  @override
  @JsonKey()
  final int pendingRequestsCount;
  final List<Follow> _recentFollowers;
  @override
  @JsonKey()
  List<Follow> get recentFollowers {
    if (_recentFollowers is EqualUnmodifiableListView) return _recentFollowers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentFollowers);
  }

  final List<Follow> _recentFollowing;
  @override
  @JsonKey()
  List<Follow> get recentFollowing {
    if (_recentFollowing is EqualUnmodifiableListView) return _recentFollowing;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentFollowing);
  }

  @override
  String toString() {
    return 'FollowStats(followersCount: $followersCount, followingCount: $followingCount, pendingRequestsCount: $pendingRequestsCount, recentFollowers: $recentFollowers, recentFollowing: $recentFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowStatsImpl &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.pendingRequestsCount, pendingRequestsCount) ||
                other.pendingRequestsCount == pendingRequestsCount) &&
            const DeepCollectionEquality().equals(
              other._recentFollowers,
              _recentFollowers,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentFollowing,
              _recentFollowing,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    followersCount,
    followingCount,
    pendingRequestsCount,
    const DeepCollectionEquality().hash(_recentFollowers),
    const DeepCollectionEquality().hash(_recentFollowing),
  );

  /// Create a copy of FollowStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowStatsImplCopyWith<_$FollowStatsImpl> get copyWith =>
      __$$FollowStatsImplCopyWithImpl<_$FollowStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowStatsImplToJson(this);
  }
}

abstract class _FollowStats extends FollowStats {
  const factory _FollowStats({
    final int followersCount,
    final int followingCount,
    final int pendingRequestsCount,
    final List<Follow> recentFollowers,
    final List<Follow> recentFollowing,
  }) = _$FollowStatsImpl;
  const _FollowStats._() : super._();

  factory _FollowStats.fromJson(Map<String, dynamic> json) =
      _$FollowStatsImpl.fromJson;

  @override
  int get followersCount;
  @override
  int get followingCount;
  @override
  int get pendingRequestsCount;
  @override
  List<Follow> get recentFollowers;
  @override
  List<Follow> get recentFollowing;

  /// Create a copy of FollowStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowStatsImplCopyWith<_$FollowStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
