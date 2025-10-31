import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';
import '../../services/post_service.dart';
import '../../services/supabase_service.dart';
import 'auth_provider.dart';

// Feed State
class FeedState extends Equatable {
  final List<FeedPost> posts;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasError;
  final String? error;
  final bool hasMore;
  final String? lastPostId;

  const FeedState({
    this.posts = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasError = false,
    this.error,
    this.hasMore = true,
    this.lastPostId,
  });

  bool get isEmpty => posts.isEmpty && !isLoading;
  bool get isNotEmpty => posts.isNotEmpty;

  FeedState copyWith({
    List<FeedPost>? posts,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasError,
    String? error,
    bool? hasMore,
    String? lastPostId,
  }) {
    return FeedState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      hasMore: hasMore ?? this.hasMore,
      lastPostId: lastPostId ?? this.lastPostId,
    );
  }

  @override
  List<Object?> get props => [
        posts,
        isLoading,
        isLoadingMore,
        hasError,
        error,
        hasMore,
        lastPostId,
      ];
}

// Feed Notifier
class FeedNotifier extends StateNotifier<FeedState> {
  final PostService _postService;
  final Ref _ref;

  FeedNotifier(this._postService, this._ref) : super(const FeedState());

  Future<void> loadFeed() async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) return;

    state = state.copyWith(
      isLoading: true,
      hasError: false,
      error: null,
    );

    try {
      final posts = await _postService.getFeedPosts(userId: currentUser.id);

      state = state.copyWith(
        posts: posts,
        isLoading: false,
        hasMore: posts.length >= 20, // Assuming limit is 20
        lastPostId: posts.isNotEmpty ? posts.last.post.id : null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      );
    }
  }

  Future<void> loadMoreFeed() async {
    if (state.isLoadingMore || !state.hasMore) return;

    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final morePosts = await _postService.getFeedPosts(
        userId: currentUser.id,
        lastPostId: state.lastPostId,
      );

      state = state.copyWith(
        posts: [...state.posts, ...morePosts],
        isLoadingMore: false,
        hasMore: morePosts.length >= 20,
        lastPostId: morePosts.isNotEmpty ? morePosts.last.post.id : state.lastPostId,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false);
    }
  }

  Future<void> refreshFeed() async {
    state = state.copyWith(
      posts: [],
      lastPostId: null,
      hasMore: true,
    );
    await loadFeed();
  }

  void addPostToFeed(FeedPost feedPost) {
    state = state.copyWith(
      posts: [feedPost, ...state.posts],
    );
  }

  void updatePostInFeed(String postId, Post updatedPost) {
    final updatedPosts = state.posts.map((feedPost) {
      if (feedPost.post.id == postId) {
        return FeedPost(
          post: updatedPost,
          user: feedPost.user,
          interactions: feedPost.interactions,
          isLiked: feedPost.isLiked,
          isBookmarked: feedPost.isBookmarked,
        );
      }
      return feedPost;
    }).toList();

    state = state.copyWith(posts: updatedPosts);
  }

  void removePostFromFeed(String postId) {
    final updatedPosts = state.posts.where((feedPost) => feedPost.post.id != postId).toList();
    state = state.copyWith(posts: updatedPosts);
  }

  void updatePostInteraction(String postId, {bool? isLiked, bool? isBookmarked}) {
    final updatedPosts = state.posts.map((feedPost) {
      if (feedPost.post.id == postId) {
        return feedPost.copyWith(
          isLiked: isLiked ?? feedPost.isLiked,
          isBookmarked: isBookmarked ?? feedPost.isBookmarked,
        );
      }
      return feedPost;
    }).toList();

    state = state.copyWith(posts: updatedPosts);
  }
}

// Post Creation State
class PostCreationState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final String? error;
  final Post? createdPost;

  const PostCreationState({
    this.isLoading = false,
    this.hasError = false,
    this.error,
    this.createdPost,
  });

  PostCreationState copyWith({
    bool? isLoading,
    bool? hasError,
    String? error,
    Post? createdPost,
  }) {
    return PostCreationState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      createdPost: createdPost ?? this.createdPost,
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError, error, createdPost];
}

