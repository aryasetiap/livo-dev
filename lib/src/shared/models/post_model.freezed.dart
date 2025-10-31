// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<Media> get media => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  int get sharesCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  bool get isBookmarked => throw _privateConstructorUsedError;
  PostVisibility get visibility => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  PostStatus get status => throw _privateConstructorUsedError;
  UserPostInfo? get user => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call({
    String id,
    String userId,
    String content,
    DateTime createdAt,
    DateTime updatedAt,
    List<Media> media,
    int likesCount,
    int commentsCount,
    int sharesCount,
    bool isLiked,
    bool isBookmarked,
    PostVisibility visibility,
    String? location,
    List<String>? tags,
    PostStatus status,
    UserPostInfo? user,
  });

  $UserPostInfoCopyWith<$Res>? get user;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? media = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? sharesCount = null,
    Object? isLiked = null,
    Object? isBookmarked = null,
    Object? visibility = null,
    Object? location = freezed,
    Object? tags = freezed,
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
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            media: null == media
                ? _value.media
                : media // ignore: cast_nullable_to_non_nullable
                      as List<Media>,
            likesCount: null == likesCount
                ? _value.likesCount
                : likesCount // ignore: cast_nullable_to_non_nullable
                      as int,
            commentsCount: null == commentsCount
                ? _value.commentsCount
                : commentsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            sharesCount: null == sharesCount
                ? _value.sharesCount
                : sharesCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isLiked: null == isLiked
                ? _value.isLiked
                : isLiked // ignore: cast_nullable_to_non_nullable
                      as bool,
            isBookmarked: null == isBookmarked
                ? _value.isBookmarked
                : isBookmarked // ignore: cast_nullable_to_non_nullable
                      as bool,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as PostVisibility,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PostStatus,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserPostInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPostInfoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserPostInfoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
    _$PostImpl value,
    $Res Function(_$PostImpl) then,
  ) = __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String content,
    DateTime createdAt,
    DateTime updatedAt,
    List<Media> media,
    int likesCount,
    int commentsCount,
    int sharesCount,
    bool isLiked,
    bool isBookmarked,
    PostVisibility visibility,
    String? location,
    List<String>? tags,
    PostStatus status,
    UserPostInfo? user,
  });

  @override
  $UserPostInfoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
    : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? media = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? sharesCount = null,
    Object? isLiked = null,
    Object? isBookmarked = null,
    Object? visibility = null,
    Object? location = freezed,
    Object? tags = freezed,
    Object? status = null,
    Object? user = freezed,
  }) {
    return _then(
      _$PostImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
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
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        media: null == media
            ? _value._media
            : media // ignore: cast_nullable_to_non_nullable
                  as List<Media>,
        likesCount: null == likesCount
            ? _value.likesCount
            : likesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        commentsCount: null == commentsCount
            ? _value.commentsCount
            : commentsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        sharesCount: null == sharesCount
            ? _value.sharesCount
            : sharesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isLiked: null == isLiked
            ? _value.isLiked
            : isLiked // ignore: cast_nullable_to_non_nullable
                  as bool,
        isBookmarked: null == isBookmarked
            ? _value.isBookmarked
            : isBookmarked // ignore: cast_nullable_to_non_nullable
                  as bool,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as PostVisibility,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PostStatus,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserPostInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl extends _Post {
  const _$PostImpl({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    final List<Media> media = const [],
    this.likesCount = 0,
    this.commentsCount = 0,
    this.sharesCount = 0,
    this.isLiked = false,
    this.isBookmarked = false,
    this.visibility = PostVisibility.public,
    this.location,
    final List<String>? tags,
    this.status = PostStatus.published,
    this.user,
  }) : _media = media,
       _tags = tags,
       super._();

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<Media> _media;
  @override
  @JsonKey()
  List<Media> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  @JsonKey()
  final int likesCount;
  @override
  @JsonKey()
  final int commentsCount;
  @override
  @JsonKey()
  final int sharesCount;
  @override
  @JsonKey()
  final bool isLiked;
  @override
  @JsonKey()
  final bool isBookmarked;
  @override
  @JsonKey()
  final PostVisibility visibility;
  @override
  final String? location;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final PostStatus status;
  @override
  final UserPostInfo? user;

  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, media: $media, likesCount: $likesCount, commentsCount: $commentsCount, sharesCount: $sharesCount, isLiked: $isLiked, isBookmarked: $isBookmarked, visibility: $visibility, location: $location, tags: $tags, status: $status, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.sharesCount, sharesCount) ||
                other.sharesCount == sharesCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    content,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_media),
    likesCount,
    commentsCount,
    sharesCount,
    isLiked,
    isBookmarked,
    visibility,
    location,
    const DeepCollectionEquality().hash(_tags),
    status,
    user,
  );

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(this);
  }
}

