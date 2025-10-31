// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
mixin _$Story {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  StoryMedia get media => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  int get viewsCount => throw _privateConstructorUsedError;
  int get repliesCount => throw _privateConstructorUsedError;
  int get reactionsCount => throw _privateConstructorUsedError;
  List<StoryReaction> get reactions => throw _privateConstructorUsedError;
  List<StoryReply> get replies => throw _privateConstructorUsedError;
  StoryType get type => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  List<String> get mentions => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;
  bool get isViewed => throw _privateConstructorUsedError;
  DateTime? get viewedAt => throw _privateConstructorUsedError;
  StoryStatus get status => throw _privateConstructorUsedError;
  UserStoryInfo? get user => throw _privateConstructorUsedError;

  /// Serializes this Story to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res, Story>;
  @useResult
  $Res call({
    String id,
    String userId,
    StoryMedia media,
    DateTime createdAt,
    DateTime expiresAt,
    int viewsCount,
    int repliesCount,
    int reactionsCount,
    List<StoryReaction> reactions,
    List<StoryReply> replies,
    StoryType type,
    String? caption,
    String? location,
    List<String> mentions,
    List<String> hashtags,
    bool isViewed,
    DateTime? viewedAt,
    StoryStatus status,
    UserStoryInfo? user,
  });

  $StoryMediaCopyWith<$Res> get media;
  $UserStoryInfoCopyWith<$Res>? get user;
}

/// @nodoc
class _$StoryCopyWithImpl<$Res, $Val extends Story>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? media = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? viewsCount = null,
    Object? repliesCount = null,
    Object? reactionsCount = null,
    Object? reactions = null,
    Object? replies = null,
    Object? type = null,
    Object? caption = freezed,
    Object? location = freezed,
    Object? mentions = null,
    Object? hashtags = null,
    Object? isViewed = null,
    Object? viewedAt = freezed,
    Object? status = null,
    Object? user = freezed,
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
            media: null == media
                ? _value.media
                : media // ignore: cast_nullable_to_non_nullable
                      as StoryMedia,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            viewsCount: null == viewsCount
                ? _value.viewsCount
                : viewsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            repliesCount: null == repliesCount
                ? _value.repliesCount
                : repliesCount // ignore: cast_nullable_to_non_nullable
                      as int,
            reactionsCount: null == reactionsCount
                ? _value.reactionsCount
                : reactionsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            reactions: null == reactions
                ? _value.reactions
                : reactions // ignore: cast_nullable_to_non_nullable
                      as List<StoryReaction>,
            replies: null == replies
                ? _value.replies
                : replies // ignore: cast_nullable_to_non_nullable
                      as List<StoryReply>,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as StoryType,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            mentions: null == mentions
                ? _value.mentions
                : mentions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            hashtags: null == hashtags
                ? _value.hashtags
                : hashtags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isViewed: null == isViewed
                ? _value.isViewed
                : isViewed // ignore: cast_nullable_to_non_nullable
                      as bool,
            viewedAt: freezed == viewedAt
                ? _value.viewedAt
                : viewedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as StoryStatus,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserStoryInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoryMediaCopyWith<$Res> get media {
    return $StoryMediaCopyWith<$Res>(_value.media, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStoryInfoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserStoryInfoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryImplCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$$StoryImplCopyWith(
    _$StoryImpl value,
    $Res Function(_$StoryImpl) then,
  ) = __$$StoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    StoryMedia media,
    DateTime createdAt,
    DateTime expiresAt,
    int viewsCount,
    int repliesCount,
    int reactionsCount,
    List<StoryReaction> reactions,
    List<StoryReply> replies,
    StoryType type,
    String? caption,
    String? location,
    List<String> mentions,
    List<String> hashtags,
    bool isViewed,
    DateTime? viewedAt,
    StoryStatus status,
    UserStoryInfo? user,
  });

  @override
  $StoryMediaCopyWith<$Res> get media;
  @override
  $UserStoryInfoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$StoryImplCopyWithImpl<$Res>
    extends _$StoryCopyWithImpl<$Res, _$StoryImpl>
    implements _$$StoryImplCopyWith<$Res> {
  __$$StoryImplCopyWithImpl(
    _$StoryImpl _value,
    $Res Function(_$StoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? media = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? viewsCount = null,
    Object? repliesCount = null,
    Object? reactionsCount = null,
    Object? reactions = null,
    Object? replies = null,
    Object? type = null,
    Object? caption = freezed,
    Object? location = freezed,
    Object? mentions = null,
    Object? hashtags = null,
    Object? isViewed = null,
    Object? viewedAt = freezed,
    Object? status = null,
    Object? user = freezed,
  }) {
    return _then(
      _$StoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        media: null == media
            ? _value.media
            : media // ignore: cast_nullable_to_non_nullable
                  as StoryMedia,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        viewsCount: null == viewsCount
            ? _value.viewsCount
            : viewsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        repliesCount: null == repliesCount
            ? _value.repliesCount
            : repliesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        reactionsCount: null == reactionsCount
            ? _value.reactionsCount
            : reactionsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        reactions: null == reactions
            ? _value._reactions
            : reactions // ignore: cast_nullable_to_non_nullable
                  as List<StoryReaction>,
        replies: null == replies
            ? _value._replies
            : replies // ignore: cast_nullable_to_non_nullable
                  as List<StoryReply>,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as StoryType,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        mentions: null == mentions
            ? _value._mentions
            : mentions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hashtags: null == hashtags
            ? _value._hashtags
            : hashtags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isViewed: null == isViewed
            ? _value.isViewed
            : isViewed // ignore: cast_nullable_to_non_nullable
                  as bool,
        viewedAt: freezed == viewedAt
            ? _value.viewedAt
            : viewedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as StoryStatus,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserStoryInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryImpl extends _Story {
  const _$StoryImpl({
    required this.id,
    required this.userId,
    required this.media,
    required this.createdAt,
    required this.expiresAt,
    this.viewsCount = 0,
    this.repliesCount = 0,
    this.reactionsCount = 0,
    final List<StoryReaction> reactions = const [],
    final List<StoryReply> replies = const [],
    this.type = StoryType.photo,
    this.caption,
    this.location,
    final List<String> mentions = const [],
    final List<String> hashtags = const [],
    this.isViewed = false,
    this.viewedAt,
    this.status = StoryStatus.active,
    this.user,
  }) : _reactions = reactions,
       _replies = replies,
       _mentions = mentions,
       _hashtags = hashtags,
       super._();

  factory _$StoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final StoryMedia media;
  @override
  final DateTime createdAt;
  @override
  final DateTime expiresAt;
  @override
  @JsonKey()
  final int viewsCount;
  @override
  @JsonKey()
  final int repliesCount;
  @override
  @JsonKey()
  final int reactionsCount;
  final List<StoryReaction> _reactions;
  @override
  @JsonKey()
  List<StoryReaction> get reactions {
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reactions);
  }

  final List<StoryReply> _replies;
  @override
  @JsonKey()
  List<StoryReply> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  @JsonKey()
  final StoryType type;
  @override
  final String? caption;
  @override
  final String? location;
  final List<String> _mentions;
  @override
  @JsonKey()
  List<String> get mentions {
    if (_mentions is EqualUnmodifiableListView) return _mentions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentions);
  }

  final List<String> _hashtags;
  @override
  @JsonKey()
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  @override
  @JsonKey()
  final bool isViewed;
  @override
  final DateTime? viewedAt;
  @override
  @JsonKey()
  final StoryStatus status;
  @override
  final UserStoryInfo? user;

  @override
  String toString() {
    return 'Story(id: $id, userId: $userId, media: $media, createdAt: $createdAt, expiresAt: $expiresAt, viewsCount: $viewsCount, repliesCount: $repliesCount, reactionsCount: $reactionsCount, reactions: $reactions, replies: $replies, type: $type, caption: $caption, location: $location, mentions: $mentions, hashtags: $hashtags, isViewed: $isViewed, viewedAt: $viewedAt, status: $status, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.viewsCount, viewsCount) ||
                other.viewsCount == viewsCount) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount) &&
            (identical(other.reactionsCount, reactionsCount) ||
                other.reactionsCount == reactionsCount) &&
            const DeepCollectionEquality().equals(
              other._reactions,
              _reactions,
            ) &&
            const DeepCollectionEquality().equals(other._replies, _replies) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._mentions, _mentions) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags) &&
            (identical(other.isViewed, isViewed) ||
                other.isViewed == isViewed) &&
            (identical(other.viewedAt, viewedAt) ||
                other.viewedAt == viewedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    userId,
    media,
    createdAt,
    expiresAt,
    viewsCount,
    repliesCount,
    reactionsCount,
    const DeepCollectionEquality().hash(_reactions),
    const DeepCollectionEquality().hash(_replies),
    type,
    caption,
    location,
    const DeepCollectionEquality().hash(_mentions),
    const DeepCollectionEquality().hash(_hashtags),
    isViewed,
    viewedAt,
    status,
    user,
  ]);

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      __$$StoryImplCopyWithImpl<_$StoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryImplToJson(this);
  }
}