// Post Creation Notifier
class PostCreationNotifier extends StateNotifier<PostCreationState> {
  final PostService _postService;
  final Ref _ref;

  PostCreationNotifier(this._postService, this._ref) : super(const PostCreationState());

  Future<Post?> createPost(CreatePostRequest request) async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    state = state.copyWith(
      isLoading: true,
      hasError: false,
      error: null,
    );

    try {
      final post = await _postService.createPost(
        userId: currentUser.id,
        content: request.content,
        media: request.media,
        visibility: request.visibility,
        location: request.location,
        tags: request.tags,
      );

      state = state.copyWith(
        isLoading: false,
        createdPost: post,
      );

      return post;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      );
      return null;
    }
  }

  void reset() {
    state = const PostCreationState();
  }
}

// Post Interaction State
class PostInteractionState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final String? error;
  final bool? isLiked;
  final bool? isBookmarked;
  final int? updatedLikesCount;

  const PostInteractionState({
    this.isLoading = false,
    this.hasError = false,
    this.error,
    this.isLiked,
    this.isBookmarked,
    this.updatedLikesCount,
  });

  PostInteractionState copyWith({
    bool? isLoading,
    bool? hasError,
    String? error,
    bool? isLiked,
    bool? isBookmarked,
    int? updatedLikesCount,
  }) {
    return PostInteractionState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      updatedLikesCount: updatedLikesCount ?? this.updatedLikesCount,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        hasError,
        error,
        isLiked,
        isBookmarked,
        updatedLikesCount,
      ];
}

// Post Interaction Notifier
class PostInteractionNotifier extends StateNotifier<PostInteractionState> {
  final PostService _postService;
  final Ref _ref;

  PostInteractionNotifier(this._postService, this._ref) : super(const PostInteractionState());

  Future<bool> toggleLike(String postId) async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    state = state.copyWith(isLoading: true);

    try {
      final isLiked = await _postService.togglePostLike(
        postId: postId,
        userId: currentUser.id,
      );

      state = state.copyWith(
        isLoading: false,
        isLiked: isLiked,
      );

      return isLiked;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      );
      return false;
    }
  }

  Future<bool> toggleBookmark(String postId) async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    state = state.copyWith(isLoading: true);

    try {
      final isBookmarked = await _postService.togglePostBookmark(
        postId: postId,
        userId: currentUser.id,
      );

      state = state.copyWith(
        isLoading: false,
        isBookmarked: isBookmarked,
      );

      return isBookmarked;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      );
      return false;
    }
  }

  Future<PostInteraction?> addComment(String postId, String comment) async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    state = state.copyWith(isLoading: true);

    try {
      final commentInteraction = await _postService.addComment(
        postId: postId,
        userId: currentUser.id,
        comment: comment,
      );

      state = state.copyWith(isLoading: false);
      return commentInteraction;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      );
      return null;
    }
  }

  Future<bool> sharePost(String postId) async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    state = state.copyWith(isLoading: true);

    try {
      await _postService.sharePost(
        postId: postId,
        userId: currentUser.id,
      );

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      );
      return false;
    }
  }

  void reset() {
    state = const PostInteractionState();
  }
}

// Post Detail State
class PostDetailState extends Equatable {
  final Post? post;
  final List<PostInteraction> comments;
  final bool isLoading;
  final bool isLoadingComments;
  final bool hasError;
  final String? error;
  final bool hasMoreComments;
  final String? lastCommentId;

  const PostDetailState({
    this.post,
    this.comments = const [],
    this.isLoading = false,
    this.isLoadingComments = false,
    this.hasError = false,
    this.error,
    this.hasMoreComments = true,
    this.lastCommentId,
  });

  bool get isEmpty => post == null && !isLoading;
  bool get isNotEmpty => post != null;
  bool get hasComments => comments.isNotEmpty;