abstract class _Post extends Post {
  const factory _Post({
    required final String id,
    required final String userId,
    required final String content,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final List<Media> media,
    final int likesCount,
    final int commentsCount,
    final int sharesCount,
    final bool isLiked,
    final bool isBookmarked,
    final PostVisibility visibility,
    final String? location,
    final List<String>? tags,
    final PostStatus status,
    final UserPostInfo? user,
  }) = _$PostImpl;
  const _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<Media> get media;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  int get sharesCount;
  @override
  bool get isLiked;
  @override
  bool get isBookmarked;
  @override
  PostVisibility get visibility;
  @override
  String? get location;
  @override
  List<String>? get tags;
  @override
  PostStatus get status;
  @override
  UserPostInfo? get user;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  MediaType get type => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get sizeBytes => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  MediaStatus get status => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call({
    String id,
    String postId,
    MediaType type,
    String url,
    String thumbnailUrl,
    int width,
    int height,
    int sizeBytes,
    int duration,
    int orderIndex,
    MediaStatus status,
    String? caption,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? type = null,
    Object? url = null,
    Object? thumbnailUrl = null,
    Object? width = null,
    Object? height = null,
    Object? sizeBytes = null,
    Object? duration = null,
    Object? orderIndex = null,
    Object? status = null,
    Object? caption = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            postId: null == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as MediaType,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
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
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            orderIndex: null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MediaStatus,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MediaImplCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$MediaImplCopyWith(
    _$MediaImpl value,
    $Res Function(_$MediaImpl) then,
  ) = __$$MediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String postId,
    MediaType type,
    String url,
    String thumbnailUrl,
    int width,
    int height,
    int sizeBytes,
    int duration,
    int orderIndex,
    MediaStatus status,
    String? caption,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$MediaImplCopyWithImpl<$Res>
    extends _$MediaCopyWithImpl<$Res, _$MediaImpl>
    implements _$$MediaImplCopyWith<$Res> {
  __$$MediaImplCopyWithImpl(
    _$MediaImpl _value,
    $Res Function(_$MediaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? type = null,
    Object? url = null,
    Object? thumbnailUrl = null,
    Object? width = null,
    Object? height = null,
    Object? sizeBytes = null,
    Object? duration = null,
    Object? orderIndex = null,
    Object? status = null,
    Object? caption = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$MediaImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        postId: null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MediaType,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
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
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        orderIndex: null == orderIndex
            ? _value.orderIndex
            : orderIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MediaStatus,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
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
class _$MediaImpl extends _Media {
  const _$MediaImpl({
    required this.id,
    required this.postId,
    required this.type,
    required this.url,
    required this.thumbnailUrl,
    this.width = 0,
    this.height = 0,
    this.sizeBytes = 0,
    this.duration = 0,
    this.orderIndex = 0,
    this.status = MediaStatus.processed,
    this.caption,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata,
       super._();

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

  @override
  final String id;
  @override
  final String postId;
  @override
  final MediaType type;
  @override
  final String url;
  @override
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
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final int orderIndex;
  @override
  @JsonKey()
  final MediaStatus status;
  @override
  final String? caption;
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
    return 'Media(id: $id, postId: $postId, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, width: $width, height: $height, sizeBytes: $sizeBytes, duration: $duration, orderIndex: $orderIndex, status: $status, caption: $caption, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    postId,
    type,
    url,
    thumbnailUrl,
    width,
    height,
    sizeBytes,
    duration,
    orderIndex,
    status,
    caption,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      __$$MediaImplCopyWithImpl<_$MediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaImplToJson(this);
  }
}

abstract class _Media extends Media {
  const factory _Media({
    required final String id,
    required final String postId,
    required final MediaType type,
    required final String url,
    required final String thumbnailUrl,
    final int width,
    final int height,
    final int sizeBytes,
    final int duration,
    final int orderIndex,
    final MediaStatus status,
    final String? caption,
    final Map<String, dynamic>? metadata,
  }) = _$MediaImpl;
  const _Media._() : super._();

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  String get id;
  @override
  String get postId;
  @override
  MediaType get type;
  @override
  String get url;
  @override
  String get thumbnailUrl;
  @override
  int get width;
  @override
  int get height;
  @override
  int get sizeBytes;
  @override
  int get duration;
  @override
  int get orderIndex;
  @override
  MediaStatus get status;
  @override
  String? get caption;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPostInfo _$UserPostInfoFromJson(Map<String, dynamic> json) {
  return _UserPostInfo.fromJson(json);
}

/// @nodoc
mixin _$UserPostInfo {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Serializes this UserPostInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPostInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPostInfoCopyWith<UserPostInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostInfoCopyWith<$Res> {
  factory $UserPostInfoCopyWith(
    UserPostInfo value,
    $Res Function(UserPostInfo) then,
  ) = _$UserPostInfoCopyWithImpl<$Res, UserPostInfo>;
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
class _$UserPostInfoCopyWithImpl<$Res, $Val extends UserPostInfo>
    implements $UserPostInfoCopyWith<$Res> {
  _$UserPostInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPostInfo
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
abstract class _$$UserPostInfoImplCopyWith<$Res>
    implements $UserPostInfoCopyWith<$Res> {
  factory _$$UserPostInfoImplCopyWith(
    _$UserPostInfoImpl value,
    $Res Function(_$UserPostInfoImpl) then,
  ) = __$$UserPostInfoImplCopyWithImpl<$Res>;
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
class __$$UserPostInfoImplCopyWithImpl<$Res>
    extends _$UserPostInfoCopyWithImpl<$Res, _$UserPostInfoImpl>
    implements _$$UserPostInfoImplCopyWith<$Res> {
  __$$UserPostInfoImplCopyWithImpl(
    _$UserPostInfoImpl _value,
    $Res Function(_$UserPostInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserPostInfo
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
      _$UserPostInfoImpl(
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
class _$UserPostInfoImpl extends _UserPostInfo {
  const _$UserPostInfoImpl({
    required this.id,
    required this.username,
    required this.displayName,
    this.avatarUrl,
    this.isVerified = false,
  }) : super._();

  factory _$UserPostInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPostInfoImplFromJson(json);

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
    return 'UserPostInfo(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPostInfoImpl &&
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

  /// Create a copy of UserPostInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPostInfoImplCopyWith<_$UserPostInfoImpl> get copyWith =>
      __$$UserPostInfoImplCopyWithImpl<_$UserPostInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPostInfoImplToJson(this);
  }
}

abstract class _UserPostInfo extends UserPostInfo {
  const factory _UserPostInfo({
    required final String id,
    required final String username,
    required final String displayName,
    final String? avatarUrl,
    final bool isVerified,
  }) = _$UserPostInfoImpl;
  const _UserPostInfo._() : super._();

  factory _UserPostInfo.fromJson(Map<String, dynamic> json) =
      _$UserPostInfoImpl.fromJson;

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

  /// Create a copy of UserPostInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPostInfoImplCopyWith<_$UserPostInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostInteraction _$PostInteractionFromJson(Map<String, dynamic> json) {
  return _PostInteraction.fromJson(json);
}

/// @nodoc
mixin _$PostInteraction {
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  PostInteractionType get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  /// Serializes this PostInteraction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostInteraction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostInteractionCopyWith<PostInteraction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostInteractionCopyWith<$Res> {
  factory $PostInteractionCopyWith(
    PostInteraction value,
    $Res Function(PostInteraction) then,
  ) = _$PostInteractionCopyWithImpl<$Res, PostInteraction>;
  @useResult
  $Res call({
    String id,
    String postId,
    String userId,
    PostInteractionType type,
    DateTime createdAt,
    String? comment,
  });
}

/// @nodoc
class _$PostInteractionCopyWithImpl<$Res, $Val extends PostInteraction>
    implements $PostInteractionCopyWith<$Res> {
  _$PostInteractionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostInteraction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? type = null,
    Object? createdAt = null,
    Object? comment = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            postId: null == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as PostInteractionType,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostInteractionImplCopyWith<$Res>
    implements $PostInteractionCopyWith<$Res> {
  factory _$$PostInteractionImplCopyWith(
    _$PostInteractionImpl value,
    $Res Function(_$PostInteractionImpl) then,
  ) = __$$PostInteractionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String postId,
    String userId,
    PostInteractionType type,
    DateTime createdAt,
    String? comment,
  });
}

/// @nodoc
class __$$PostInteractionImplCopyWithImpl<$Res>
    extends _$PostInteractionCopyWithImpl<$Res, _$PostInteractionImpl>
    implements _$$PostInteractionImplCopyWith<$Res> {
  __$$PostInteractionImplCopyWithImpl(
    _$PostInteractionImpl _value,
    $Res Function(_$PostInteractionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostInteraction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? type = null,
    Object? createdAt = null,
    Object? comment = freezed,
  }) {
    return _then(
      _$PostInteractionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        postId: null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as PostInteractionType,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostInteractionImpl implements _PostInteraction {
  const _$PostInteractionImpl({
    required this.id,
    required this.postId,
    required this.userId,
    required this.type,
    required this.createdAt,
    this.comment,
  });

  factory _$PostInteractionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostInteractionImplFromJson(json);

  @override
  final String id;
  @override
  final String postId;
  @override
  final String userId;
  @override
  final PostInteractionType type;
  @override
  final DateTime createdAt;
  @override
  final String? comment;

  @override
  String toString() {
    return 'PostInteraction(id: $id, postId: $postId, userId: $userId, type: $type, createdAt: $createdAt, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostInteractionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, postId, userId, type, createdAt, comment);

  /// Create a copy of PostInteraction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostInteractionImplCopyWith<_$PostInteractionImpl> get copyWith =>
      __$$PostInteractionImplCopyWithImpl<_$PostInteractionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PostInteractionImplToJson(this);
  }
}

abstract class _PostInteraction implements PostInteraction {
  const factory _PostInteraction({
    required final String id,
    required final String postId,
    required final String userId,
    required final PostInteractionType type,
    required final DateTime createdAt,
    final String? comment,
  }) = _$PostInteractionImpl;

  factory _PostInteraction.fromJson(Map<String, dynamic> json) =
      _$PostInteractionImpl.fromJson;

  @override
  String get id;
  @override
  String get postId;
  @override
  String get userId;
  @override
  PostInteractionType get type;
  @override
  DateTime get createdAt;
  @override
  String? get comment;

  /// Create a copy of PostInteraction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostInteractionImplCopyWith<_$PostInteractionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostStats _$PostStatsFromJson(Map<String, dynamic> json) {
  return _PostStats.fromJson(json);
}

/// @nodoc
mixin _$PostStats {
  int get totalPosts => throw _privateConstructorUsedError;
  int get totalLikes => throw _privateConstructorUsedError;
  int get totalComments => throw _privateConstructorUsedError;
  int get totalShares => throw _privateConstructorUsedError;
  int get thisWeekPosts => throw _privateConstructorUsedError;
  int get thisMonthPosts => throw _privateConstructorUsedError;
  int get thisYearPosts => throw _privateConstructorUsedError;

  /// Serializes this PostStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostStatsCopyWith<PostStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStatsCopyWith<$Res> {
  factory $PostStatsCopyWith(PostStats value, $Res Function(PostStats) then) =
      _$PostStatsCopyWithImpl<$Res, PostStats>;
  @useResult
  $Res call({
    int totalPosts,
    int totalLikes,
    int totalComments,
    int totalShares,
    int thisWeekPosts,
    int thisMonthPosts,
    int thisYearPosts,
  });
}

/// @nodoc
class _$PostStatsCopyWithImpl<$Res, $Val extends PostStats>
    implements $PostStatsCopyWith<$Res> {
  _$PostStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPosts = null,
    Object? totalLikes = null,
    Object? totalComments = null,
    Object? totalShares = null,
    Object? thisWeekPosts = null,
    Object? thisMonthPosts = null,
    Object? thisYearPosts = null,
  }) {
    return _then(
      _value.copyWith(
            totalPosts: null == totalPosts
                ? _value.totalPosts
                : totalPosts // ignore: cast_nullable_to_non_nullable
                      as int,
            totalLikes: null == totalLikes
                ? _value.totalLikes
                : totalLikes // ignore: cast_nullable_to_non_nullable
                      as int,
            totalComments: null == totalComments
                ? _value.totalComments
                : totalComments // ignore: cast_nullable_to_non_nullable
                      as int,
            totalShares: null == totalShares
                ? _value.totalShares
                : totalShares // ignore: cast_nullable_to_non_nullable
                      as int,
            thisWeekPosts: null == thisWeekPosts
                ? _value.thisWeekPosts
                : thisWeekPosts // ignore: cast_nullable_to_non_nullable
                      as int,
            thisMonthPosts: null == thisMonthPosts
                ? _value.thisMonthPosts
                : thisMonthPosts // ignore: cast_nullable_to_non_nullable
                      as int,
            thisYearPosts: null == thisYearPosts
                ? _value.thisYearPosts
                : thisYearPosts // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostStatsImplCopyWith<$Res>
    implements $PostStatsCopyWith<$Res> {
  factory _$$PostStatsImplCopyWith(
    _$PostStatsImpl value,
    $Res Function(_$PostStatsImpl) then,
  ) = __$$PostStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalPosts,
    int totalLikes,
    int totalComments,
    int totalShares,
    int thisWeekPosts,
    int thisMonthPosts,
    int thisYearPosts,
  });
}

/// @nodoc
class __$$PostStatsImplCopyWithImpl<$Res>
    extends _$PostStatsCopyWithImpl<$Res, _$PostStatsImpl>
    implements _$$PostStatsImplCopyWith<$Res> {
  __$$PostStatsImplCopyWithImpl(
    _$PostStatsImpl _value,
    $Res Function(_$PostStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPosts = null,
    Object? totalLikes = null,
    Object? totalComments = null,
    Object? totalShares = null,
    Object? thisWeekPosts = null,
    Object? thisMonthPosts = null,
    Object? thisYearPosts = null,
  }) {
    return _then(
      _$PostStatsImpl(
        totalPosts: null == totalPosts
            ? _value.totalPosts
            : totalPosts // ignore: cast_nullable_to_non_nullable
                  as int,
        totalLikes: null == totalLikes
            ? _value.totalLikes
            : totalLikes // ignore: cast_nullable_to_non_nullable
                  as int,
        totalComments: null == totalComments
            ? _value.totalComments
            : totalComments // ignore: cast_nullable_to_non_nullable
                  as int,
        totalShares: null == totalShares
            ? _value.totalShares
            : totalShares // ignore: cast_nullable_to_non_nullable
                  as int,
        thisWeekPosts: null == thisWeekPosts
            ? _value.thisWeekPosts
            : thisWeekPosts // ignore: cast_nullable_to_non_nullable
                  as int,
        thisMonthPosts: null == thisMonthPosts
            ? _value.thisMonthPosts
            : thisMonthPosts // ignore: cast_nullable_to_non_nullable
                  as int,
        thisYearPosts: null == thisYearPosts
            ? _value.thisYearPosts
            : thisYearPosts // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostStatsImpl implements _PostStats {
  const _$PostStatsImpl({
    required this.totalPosts,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShares,
    this.thisWeekPosts = 0,
    this.thisMonthPosts = 0,
    this.thisYearPosts = 0,
  });

  factory _$PostStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostStatsImplFromJson(json);

  @override
  final int totalPosts;
  @override
  final int totalLikes;
  @override
  final int totalComments;
  @override
  final int totalShares;
  @override
  @JsonKey()
  final int thisWeekPosts;
  @override
  @JsonKey()
  final int thisMonthPosts;
  @override
  @JsonKey()
  final int thisYearPosts;

  @override
  String toString() {
    return 'PostStats(totalPosts: $totalPosts, totalLikes: $totalLikes, totalComments: $totalComments, totalShares: $totalShares, thisWeekPosts: $thisWeekPosts, thisMonthPosts: $thisMonthPosts, thisYearPosts: $thisYearPosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostStatsImpl &&
            (identical(other.totalPosts, totalPosts) ||
                other.totalPosts == totalPosts) &&
            (identical(other.totalLikes, totalLikes) ||
                other.totalLikes == totalLikes) &&
            (identical(other.totalComments, totalComments) ||
                other.totalComments == totalComments) &&
            (identical(other.totalShares, totalShares) ||
                other.totalShares == totalShares) &&
            (identical(other.thisWeekPosts, thisWeekPosts) ||
                other.thisWeekPosts == thisWeekPosts) &&
            (identical(other.thisMonthPosts, thisMonthPosts) ||
                other.thisMonthPosts == thisMonthPosts) &&
            (identical(other.thisYearPosts, thisYearPosts) ||
                other.thisYearPosts == thisYearPosts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalPosts,
    totalLikes,
    totalComments,
    totalShares,
    thisWeekPosts,
    thisMonthPosts,
    thisYearPosts,
  );

  /// Create a copy of PostStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostStatsImplCopyWith<_$PostStatsImpl> get copyWith =>
      __$$PostStatsImplCopyWithImpl<_$PostStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostStatsImplToJson(this);
  }
}

abstract class _PostStats implements PostStats {
  const factory _PostStats({
    required final int totalPosts,
    required final int totalLikes,
    required final int totalComments,
    required final int totalShares,
    final int thisWeekPosts,
    final int thisMonthPosts,
    final int thisYearPosts,
  }) = _$PostStatsImpl;

  factory _PostStats.fromJson(Map<String, dynamic> json) =
      _$PostStatsImpl.fromJson;

  @override
  int get totalPosts;
  @override
  int get totalLikes;
  @override
  int get totalComments;
  @override
  int get totalShares;
  @override
  int get thisWeekPosts;
  @override
  int get thisMonthPosts;
  @override
  int get thisYearPosts;

  /// Create a copy of PostStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostStatsImplCopyWith<_$PostStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedPost _$FeedPostFromJson(Map<String, dynamic> json) {
  return _FeedPost.fromJson(json);
}

/// @nodoc
mixin _$FeedPost {
  Post get post => throw _privateConstructorUsedError;
  UserPostInfo get user => throw _privateConstructorUsedError;
  List<PostInteraction> get interactions => throw _privateConstructorUsedError;
  bool? get isLiked => throw _privateConstructorUsedError;
  bool? get isBookmarked => throw _privateConstructorUsedError;

  /// Serializes this FeedPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedPostCopyWith<FeedPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedPostCopyWith<$Res> {
  factory $FeedPostCopyWith(FeedPost value, $Res Function(FeedPost) then) =
      _$FeedPostCopyWithImpl<$Res, FeedPost>;
  @useResult
  $Res call({
    Post post,
    UserPostInfo user,
    List<PostInteraction> interactions,
    bool? isLiked,
    bool? isBookmarked,
  });

  $PostCopyWith<$Res> get post;
  $UserPostInfoCopyWith<$Res> get user;
}

/// @nodoc
class _$FeedPostCopyWithImpl<$Res, $Val extends FeedPost>
    implements $FeedPostCopyWith<$Res> {
  _$FeedPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? user = null,
    Object? interactions = null,
    Object? isLiked = freezed,
    Object? isBookmarked = freezed,
  }) {
    return _then(
      _value.copyWith(
            post: null == post
                ? _value.post
                : post // ignore: cast_nullable_to_non_nullable
                      as Post,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserPostInfo,
            interactions: null == interactions
                ? _value.interactions
                : interactions // ignore: cast_nullable_to_non_nullable
                      as List<PostInteraction>,
            isLiked: freezed == isLiked
                ? _value.isLiked
                : isLiked // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isBookmarked: freezed == isBookmarked
                ? _value.isBookmarked
                : isBookmarked // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPostInfoCopyWith<$Res> get user {
    return $UserPostInfoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedPostImplCopyWith<$Res>
    implements $FeedPostCopyWith<$Res> {
  factory _$$FeedPostImplCopyWith(
    _$FeedPostImpl value,
    $Res Function(_$FeedPostImpl) then,
  ) = __$$FeedPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Post post,
    UserPostInfo user,
    List<PostInteraction> interactions,
    bool? isLiked,
    bool? isBookmarked,
  });

  @override
  $PostCopyWith<$Res> get post;
  @override
  $UserPostInfoCopyWith<$Res> get user;
}

/// @nodoc
class __$$FeedPostImplCopyWithImpl<$Res>
    extends _$FeedPostCopyWithImpl<$Res, _$FeedPostImpl>
    implements _$$FeedPostImplCopyWith<$Res> {
  __$$FeedPostImplCopyWithImpl(
    _$FeedPostImpl _value,
    $Res Function(_$FeedPostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? user = null,
    Object? interactions = null,
    Object? isLiked = freezed,
    Object? isBookmarked = freezed,
  }) {
    return _then(
      _$FeedPostImpl(
        post: null == post
            ? _value.post
            : post // ignore: cast_nullable_to_non_nullable
                  as Post,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserPostInfo,
        interactions: null == interactions
            ? _value._interactions
            : interactions // ignore: cast_nullable_to_non_nullable
                  as List<PostInteraction>,
        isLiked: freezed == isLiked
            ? _value.isLiked
            : isLiked // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isBookmarked: freezed == isBookmarked
            ? _value.isBookmarked
            : isBookmarked // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedPostImpl extends _FeedPost {
  const _$FeedPostImpl({
    required this.post,
    required this.user,
    final List<PostInteraction> interactions = const [],
    this.isLiked,
    this.isBookmarked,
  }) : _interactions = interactions,
       super._();

  factory _$FeedPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedPostImplFromJson(json);

  @override
  final Post post;
  @override
  final UserPostInfo user;
  final List<PostInteraction> _interactions;
  @override
  @JsonKey()
  List<PostInteraction> get interactions {
    if (_interactions is EqualUnmodifiableListView) return _interactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interactions);
  }

  @override
  final bool? isLiked;
  @override
  final bool? isBookmarked;

  @override
  String toString() {
    return 'FeedPost(post: $post, user: $user, interactions: $interactions, isLiked: $isLiked, isBookmarked: $isBookmarked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedPostImpl &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(
              other._interactions,
              _interactions,
            ) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    post,
    user,
    const DeepCollectionEquality().hash(_interactions),
    isLiked,
    isBookmarked,
  );

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedPostImplCopyWith<_$FeedPostImpl> get copyWith =>
      __$$FeedPostImplCopyWithImpl<_$FeedPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedPostImplToJson(this);
  }
}

abstract class _FeedPost extends FeedPost {
  const factory _FeedPost({
    required final Post post,
    required final UserPostInfo user,
    final List<PostInteraction> interactions,
    final bool? isLiked,
    final bool? isBookmarked,
  }) = _$FeedPostImpl;
  const _FeedPost._() : super._();

  factory _FeedPost.fromJson(Map<String, dynamic> json) =
      _$FeedPostImpl.fromJson;

  @override
  Post get post;
  @override
  UserPostInfo get user;
  @override
  List<PostInteraction> get interactions;
  @override
  bool? get isLiked;
  @override
  bool? get isBookmarked;

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedPostImplCopyWith<_$FeedPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FileMedia {
  String get id => throw _privateConstructorUsedError;
  dynamic get file =>
      throw _privateConstructorUsedError; // Will be File from dart:io
  MediaType get type => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;

  /// Create a copy of FileMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileMediaCopyWith<FileMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileMediaCopyWith<$Res> {
  factory $FileMediaCopyWith(FileMedia value, $Res Function(FileMedia) then) =
      _$FileMediaCopyWithImpl<$Res, FileMedia>;
  @useResult
  $Res call({
    String id,
    dynamic file,
    MediaType type,
    String? caption,
    int orderIndex,
  });
}

/// @nodoc
class _$FileMediaCopyWithImpl<$Res, $Val extends FileMedia>
    implements $FileMediaCopyWith<$Res> {
  _$FileMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? file = freezed,
    Object? type = null,
    Object? caption = freezed,
    Object? orderIndex = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            file: freezed == file
                ? _value.file
                : file // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as MediaType,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
            orderIndex: null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FileMediaImplCopyWith<$Res>
    implements $FileMediaCopyWith<$Res> {
  factory _$$FileMediaImplCopyWith(
    _$FileMediaImpl value,
    $Res Function(_$FileMediaImpl) then,
  ) = __$$FileMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    dynamic file,
    MediaType type,
    String? caption,
    int orderIndex,
  });
}

/// @nodoc
class __$$FileMediaImplCopyWithImpl<$Res>
    extends _$FileMediaCopyWithImpl<$Res, _$FileMediaImpl>
    implements _$$FileMediaImplCopyWith<$Res> {
  __$$FileMediaImplCopyWithImpl(
    _$FileMediaImpl _value,
    $Res Function(_$FileMediaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FileMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? file = freezed,
    Object? type = null,
    Object? caption = freezed,
    Object? orderIndex = null,
  }) {
    return _then(
      _$FileMediaImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        file: freezed == file
            ? _value.file
            : file // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MediaType,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
        orderIndex: null == orderIndex
            ? _value.orderIndex
            : orderIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$FileMediaImpl extends _FileMedia {
  const _$FileMediaImpl({
    required this.id,
    required this.file,
    required this.type,
    this.caption,
    this.orderIndex = 0,
  }) : super._();

  @override
  final String id;
  @override
  final dynamic file;
  // Will be File from dart:io
  @override
  final MediaType type;
  @override
  final String? caption;
  @override
  @JsonKey()
  final int orderIndex;

  @override
  String toString() {
    return 'FileMedia(id: $id, file: $file, type: $type, caption: $caption, orderIndex: $orderIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileMediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.file, file) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(file),
    type,
    caption,
    orderIndex,
  );

  /// Create a copy of FileMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileMediaImplCopyWith<_$FileMediaImpl> get copyWith =>
      __$$FileMediaImplCopyWithImpl<_$FileMediaImpl>(this, _$identity);
}

abstract class _FileMedia extends FileMedia {
  const factory _FileMedia({
    required final String id,
    required final dynamic file,
    required final MediaType type,
    final String? caption,
    final int orderIndex,
  }) = _$FileMediaImpl;
  const _FileMedia._() : super._();

  @override
  String get id;
  @override
  dynamic get file; // Will be File from dart:io
  @override
  MediaType get type;
  @override
  String? get caption;
  @override
  int get orderIndex;

  /// Create a copy of FileMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileMediaImplCopyWith<_$FileMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