abstract class _Story extends Story {
  const factory _Story({
    required final String id,
    required final String userId,
    required final StoryMedia media,
    required final DateTime createdAt,
    required final DateTime expiresAt,
    final int viewsCount,
    final int repliesCount,
    final int reactionsCount,
    final List<StoryReaction> reactions,
    final List<StoryReply> replies,
    final StoryType type,
    final String? caption,
    final String? location,
    final List<String> mentions,
    final List<String> hashtags,
    final bool isViewed,
    final DateTime? viewedAt,
    final StoryStatus status,
    final UserStoryInfo? user,
  }) = _$StoryImpl;
  const _Story._() : super._();

  factory _Story.fromJson(Map<String, dynamic> json) = _$StoryImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  StoryMedia get media;
  @override
  DateTime get createdAt;
  @override
  DateTime get expiresAt;
  @override
  int get viewsCount;
  @override
  int get repliesCount;
  @override
  int get reactionsCount;
  @override
  List<StoryReaction> get reactions;
  @override
  List<StoryReply> get replies;
  @override
  StoryType get type;
  @override
  String? get caption;
  @override
  String? get location;
  @override
  List<String> get mentions;
  @override
  List<String> get hashtags;
  @override
  bool get isViewed;
  @override
  DateTime? get viewedAt;
  @override
  StoryStatus get status;
  @override
  UserStoryInfo? get user;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryMedia _$StoryMediaFromJson(Map<String, dynamic> json) {
  return _StoryMedia.fromJson(json);
}

/// @nodoc
mixin _$StoryMedia {
  String get url => throw _privateConstructorUsedError;
  MediaType get type => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get sizeBytes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this StoryMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryMediaCopyWith<StoryMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryMediaCopyWith<$Res> {
  factory $StoryMediaCopyWith(
    StoryMedia value,
    $Res Function(StoryMedia) then,
  ) = _$StoryMediaCopyWithImpl<$Res, StoryMedia>;
  @useResult
  $Res call({
    String url,
    MediaType type,
    int duration,
    String thumbnailUrl,
    int width,
    int height,
    int sizeBytes,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$StoryMediaCopyWithImpl<$Res, $Val extends StoryMedia>
    implements $StoryMediaCopyWith<$Res> {
  _$StoryMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? type = freezed,
    Object? duration = null,
    Object? thumbnailUrl = null,
    Object? width = null,
    Object? height = null,
    Object? sizeBytes = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as MediaType,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            thumbnailUrl: null == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            width: null == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as int,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int,
            sizeBytes: null == sizeBytes
                ? _value.sizeBytes
                : sizeBytes // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$StoryMediaImplCopyWith<$Res>
    implements $StoryMediaCopyWith<$Res> {
  factory _$$StoryMediaImplCopyWith(
    _$StoryMediaImpl value,
    $Res Function(_$StoryMediaImpl) then,
  ) = __$$StoryMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String url,
    MediaType type,
    int duration,
    String thumbnailUrl,
    int width,
    int height,
    int sizeBytes,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$StoryMediaImplCopyWithImpl<$Res>
    extends _$StoryMediaCopyWithImpl<$Res, _$StoryMediaImpl>
    implements _$$StoryMediaImplCopyWith<$Res> {
  __$$StoryMediaImplCopyWithImpl(
    _$StoryMediaImpl _value,
    $Res Function(_$StoryMediaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? type = freezed,
    Object? duration = null,
    Object? thumbnailUrl = null,
    Object? width = null,
    Object? height = null,
    Object? sizeBytes = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _$StoryMediaImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MediaType,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailUrl: null == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        width: null == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as int,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int,
        sizeBytes: null == sizeBytes
            ? _value.sizeBytes
            : sizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$StoryMediaImpl extends _StoryMedia {
  const _$StoryMediaImpl({
    required this.url,
    this.type = MediaType.image,
    this.duration = 0,
    this.thumbnailUrl = '',
    this.width = 0,
    this.height = 0,
    this.sizeBytes = 0,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata,
       super._();

  factory _$StoryMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryMediaImplFromJson(json);

  @override
  final String url;
  @override
  @JsonKey()
  final MediaType type;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final String thumbnailUrl;
  @override
  @JsonKey()
  final int width;
  @override
  @JsonKey()
  final int height;
  @override
  @JsonKey()
  final int sizeBytes;
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
    return 'StoryMedia(url: $url, type: $type, duration: $duration, thumbnailUrl: $thumbnailUrl, width: $width, height: $height, sizeBytes: $sizeBytes, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryMediaImpl &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    url,
    const DeepCollectionEquality().hash(type),
    duration,
    thumbnailUrl,
    width,
    height,
    sizeBytes,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of StoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryMediaImplCopyWith<_$StoryMediaImpl> get copyWith =>
      __$$StoryMediaImplCopyWithImpl<_$StoryMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryMediaImplToJson(this);
  }
}

abstract class _StoryMedia extends StoryMedia {
  const factory _StoryMedia({
    required final String url,
    final MediaType type,
    final int duration,
    final String thumbnailUrl,
    final int width,
    final int height,
    final int sizeBytes,
    final Map<String, dynamic>? metadata,
  }) = _$StoryMediaImpl;
  const _StoryMedia._() : super._();

  factory _StoryMedia.fromJson(Map<String, dynamic> json) =
      _$StoryMediaImpl.fromJson;

  @override
  String get url;
  @override
  MediaType get type;
  @override
  int get duration;
  @override
  String get thumbnailUrl;
  @override
  int get width;
  @override
  int get height;
  @override
  int get sizeBytes;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of StoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryMediaImplCopyWith<_$StoryMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStoryInfo _$UserStoryInfoFromJson(Map<String, dynamic> json) {
  return _UserStoryInfo.fromJson(json);
}

/// @nodoc
mixin _$UserStoryInfo {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  DateTime? get lastStoryAt => throw _privateConstructorUsedError;
  int get storiesCount => throw _privateConstructorUsedError;

  /// Serializes this UserStoryInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStoryInfoCopyWith<UserStoryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStoryInfoCopyWith<$Res> {
  factory $UserStoryInfoCopyWith(
    UserStoryInfo value,
    $Res Function(UserStoryInfo) then,
  ) = _$UserStoryInfoCopyWithImpl<$Res, UserStoryInfo>;
  @useResult
  $Res call({
    String id,
    String username,
    String displayName,
    String? avatarUrl,
    bool isVerified,
    bool isFollowing,
    DateTime? lastStoryAt,
    int storiesCount,
  });
}

/// @nodoc
class _$UserStoryInfoCopyWithImpl<$Res, $Val extends UserStoryInfo>
    implements $UserStoryInfoCopyWith<$Res> {
  _$UserStoryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? isVerified = null,
    Object? isFollowing = null,
    Object? lastStoryAt = freezed,
    Object? storiesCount = null,
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
            isFollowing: null == isFollowing
                ? _value.isFollowing
                : isFollowing // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastStoryAt: freezed == lastStoryAt
                ? _value.lastStoryAt
                : lastStoryAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            storiesCount: null == storiesCount
                ? _value.storiesCount
                : storiesCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserStoryInfoImplCopyWith<$Res>
    implements $UserStoryInfoCopyWith<$Res> {
  factory _$$UserStoryInfoImplCopyWith(
    _$UserStoryInfoImpl value,
    $Res Function(_$UserStoryInfoImpl) then,
  ) = __$$UserStoryInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String username,
    String displayName,
    String? avatarUrl,
    bool isVerified,
    bool isFollowing,
    DateTime? lastStoryAt,
    int storiesCount,
  });
}

/// @nodoc
class __$$UserStoryInfoImplCopyWithImpl<$Res>
    extends _$UserStoryInfoCopyWithImpl<$Res, _$UserStoryInfoImpl>
    implements _$$UserStoryInfoImplCopyWith<$Res> {
  __$$UserStoryInfoImplCopyWithImpl(
    _$UserStoryInfoImpl _value,
    $Res Function(_$UserStoryInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserStoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? isVerified = null,
    Object? isFollowing = null,
    Object? lastStoryAt = freezed,
    Object? storiesCount = null,
  }) {
    return _then(
      _$UserStoryInfoImpl(
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
        isFollowing: null == isFollowing
            ? _value.isFollowing
            : isFollowing // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastStoryAt: freezed == lastStoryAt
            ? _value.lastStoryAt
            : lastStoryAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        storiesCount: null == storiesCount
            ? _value.storiesCount
            : storiesCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStoryInfoImpl extends _UserStoryInfo {
  const _$UserStoryInfoImpl({
    required this.id,
    required this.username,
    required this.displayName,
    this.avatarUrl,
    this.isVerified = false,
    this.isFollowing = false,
    this.lastStoryAt,
    this.storiesCount = 0,
  }) : super._();

  factory _$UserStoryInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStoryInfoImplFromJson(json);

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
  final bool isFollowing;
  @override
  final DateTime? lastStoryAt;
  @override
  @JsonKey()
  final int storiesCount;

  @override
  String toString() {
    return 'UserStoryInfo(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, isVerified: $isVerified, isFollowing: $isFollowing, lastStoryAt: $lastStoryAt, storiesCount: $storiesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStoryInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.lastStoryAt, lastStoryAt) ||
                other.lastStoryAt == lastStoryAt) &&
            (identical(other.storiesCount, storiesCount) ||
                other.storiesCount == storiesCount));
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
    isFollowing,
    lastStoryAt,
    storiesCount,
  );

  /// Create a copy of UserStoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStoryInfoImplCopyWith<_$UserStoryInfoImpl> get copyWith =>
      __$$UserStoryInfoImplCopyWithImpl<_$UserStoryInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStoryInfoImplToJson(this);
  }
}

abstract class _UserStoryInfo extends UserStoryInfo {
  const factory _UserStoryInfo({
    required final String id,
    required final String username,
    required final String displayName,
    final String? avatarUrl,
    final bool isVerified,
    final bool isFollowing,
    final DateTime? lastStoryAt,
    final int storiesCount,
  }) = _$UserStoryInfoImpl;
  const _UserStoryInfo._() : super._();

  factory _UserStoryInfo.fromJson(Map<String, dynamic> json) =
      _$UserStoryInfoImpl.fromJson;

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
  bool get isFollowing;
  @override
  DateTime? get lastStoryAt;
  @override
  int get storiesCount;

  /// Create a copy of UserStoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStoryInfoImplCopyWith<_$UserStoryInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryReaction _$StoryReactionFromJson(Map<String, dynamic> json) {
  return _StoryReaction.fromJson(json);
}

/// @nodoc
mixin _$StoryReaction {
  String get id => throw _privateConstructorUsedError;
  String get storyId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  StoryReactionType get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this StoryReaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryReaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryReactionCopyWith<StoryReaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryReactionCopyWith<$Res> {
  factory $StoryReactionCopyWith(
    StoryReaction value,
    $Res Function(StoryReaction) then,
  ) = _$StoryReactionCopyWithImpl<$Res, StoryReaction>;
  @useResult
  $Res call({
    String id,
    String storyId,
    String userId,
    StoryReactionType type,
    DateTime createdAt,
  });
}

/// @nodoc
class _$StoryReactionCopyWithImpl<$Res, $Val extends StoryReaction>
    implements $StoryReactionCopyWith<$Res> {
  _$StoryReactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryReaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storyId = null,
    Object? userId = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            storyId: null == storyId
                ? _value.storyId
                : storyId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as StoryReactionType,
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
abstract class _$$StoryReactionImplCopyWith<$Res>
    implements $StoryReactionCopyWith<$Res> {
  factory _$$StoryReactionImplCopyWith(
    _$StoryReactionImpl value,
    $Res Function(_$StoryReactionImpl) then,
  ) = __$$StoryReactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String storyId,
    String userId,
    StoryReactionType type,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$StoryReactionImplCopyWithImpl<$Res>
    extends _$StoryReactionCopyWithImpl<$Res, _$StoryReactionImpl>
    implements _$$StoryReactionImplCopyWith<$Res> {
  __$$StoryReactionImplCopyWithImpl(
    _$StoryReactionImpl _value,
    $Res Function(_$StoryReactionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoryReaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storyId = null,
    Object? userId = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$StoryReactionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        storyId: null == storyId
            ? _value.storyId
            : storyId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as StoryReactionType,
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
class _$StoryReactionImpl implements _StoryReaction {
  const _$StoryReactionImpl({
    required this.id,
    required this.storyId,
    required this.userId,
    required this.type,
    required this.createdAt,
  });

  factory _$StoryReactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryReactionImplFromJson(json);

  @override
  final String id;
  @override
  final String storyId;
  @override
  final String userId;
  @override
  final StoryReactionType type;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'StoryReaction(id: $id, storyId: $storyId, userId: $userId, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryReactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storyId, storyId) || other.storyId == storyId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, storyId, userId, type, createdAt);

  /// Create a copy of StoryReaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryReactionImplCopyWith<_$StoryReactionImpl> get copyWith =>
      __$$StoryReactionImplCopyWithImpl<_$StoryReactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryReactionImplToJson(this);
  }
}

abstract class _StoryReaction implements StoryReaction {
  const factory _StoryReaction({
    required final String id,
    required final String storyId,
    required final String userId,
    required final StoryReactionType type,
    required final DateTime createdAt,
  }) = _$StoryReactionImpl;

  factory _StoryReaction.fromJson(Map<String, dynamic> json) =
      _$StoryReactionImpl.fromJson;

  @override
  String get id;
  @override
  String get storyId;
  @override
  String get userId;
  @override
  StoryReactionType get type;
  @override
  DateTime get createdAt;

  /// Create a copy of StoryReaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryReactionImplCopyWith<_$StoryReactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryReply _$StoryReplyFromJson(Map<String, dynamic> json) {
  return _StoryReply.fromJson(json);
}

/// @nodoc
mixin _$StoryReply {
  String get id => throw _privateConstructorUsedError;
  String get storyId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  UserReplyInfo? get user => throw _privateConstructorUsedError;

  /// Serializes this StoryReply to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryReply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryReplyCopyWith<StoryReply> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryReplyCopyWith<$Res> {
  factory $StoryReplyCopyWith(
    StoryReply value,
    $Res Function(StoryReply) then,
  ) = _$StoryReplyCopyWithImpl<$Res, StoryReply>;
  @useResult
  $Res call({
    String id,
    String storyId,
    String userId,
    String content,
    DateTime createdAt,
    UserReplyInfo? user,
  });

  $UserReplyInfoCopyWith<$Res>? get user;
}

/// @nodoc
class _$StoryReplyCopyWithImpl<$Res, $Val extends StoryReply>
    implements $StoryReplyCopyWith<$Res> {
  _$StoryReplyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryReply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storyId = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? user = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            storyId: null == storyId
                ? _value.storyId
                : storyId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserReplyInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of StoryReply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserReplyInfoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserReplyInfoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryReplyImplCopyWith<$Res>
    implements $StoryReplyCopyWith<$Res> {
  factory _$$StoryReplyImplCopyWith(
    _$StoryReplyImpl value,
    $Res Function(_$StoryReplyImpl) then,
  ) = __$$StoryReplyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String storyId,
    String userId,
    String content,
    DateTime createdAt,
    UserReplyInfo? user,
  });

  @override
  $UserReplyInfoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$StoryReplyImplCopyWithImpl<$Res>
    extends _$StoryReplyCopyWithImpl<$Res, _$StoryReplyImpl>
    implements _$$StoryReplyImplCopyWith<$Res> {
  __$$StoryReplyImplCopyWithImpl(
    _$StoryReplyImpl _value,
    $Res Function(_$StoryReplyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoryReply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storyId = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? user = freezed,
  }) {
    return _then(
      _$StoryReplyImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        storyId: null == storyId
            ? _value.storyId
            : storyId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserReplyInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryReplyImpl extends _StoryReply {
  const _$StoryReplyImpl({
    required this.id,
    required this.storyId,
    required this.userId,
    required this.content,
    required this.createdAt,
    this.user,
  }) : super._();

  factory _$StoryReplyImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryReplyImplFromJson(json);

  @override
  final String id;
  @override
  final String storyId;
  @override
  final String userId;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final UserReplyInfo? user;

  @override
  String toString() {
    return 'StoryReply(id: $id, storyId: $storyId, userId: $userId, content: $content, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryReplyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storyId, storyId) || other.storyId == storyId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, storyId, userId, content, createdAt, user);

  /// Create a copy of StoryReply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryReplyImplCopyWith<_$StoryReplyImpl> get copyWith =>
      __$$StoryReplyImplCopyWithImpl<_$StoryReplyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryReplyImplToJson(this);
  }
}

abstract class _StoryReply extends StoryReply {
  const factory _StoryReply({
    required final String id,
    required final String storyId,
    required final String userId,
    required final String content,
    required final DateTime createdAt,
    final UserReplyInfo? user,
  }) = _$StoryReplyImpl;
  const _StoryReply._() : super._();

  factory _StoryReply.fromJson(Map<String, dynamic> json) =
      _$StoryReplyImpl.fromJson;

  @override
  String get id;
  @override
  String get storyId;
  @override
  String get userId;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  UserReplyInfo? get user;

  /// Create a copy of StoryReply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryReplyImplCopyWith<_$StoryReplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserReplyInfo _$UserReplyInfoFromJson(Map<String, dynamic> json) {
  return _UserReplyInfo.fromJson(json);
}

/// @nodoc
mixin _$UserReplyInfo {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Serializes this UserReplyInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserReplyInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserReplyInfoCopyWith<UserReplyInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReplyInfoCopyWith<$Res> {
  factory $UserReplyInfoCopyWith(
    UserReplyInfo value,
    $Res Function(UserReplyInfo) then,
  ) = _$UserReplyInfoCopyWithImpl<$Res, UserReplyInfo>;
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
class _$UserReplyInfoCopyWithImpl<$Res, $Val extends UserReplyInfo>
    implements $UserReplyInfoCopyWith<$Res> {
  _$UserReplyInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserReplyInfo
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
abstract class _$$UserReplyInfoImplCopyWith<$Res>
    implements $UserReplyInfoCopyWith<$Res> {
  factory _$$UserReplyInfoImplCopyWith(
    _$UserReplyInfoImpl value,
    $Res Function(_$UserReplyInfoImpl) then,
  ) = __$$UserReplyInfoImplCopyWithImpl<$Res>;
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
class __$$UserReplyInfoImplCopyWithImpl<$Res>
    extends _$UserReplyInfoCopyWithImpl<$Res, _$UserReplyInfoImpl>
    implements _$$UserReplyInfoImplCopyWith<$Res> {
  __$$UserReplyInfoImplCopyWithImpl(
    _$UserReplyInfoImpl _value,
    $Res Function(_$UserReplyInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserReplyInfo
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
      _$UserReplyInfoImpl(
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
class _$UserReplyInfoImpl extends _UserReplyInfo {
  const _$UserReplyInfoImpl({
    required this.id,
    required this.username,
    required this.displayName,
    this.avatarUrl,
    this.isVerified = false,
  }) : super._();

  factory _$UserReplyInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserReplyInfoImplFromJson(json);

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
    return 'UserReplyInfo(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserReplyInfoImpl &&
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

  /// Create a copy of UserReplyInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserReplyInfoImplCopyWith<_$UserReplyInfoImpl> get copyWith =>
      __$$UserReplyInfoImplCopyWithImpl<_$UserReplyInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserReplyInfoImplToJson(this);
  }
}

abstract class _UserReplyInfo extends UserReplyInfo {
  const factory _UserReplyInfo({
    required final String id,
    required final String username,
    required final String displayName,
    final String? avatarUrl,
    final bool isVerified,
  }) = _$UserReplyInfoImpl;
  const _UserReplyInfo._() : super._();

  factory _UserReplyInfo.fromJson(Map<String, dynamic> json) =
      _$UserReplyInfoImpl.fromJson;

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

  /// Create a copy of UserReplyInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserReplyInfoImplCopyWith<_$UserReplyInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryHighlight _$StoryHighlightFromJson(Map<String, dynamic> json) {
  return _StoryHighlight.fromJson(json);
}

/// @nodoc
mixin _$StoryHighlight {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get coverImageUrl => throw _privateConstructorUsedError;
  List<String> get storyIds => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get storiesCount => throw _privateConstructorUsedError;
  int get viewsCount => throw _privateConstructorUsedError;
  HighlightVisibility get visibility => throw _privateConstructorUsedError;
  List<String> get viewerIds => throw _privateConstructorUsedError;

  /// Serializes this StoryHighlight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryHighlight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryHighlightCopyWith<StoryHighlight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryHighlightCopyWith<$Res> {
  factory $StoryHighlightCopyWith(
    StoryHighlight value,
    $Res Function(StoryHighlight) then,
  ) = _$StoryHighlightCopyWithImpl<$Res, StoryHighlight>;
  @useResult
  $Res call({
    String id,
    String userId,
    String title,
    String coverImageUrl,
    List<String> storyIds,
    DateTime createdAt,
    int storiesCount,
    int viewsCount,
    HighlightVisibility visibility,
    List<String> viewerIds,
  });
}

/// @nodoc
class _$StoryHighlightCopyWithImpl<$Res, $Val extends StoryHighlight>
    implements $StoryHighlightCopyWith<$Res> {
  _$StoryHighlightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryHighlight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? coverImageUrl = null,
    Object? storyIds = null,
    Object? createdAt = null,
    Object? storiesCount = null,
    Object? viewsCount = null,
    Object? visibility = null,
    Object? viewerIds = null,
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
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            coverImageUrl: null == coverImageUrl
                ? _value.coverImageUrl
                : coverImageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            storyIds: null == storyIds
                ? _value.storyIds
                : storyIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            storiesCount: null == storiesCount
                ? _value.storiesCount
                : storiesCount // ignore: cast_nullable_to_non_nullable
                      as int,
            viewsCount: null == viewsCount
                ? _value.viewsCount
                : viewsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as HighlightVisibility,
            viewerIds: null == viewerIds
                ? _value.viewerIds
                : viewerIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoryHighlightImplCopyWith<$Res>
    implements $StoryHighlightCopyWith<$Res> {
  factory _$$StoryHighlightImplCopyWith(
    _$StoryHighlightImpl value,
    $Res Function(_$StoryHighlightImpl) then,
  ) = __$$StoryHighlightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String title,
    String coverImageUrl,
    List<String> storyIds,
    DateTime createdAt,
    int storiesCount,
    int viewsCount,
    HighlightVisibility visibility,
    List<String> viewerIds,
  });
}

/// @nodoc
class __$$StoryHighlightImplCopyWithImpl<$Res>
    extends _$StoryHighlightCopyWithImpl<$Res, _$StoryHighlightImpl>
    implements _$$StoryHighlightImplCopyWith<$Res> {
  __$$StoryHighlightImplCopyWithImpl(
    _$StoryHighlightImpl _value,
    $Res Function(_$StoryHighlightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoryHighlight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? coverImageUrl = null,
    Object? storyIds = null,
    Object? createdAt = null,
    Object? storiesCount = null,
    Object? viewsCount = null,
    Object? visibility = null,
    Object? viewerIds = null,
  }) {
    return _then(
      _$StoryHighlightImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        coverImageUrl: null == coverImageUrl
            ? _value.coverImageUrl
            : coverImageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        storyIds: null == storyIds
            ? _value._storyIds
            : storyIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        storiesCount: null == storiesCount
            ? _value.storiesCount
            : storiesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        viewsCount: null == viewsCount
            ? _value.viewsCount
            : viewsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as HighlightVisibility,
        viewerIds: null == viewerIds
            ? _value._viewerIds
            : viewerIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryHighlightImpl extends _StoryHighlight {
  const _$StoryHighlightImpl({
    required this.id,
    required this.userId,
    required this.title,
    required this.coverImageUrl,
    required final List<String> storyIds,
    required this.createdAt,
    this.storiesCount = 0,
    this.viewsCount = 0,
    this.visibility = HighlightVisibility.public,
    final List<String> viewerIds = const [],
  }) : _storyIds = storyIds,
       _viewerIds = viewerIds,
       super._();

  factory _$StoryHighlightImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryHighlightImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String coverImageUrl;
  final List<String> _storyIds;
  @override
  List<String> get storyIds {
    if (_storyIds is EqualUnmodifiableListView) return _storyIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storyIds);
  }

  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final int storiesCount;
  @override
  @JsonKey()
  final int viewsCount;
  @override
  @JsonKey()
  final HighlightVisibility visibility;
  final List<String> _viewerIds;
  @override
  @JsonKey()
  List<String> get viewerIds {
    if (_viewerIds is EqualUnmodifiableListView) return _viewerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewerIds);
  }

  @override
  String toString() {
    return 'StoryHighlight(id: $id, userId: $userId, title: $title, coverImageUrl: $coverImageUrl, storyIds: $storyIds, createdAt: $createdAt, storiesCount: $storiesCount, viewsCount: $viewsCount, visibility: $visibility, viewerIds: $viewerIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryHighlightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            const DeepCollectionEquality().equals(other._storyIds, _storyIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.storiesCount, storiesCount) ||
                other.storiesCount == storiesCount) &&
            (identical(other.viewsCount, viewsCount) ||
                other.viewsCount == viewsCount) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality().equals(
              other._viewerIds,
              _viewerIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    title,
    coverImageUrl,
    const DeepCollectionEquality().hash(_storyIds),
    createdAt,
    storiesCount,
    viewsCount,
    visibility,
    const DeepCollectionEquality().hash(_viewerIds),
  );

  /// Create a copy of StoryHighlight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryHighlightImplCopyWith<_$StoryHighlightImpl> get copyWith =>
      __$$StoryHighlightImplCopyWithImpl<_$StoryHighlightImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryHighlightImplToJson(this);
  }
}

abstract class _StoryHighlight extends StoryHighlight {
  const factory _StoryHighlight({
    required final String id,
    required final String userId,
    required final String title,
    required final String coverImageUrl,
    required final List<String> storyIds,
    required final DateTime createdAt,
    final int storiesCount,
    final int viewsCount,
    final HighlightVisibility visibility,
    final List<String> viewerIds,
  }) = _$StoryHighlightImpl;
  const _StoryHighlight._() : super._();

  factory _StoryHighlight.fromJson(Map<String, dynamic> json) =
      _$StoryHighlightImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get coverImageUrl;
  @override
  List<String> get storyIds;
  @override
  DateTime get createdAt;
  @override
  int get storiesCount;
  @override
  int get viewsCount;
  @override
  HighlightVisibility get visibility;
  @override
  List<String> get viewerIds;

  /// Create a copy of StoryHighlight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryHighlightImplCopyWith<_$StoryHighlightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryBundle _$StoryBundleFromJson(Map<String, dynamic> json) {
  return _StoryBundle.fromJson(json);
}

/// @nodoc
mixin _$StoryBundle {
  UserStoryInfo get user => throw _privateConstructorUsedError;
  List<Story> get stories => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  /// Serializes this StoryBundle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryBundleCopyWith<StoryBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryBundleCopyWith<$Res> {
  factory $StoryBundleCopyWith(
    StoryBundle value,
    $Res Function(StoryBundle) then,
  ) = _$StoryBundleCopyWithImpl<$Res, StoryBundle>;
  @useResult
  $Res call({UserStoryInfo user, List<Story> stories, int currentIndex});

  $UserStoryInfoCopyWith<$Res> get user;
}

/// @nodoc
class _$StoryBundleCopyWithImpl<$Res, $Val extends StoryBundle>
    implements $StoryBundleCopyWith<$Res> {
  _$StoryBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? stories = null,
    Object? currentIndex = null,
  }) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserStoryInfo,
            stories: null == stories
                ? _value.stories
                : stories // ignore: cast_nullable_to_non_nullable
                      as List<Story>,
            currentIndex: null == currentIndex
                ? _value.currentIndex
                : currentIndex // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of StoryBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStoryInfoCopyWith<$Res> get user {
    return $UserStoryInfoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryBundleImplCopyWith<$Res>
    implements $StoryBundleCopyWith<$Res> {
  factory _$$StoryBundleImplCopyWith(
    _$StoryBundleImpl value,
    $Res Function(_$StoryBundleImpl) then,
  ) = __$$StoryBundleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserStoryInfo user, List<Story> stories, int currentIndex});

  @override
  $UserStoryInfoCopyWith<$Res> get user;
}

/// @nodoc
class __$$StoryBundleImplCopyWithImpl<$Res>
    extends _$StoryBundleCopyWithImpl<$Res, _$StoryBundleImpl>
    implements _$$StoryBundleImplCopyWith<$Res> {
  __$$StoryBundleImplCopyWithImpl(
    _$StoryBundleImpl _value,
    $Res Function(_$StoryBundleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoryBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? stories = null,
    Object? currentIndex = null,
  }) {
    return _then(
      _$StoryBundleImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserStoryInfo,
        stories: null == stories
            ? _value._stories
            : stories // ignore: cast_nullable_to_non_nullable
                  as List<Story>,
        currentIndex: null == currentIndex
            ? _value.currentIndex
            : currentIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryBundleImpl extends _StoryBundle {
  const _$StoryBundleImpl({
    required this.user,
    required final List<Story> stories,
    this.currentIndex = 0,
  }) : _stories = stories,
       super._();

  factory _$StoryBundleImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryBundleImplFromJson(json);

  @override
  final UserStoryInfo user;
  final List<Story> _stories;
  @override
  List<Story> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  @JsonKey()
  final int currentIndex;

  @override
  String toString() {
    return 'StoryBundle(user: $user, stories: $stories, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryBundleImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._stories, _stories) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    user,
    const DeepCollectionEquality().hash(_stories),
    currentIndex,
  );

  /// Create a copy of StoryBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryBundleImplCopyWith<_$StoryBundleImpl> get copyWith =>
      __$$StoryBundleImplCopyWithImpl<_$StoryBundleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryBundleImplToJson(this);
  }
}

abstract class _StoryBundle extends StoryBundle {
  const factory _StoryBundle({
    required final UserStoryInfo user,
    required final List<Story> stories,
    final int currentIndex,
  }) = _$StoryBundleImpl;
  const _StoryBundle._() : super._();

  factory _StoryBundle.fromJson(Map<String, dynamic> json) =
      _$StoryBundleImpl.fromJson;

  @override
  UserStoryInfo get user;
  @override
  List<Story> get stories;
  @override
  int get currentIndex;

  /// Create a copy of StoryBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryBundleImplCopyWith<_$StoryBundleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateStoryRequest {
  dynamic get media =>
      throw _privateConstructorUsedError; // Will be File from dart:io
  MediaType get mediaType => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  List<String> get mentions => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;

  /// Create a copy of CreateStoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateStoryRequestCopyWith<CreateStoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStoryRequestCopyWith<$Res> {
  factory $CreateStoryRequestCopyWith(
    CreateStoryRequest value,
    $Res Function(CreateStoryRequest) then,
  ) = _$CreateStoryRequestCopyWithImpl<$Res, CreateStoryRequest>;
  @useResult
  $Res call({
    dynamic media,
    MediaType mediaType,
    String? caption,
    String? location,
    List<String> mentions,
    List<String> hashtags,
  });
}

/// @nodoc
class _$CreateStoryRequestCopyWithImpl<$Res, $Val extends CreateStoryRequest>
    implements $CreateStoryRequestCopyWith<$Res> {
  _$CreateStoryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateStoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = freezed,
    Object? mediaType = freezed,
    Object? caption = freezed,
    Object? location = freezed,
    Object? mentions = null,
    Object? hashtags = null,
  }) {
    return _then(
      _value.copyWith(
            media: freezed == media
                ? _value.media
                : media // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            mediaType: freezed == mediaType
                ? _value.mediaType
                : mediaType // ignore: cast_nullable_to_non_nullable
                      as MediaType,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            mentions: null == mentions
                ? _value.mentions
                : mentions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            hashtags: null == hashtags
                ? _value.hashtags
                : hashtags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateStoryRequestImplCopyWith<$Res>
    implements $CreateStoryRequestCopyWith<$Res> {
  factory _$$CreateStoryRequestImplCopyWith(
    _$CreateStoryRequestImpl value,
    $Res Function(_$CreateStoryRequestImpl) then,
  ) = __$$CreateStoryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    dynamic media,
    MediaType mediaType,
    String? caption,
    String? location,
    List<String> mentions,
    List<String> hashtags,
  });
}

/// @nodoc
class __$$CreateStoryRequestImplCopyWithImpl<$Res>
    extends _$CreateStoryRequestCopyWithImpl<$Res, _$CreateStoryRequestImpl>
    implements _$$CreateStoryRequestImplCopyWith<$Res> {
  __$$CreateStoryRequestImplCopyWithImpl(
    _$CreateStoryRequestImpl _value,
    $Res Function(_$CreateStoryRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateStoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = freezed,
    Object? mediaType = freezed,
    Object? caption = freezed,
    Object? location = freezed,
    Object? mentions = null,
    Object? hashtags = null,
  }) {
    return _then(
      _$CreateStoryRequestImpl(
        media: freezed == media
            ? _value.media
            : media // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        mediaType: freezed == mediaType
            ? _value.mediaType
            : mediaType // ignore: cast_nullable_to_non_nullable
                  as MediaType,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        mentions: null == mentions
            ? _value._mentions
            : mentions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hashtags: null == hashtags
            ? _value._hashtags
            : hashtags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$CreateStoryRequestImpl extends _CreateStoryRequest {
  const _$CreateStoryRequestImpl({
    required this.media,
    required this.mediaType,
    this.caption,
    this.location,
    final List<String> mentions = const [],
    final List<String> hashtags = const [],
  }) : _mentions = mentions,
       _hashtags = hashtags,
       super._();

  @override
  final dynamic media;
  // Will be File from dart:io
  @override
  final MediaType mediaType;
  @override
  final String? caption;
  @override
  final String? location;
  final List<String> _mentions;
  @override
  @JsonKey()
  List<String> get mentions {
    if (_mentions is EqualUnmodifiableListView) return _mentions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentions);
  }

  final List<String> _hashtags;
  @override
  @JsonKey()
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  @override
  String toString() {
    return 'CreateStoryRequest(media: $media, mediaType: $mediaType, caption: $caption, location: $location, mentions: $mentions, hashtags: $hashtags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStoryRequestImpl &&
            const DeepCollectionEquality().equals(other.media, media) &&
            const DeepCollectionEquality().equals(other.mediaType, mediaType) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._mentions, _mentions) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(media),
    const DeepCollectionEquality().hash(mediaType),
    caption,
    location,
    const DeepCollectionEquality().hash(_mentions),
    const DeepCollectionEquality().hash(_hashtags),
  );

  /// Create a copy of CreateStoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStoryRequestImplCopyWith<_$CreateStoryRequestImpl> get copyWith =>
      __$$CreateStoryRequestImplCopyWithImpl<_$CreateStoryRequestImpl>(
        this,
        _$identity,
      );
}

abstract class _CreateStoryRequest extends CreateStoryRequest {
  const factory _CreateStoryRequest({
    required final dynamic media,
    required final MediaType mediaType,
    final String? caption,
    final String? location,
    final List<String> mentions,
    final List<String> hashtags,
  }) = _$CreateStoryRequestImpl;
  const _CreateStoryRequest._() : super._();

  @override
  dynamic get media; // Will be File from dart:io
  @override
  MediaType get mediaType;
  @override
  String? get caption;
  @override
  String? get location;
  @override
  List<String> get mentions;
  @override
  List<String> get hashtags;

  /// Create a copy of CreateStoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateStoryRequestImplCopyWith<_$CreateStoryRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryStats _$StoryStatsFromJson(Map<String, dynamic> json) {
  return _StoryStats.fromJson(json);
}

/// @nodoc
mixin _$StoryStats {
  int get totalStories => throw _privateConstructorUsedError;
  int get totalViews => throw _privateConstructorUsedError;
  int get totalReplies => throw _privateConstructorUsedError;
  int get totalReactions => throw _privateConstructorUsedError;
  int get thisWeekStories => throw _privateConstructorUsedError;
  int get thisMonthStories => throw _privateConstructorUsedError;
  int get averageViewsPerStory => throw _privateConstructorUsedError;
  int get averageRepliesPerStory => throw _privateConstructorUsedError;
  double get averageCompletionRate => throw _privateConstructorUsedError;

  /// Serializes this StoryStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryStatsCopyWith<StoryStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryStatsCopyWith<$Res> {
  factory $StoryStatsCopyWith(
    StoryStats value,
    $Res Function(StoryStats) then,
  ) = _$StoryStatsCopyWithImpl<$Res, StoryStats>;
  @useResult
  $Res call({
    int totalStories,
    int totalViews,
    int totalReplies,
    int totalReactions,
    int thisWeekStories,
    int thisMonthStories,
    int averageViewsPerStory,
    int averageRepliesPerStory,
    double averageCompletionRate,
  });
}

/// @nodoc
class _$StoryStatsCopyWithImpl<$Res, $Val extends StoryStats>
    implements $StoryStatsCopyWith<$Res> {
  _$StoryStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalStories = null,
    Object? totalViews = null,
    Object? totalReplies = null,
    Object? totalReactions = null,
    Object? thisWeekStories = null,
    Object? thisMonthStories = null,
    Object? averageViewsPerStory = null,
    Object? averageRepliesPerStory = null,
    Object? averageCompletionRate = null,
  }) {
    return _then(
      _value.copyWith(
            totalStories: null == totalStories
                ? _value.totalStories
                : totalStories // ignore: cast_nullable_to_non_nullable
                      as int,
            totalViews: null == totalViews
                ? _value.totalViews
                : totalViews // ignore: cast_nullable_to_non_nullable
                      as int,
            totalReplies: null == totalReplies
                ? _value.totalReplies
                : totalReplies // ignore: cast_nullable_to_non_nullable
                      as int,
            totalReactions: null == totalReactions
                ? _value.totalReactions
                : totalReactions // ignore: cast_nullable_to_non_nullable
                      as int,
            thisWeekStories: null == thisWeekStories
                ? _value.thisWeekStories
                : thisWeekStories // ignore: cast_nullable_to_non_nullable
                      as int,
            thisMonthStories: null == thisMonthStories
                ? _value.thisMonthStories
                : thisMonthStories // ignore: cast_nullable_to_non_nullable
                      as int,
            averageViewsPerStory: null == averageViewsPerStory
                ? _value.averageViewsPerStory
                : averageViewsPerStory // ignore: cast_nullable_to_non_nullable
                      as int,
            averageRepliesPerStory: null == averageRepliesPerStory
                ? _value.averageRepliesPerStory
                : averageRepliesPerStory // ignore: cast_nullable_to_non_nullable
                      as int,
            averageCompletionRate: null == averageCompletionRate
                ? _value.averageCompletionRate
                : averageCompletionRate // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoryStatsImplCopyWith<$Res>
    implements $StoryStatsCopyWith<$Res> {
  factory _$$StoryStatsImplCopyWith(
    _$StoryStatsImpl value,
    $Res Function(_$StoryStatsImpl) then,
  ) = __$$StoryStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalStories,
    int totalViews,
    int totalReplies,
    int totalReactions,
    int thisWeekStories,
    int thisMonthStories,
    int averageViewsPerStory,
    int averageRepliesPerStory,
    double averageCompletionRate,
  });
}

/// @nodoc
class __$$StoryStatsImplCopyWithImpl<$Res>
    extends _$StoryStatsCopyWithImpl<$Res, _$StoryStatsImpl>
    implements _$$StoryStatsImplCopyWith<$Res> {
  __$$StoryStatsImplCopyWithImpl(
    _$StoryStatsImpl _value,
    $Res Function(_$StoryStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoryStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalStories = null,
    Object? totalViews = null,
    Object? totalReplies = null,
    Object? totalReactions = null,
    Object? thisWeekStories = null,
    Object? thisMonthStories = null,
    Object? averageViewsPerStory = null,
    Object? averageRepliesPerStory = null,
    Object? averageCompletionRate = null,
  }) {
    return _then(
      _$StoryStatsImpl(
        totalStories: null == totalStories
            ? _value.totalStories
            : totalStories // ignore: cast_nullable_to_non_nullable
                  as int,
        totalViews: null == totalViews
            ? _value.totalViews
            : totalViews // ignore: cast_nullable_to_non_nullable
                  as int,
        totalReplies: null == totalReplies
            ? _value.totalReplies
            : totalReplies // ignore: cast_nullable_to_non_nullable
                  as int,
        totalReactions: null == totalReactions
            ? _value.totalReactions
            : totalReactions // ignore: cast_nullable_to_non_nullable
                  as int,
        thisWeekStories: null == thisWeekStories
            ? _value.thisWeekStories
            : thisWeekStories // ignore: cast_nullable_to_non_nullable
                  as int,
        thisMonthStories: null == thisMonthStories
            ? _value.thisMonthStories
            : thisMonthStories // ignore: cast_nullable_to_non_nullable
                  as int,
        averageViewsPerStory: null == averageViewsPerStory
            ? _value.averageViewsPerStory
            : averageViewsPerStory // ignore: cast_nullable_to_non_nullable
                  as int,
        averageRepliesPerStory: null == averageRepliesPerStory
            ? _value.averageRepliesPerStory
            : averageRepliesPerStory // ignore: cast_nullable_to_non_nullable
                  as int,
        averageCompletionRate: null == averageCompletionRate
            ? _value.averageCompletionRate
            : averageCompletionRate // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryStatsImpl implements _StoryStats {
  const _$StoryStatsImpl({
    required this.totalStories,
    required this.totalViews,
    required this.totalReplies,
    required this.totalReactions,
    this.thisWeekStories = 0,
    this.thisMonthStories = 0,
    this.averageViewsPerStory = 0,
    this.averageRepliesPerStory = 0,
    this.averageCompletionRate = 0.0,
  });

  factory _$StoryStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryStatsImplFromJson(json);

  @override
  final int totalStories;
  @override
  final int totalViews;
  @override
  final int totalReplies;
  @override
  final int totalReactions;
  @override
  @JsonKey()
  final int thisWeekStories;
  @override
  @JsonKey()
  final int thisMonthStories;
  @override
  @JsonKey()
  final int averageViewsPerStory;
  @override
  @JsonKey()
  final int averageRepliesPerStory;
  @override
  @JsonKey()
  final double averageCompletionRate;

  @override
  String toString() {
    return 'StoryStats(totalStories: $totalStories, totalViews: $totalViews, totalReplies: $totalReplies, totalReactions: $totalReactions, thisWeekStories: $thisWeekStories, thisMonthStories: $thisMonthStories, averageViewsPerStory: $averageViewsPerStory, averageRepliesPerStory: $averageRepliesPerStory, averageCompletionRate: $averageCompletionRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryStatsImpl &&
            (identical(other.totalStories, totalStories) ||
                other.totalStories == totalStories) &&
            (identical(other.totalViews, totalViews) ||
                other.totalViews == totalViews) &&
            (identical(other.totalReplies, totalReplies) ||
                other.totalReplies == totalReplies) &&
            (identical(other.totalReactions, totalReactions) ||
                other.totalReactions == totalReactions) &&
            (identical(other.thisWeekStories, thisWeekStories) ||
                other.thisWeekStories == thisWeekStories) &&
            (identical(other.thisMonthStories, thisMonthStories) ||
                other.thisMonthStories == thisMonthStories) &&
            (identical(other.averageViewsPerStory, averageViewsPerStory) ||
                other.averageViewsPerStory == averageViewsPerStory) &&
            (identical(other.averageRepliesPerStory, averageRepliesPerStory) ||
                other.averageRepliesPerStory == averageRepliesPerStory) &&
            (identical(other.averageCompletionRate, averageCompletionRate) ||
                other.averageCompletionRate == averageCompletionRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalStories,
    totalViews,
    totalReplies,
    totalReactions,
    thisWeekStories,
    thisMonthStories,
    averageViewsPerStory,
    averageRepliesPerStory,
    averageCompletionRate,
  );

  /// Create a copy of StoryStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryStatsImplCopyWith<_$StoryStatsImpl> get copyWith =>
      __$$StoryStatsImplCopyWithImpl<_$StoryStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryStatsImplToJson(this);
  }
}

abstract class _StoryStats implements StoryStats {
  const factory _StoryStats({
    required final int totalStories,
    required final int totalViews,
    required final int totalReplies,
    required final int totalReactions,
    final int thisWeekStories,
    final int thisMonthStories,
    final int averageViewsPerStory,
    final int averageRepliesPerStory,
    final double averageCompletionRate,
  }) = _$StoryStatsImpl;

  factory _StoryStats.fromJson(Map<String, dynamic> json) =
      _$StoryStatsImpl.fromJson;

  @override
  int get totalStories;
  @override
  int get totalViews;
  @override
  int get totalReplies;
  @override
  int get totalReactions;
  @override
  int get thisWeekStories;
  @override
  int get thisMonthStories;
  @override
  int get averageViewsPerStory;
  @override
  int get averageRepliesPerStory;
  @override
  double get averageCompletionRate;

  /// Create a copy of StoryStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryStatsImplCopyWith<_$StoryStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryView _$StoryViewFromJson(Map<String, dynamic> json) {
  return _StoryView.fromJson(json);
}

/// @nodoc
mixin _$StoryView {
  String get id => throw _privateConstructorUsedError;
  String get storyId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get viewedAt => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get timeSpent => throw _privateConstructorUsedError;

  /// Serializes this StoryView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryViewCopyWith<StoryView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryViewCopyWith<$Res> {
  factory $StoryViewCopyWith(StoryView value, $Res Function(StoryView) then) =
      _$StoryViewCopyWithImpl<$Res, StoryView>;
  @useResult
  $Res call({
    String id,
    String storyId,
    String userId,
    DateTime viewedAt,
    double completionRate,
    int timeSpent,
  });
}

/// @nodoc
class _$StoryViewCopyWithImpl<$Res, $Val extends StoryView>
    implements $StoryViewCopyWith<$Res> {
  _$StoryViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storyId = null,
    Object? userId = null,
    Object? viewedAt = null,
    Object? completionRate = null,
    Object? timeSpent = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            storyId: null == storyId
                ? _value.storyId
                : storyId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            viewedAt: null == viewedAt
                ? _value.viewedAt
                : viewedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completionRate: null == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                      as double,
            timeSpent: null == timeSpent
                ? _value.timeSpent
                : timeSpent // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoryViewImplCopyWith<$Res>
    implements $StoryViewCopyWith<$Res> {
  factory _$$StoryViewImplCopyWith(
    _$StoryViewImpl value,
    $Res Function(_$StoryViewImpl) then,
  ) = __$$StoryViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String storyId,
    String userId,
    DateTime viewedAt,
    double completionRate,
    int timeSpent,
  });
}

/// @nodoc
class __$$StoryViewImplCopyWithImpl<$Res>
    extends _$StoryViewCopyWithImpl<$Res, _$StoryViewImpl>
    implements _$$StoryViewImplCopyWith<$Res> {
  __$$StoryViewImplCopyWithImpl(
    _$StoryViewImpl _value,
    $Res Function(_$StoryViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoryView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storyId = null,
    Object? userId = null,
    Object? viewedAt = null,
    Object? completionRate = null,
    Object? timeSpent = null,
  }) {
    return _then(
      _$StoryViewImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        storyId: null == storyId
            ? _value.storyId
            : storyId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        viewedAt: null == viewedAt
            ? _value.viewedAt
            : viewedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completionRate: null == completionRate
            ? _value.completionRate
            : completionRate // ignore: cast_nullable_to_non_nullable
                  as double,
        timeSpent: null == timeSpent
            ? _value.timeSpent
            : timeSpent // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryViewImpl implements _StoryView {
  const _$StoryViewImpl({
    required this.id,
    required this.storyId,
    required this.userId,
    required this.viewedAt,
    this.completionRate = 0.0,
    this.timeSpent = 0,
  });

  factory _$StoryViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryViewImplFromJson(json);

  @override
  final String id;
  @override
  final String storyId;
  @override
  final String userId;
  @override
  final DateTime viewedAt;
  @override
  @JsonKey()
  final double completionRate;
  @override
  @JsonKey()
  final int timeSpent;

  @override
  String toString() {
    return 'StoryView(id: $id, storyId: $storyId, userId: $userId, viewedAt: $viewedAt, completionRate: $completionRate, timeSpent: $timeSpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storyId, storyId) || other.storyId == storyId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.viewedAt, viewedAt) ||
                other.viewedAt == viewedAt) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    storyId,
    userId,
    viewedAt,
    completionRate,
    timeSpent,
  );

  /// Create a copy of StoryView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryViewImplCopyWith<_$StoryViewImpl> get copyWith =>
      __$$StoryViewImplCopyWithImpl<_$StoryViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryViewImplToJson(this);
  }
}

abstract class _StoryView implements StoryView {
  const factory _StoryView({
    required final String id,
    required final String storyId,
    required final String userId,
    required final DateTime viewedAt,
    final double completionRate,
    final int timeSpent,
  }) = _$StoryViewImpl;

  factory _StoryView.fromJson(Map<String, dynamic> json) =
      _$StoryViewImpl.fromJson;

  @override
  String get id;
  @override
  String get storyId;
  @override
  String get userId;
  @override
  DateTime get viewedAt;
  @override
  double get completionRate;
  @override
  int get timeSpent;

  /// Create a copy of StoryView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryViewImplCopyWith<_$StoryViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FileStoryMedia {
  dynamic get file =>
      throw _privateConstructorUsedError; // Will be File from dart:io
  MediaType get type => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Create a copy of FileStoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileStoryMediaCopyWith<FileStoryMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileStoryMediaCopyWith<$Res> {
  factory $FileStoryMediaCopyWith(
    FileStoryMedia value,
    $Res Function(FileStoryMedia) then,
  ) = _$FileStoryMediaCopyWithImpl<$Res, FileStoryMedia>;
  @useResult
  $Res call({
    dynamic file,
    MediaType type,
    String? caption,
    int duration,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$FileStoryMediaCopyWithImpl<$Res, $Val extends FileStoryMedia>
    implements $FileStoryMediaCopyWith<$Res> {
  _$FileStoryMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileStoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? type = freezed,
    Object? caption = freezed,
    Object? duration = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            file: freezed == file
                ? _value.file
                : file // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as MediaType,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$FileStoryMediaImplCopyWith<$Res>
    implements $FileStoryMediaCopyWith<$Res> {
  factory _$$FileStoryMediaImplCopyWith(
    _$FileStoryMediaImpl value,
    $Res Function(_$FileStoryMediaImpl) then,
  ) = __$$FileStoryMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    dynamic file,
    MediaType type,
    String? caption,
    int duration,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$FileStoryMediaImplCopyWithImpl<$Res>
    extends _$FileStoryMediaCopyWithImpl<$Res, _$FileStoryMediaImpl>
    implements _$$FileStoryMediaImplCopyWith<$Res> {
  __$$FileStoryMediaImplCopyWithImpl(
    _$FileStoryMediaImpl _value,
    $Res Function(_$FileStoryMediaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FileStoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? type = freezed,
    Object? caption = freezed,
    Object? duration = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _$FileStoryMediaImpl(
        file: freezed == file
            ? _value.file
            : file // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MediaType,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$FileStoryMediaImpl extends _FileStoryMedia {
  const _$FileStoryMediaImpl({
    required this.file,
    required this.type,
    this.caption,
    this.duration = 0,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata,
       super._();

  @override
  final dynamic file;
  // Will be File from dart:io
  @override
  final MediaType type;
  @override
  final String? caption;
  @override
  @JsonKey()
  final int duration;
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
    return 'FileStoryMedia(file: $file, type: $type, caption: $caption, duration: $duration, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileStoryMediaImpl &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(file),
    const DeepCollectionEquality().hash(type),
    caption,
    duration,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of FileStoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileStoryMediaImplCopyWith<_$FileStoryMediaImpl> get copyWith =>
      __$$FileStoryMediaImplCopyWithImpl<_$FileStoryMediaImpl>(
        this,
        _$identity,
      );
}

abstract class _FileStoryMedia extends FileStoryMedia {
  const factory _FileStoryMedia({
    required final dynamic file,
    required final MediaType type,
    final String? caption,
    final int duration,
    final Map<String, dynamic>? metadata,
  }) = _$FileStoryMediaImpl;
  const _FileStoryMedia._() : super._();

  @override
  dynamic get file; // Will be File from dart:io
  @override
  MediaType get type;
  @override
  String? get caption;
  @override
  int get duration;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of FileStoryMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileStoryMediaImplCopyWith<_$FileStoryMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