  PostDetailState copyWith({
    Post? post,
    List<PostInteraction>? comments,
    bool? isLoading,
    bool? isLoadingComments,
    bool? hasError,
    String? error,
    bool? hasMoreComments,
    String? lastCommentId,
  }) {
    return PostDetailState(
      post: post ?? this.post,
      comments: comments ?? this.comments,
      isLoading: isLoading ?? this.isLoading,
      isLoadingComments: isLoadingComments ?? this.isLoadingComments,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      hasMoreComments: hasMoreComments ?? this.hasMoreComments,
      lastCommentId: lastCommentId ?? this.lastCommentId,
    );
  }

  @override
  List<Object?> get props => [
        post,
        comments,
        isLoading,
        isLoadingComments,
        hasError,
        error,
        hasMoreComments,
        lastCommentId,
      ];
}

// Post Detail Notifier
class PostDetailNotifier extends StateNotifier<PostDetailState> {
  final PostService _postService;
  final Ref _ref;

  PostDetailNotifier(this._postService, this._ref) : super(const PostDetailState());

  Future<void> loadPost(String postId) async {
    state = state.copyWith(
      isLoading: true,
      hasError: false,
      error: null,
    );

    try {
      final post = await _postService.getPostById(postId);
      state = state.copyWith(
        post: post,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      );
    }
  }

  Future<void> loadComments(String postId) async {
    if (state.isLoadingComments || !state.hasMoreComments) return;

    state = state.copyWith(isLoadingComments: true);

    try {
      final comments = await _postService.getPostComments(
        postId: postId,
        lastCommentId: state.lastCommentId,
      );

      state = state.copyWith(
        comments: [...state.comments, ...comments],
        isLoadingComments: false,
        hasMoreComments: comments.length >= 20,
        lastCommentId: comments.isNotEmpty ? comments.last.id : state.lastCommentId,
      );
    } catch (e) {
      state = state.copyWith(isLoadingComments: false);
    }
  }

  Future<PostInteraction?> addComment(String postId, String comment) async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    try {
      final commentInteraction = await _postService.addComment(
        postId: postId,
        userId: currentUser.id,
        comment: comment,
      );

      state = state.copyWith(
        comments: [commentInteraction, ...state.comments],
      );

      return commentInteraction;
    } catch (e) {
      return null;
    }
  }

  void updatePost(Post updatedPost) {
    state = state.copyWith(post: updatedPost);
  }

  void reset() {
    state = const PostDetailState();
  }
}

// Providers
final postServiceProvider = Provider<PostService>((ref) {
  return PostService(ref.watch(supabaseServiceProvider));
});

final feedProvider = StateNotifierProvider<FeedNotifier, FeedState>((ref) {
  final postService = ref.watch(postServiceProvider);
  return FeedNotifier(postService, ref);
});

final postCreationProvider = StateNotifierProvider<PostCreationNotifier, PostCreationState>((ref) {
  final postService = ref.watch(postServiceProvider);
  return PostCreationNotifier(postService, ref);
});

final postInteractionProvider = StateNotifierProviderFamily<PostInteractionNotifier, PostInteractionState, String>((ref, postId) {
  final postService = ref.watch(postServiceProvider);
  return PostInteractionNotifier(postService, ref);
});

final postDetailProvider = StateNotifierProviderFamily<PostDetailNotifier, PostDetailState, String>((ref, postId) {
  final postService = ref.watch(postServiceProvider);
  return PostDetailNotifier(postService, ref);
});

// Post Stats Provider
final postStatsProvider = FutureProvider.family<PostStats, String>((ref, userId) async {
  final postService = ref.watch(postServiceProvider);
  return await postService.getUserPostStats(userId);
});

// User Posts Provider
final userPostsProvider = FutureProvider.family<List<Post>, String>((ref, userId) async {
  final postService = ref.watch(postServiceProvider);
  return await postService.getUserPosts(userId: userId);
});