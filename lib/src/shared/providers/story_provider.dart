import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import '../models/story_model.dart';
import '../models/user_model.dart';
import '../../services/story_service.dart';
import '../../services/supabase_service.dart';
import 'auth_provider.dart';

// Stories State
class StoriesState extends Equatable {
  final List<StoryBundle> storyBundles;
  final List<Story> userStories;
  final bool isLoading;
  final bool hasError;
  final String? error;
  final DateTime? lastRefreshAt;

  const StoriesState({
    this.storyBundles = const [],
    this.userStories = const [],
    this.isLoading = false,
    this.hasError = false,
    this.error,
    this.lastRefreshAt,
  });

  bool get isEmpty => storyBundles.isEmpty && userStories.isEmpty && !isLoading;
  bool get hasActiveStories => storyBundles.isNotEmpty || userStories.isNotEmpty;
  int get totalActiveStories => storyBundles.fold(0, (sum, bundle) => sum + bundle.stories.length) + userStories.length;

  StoriesState copyWith({
    List<StoryBundle>? storyBundles,
    List<Story>? userStories,
    bool? isLoading,
    bool? hasError,
    String? error,
    DateTime? lastRefreshAt,
  }) {
    return StoriesState(
      storyBundles: storyBundles ?? this.storyBundles,
      userStories: userStories ?? this.userStories,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      lastRefreshAt: lastRefreshAt ?? this.lastRefreshAt,
    );
  }

  @override
  List<Object?> get props => [
        storyBundles,
        userStories,
        isLoading,
        hasError,
        error,
        lastRefreshAt,
      ];
}

// Stories Notifier
class StoriesNotifier extends StateNotifier<StoriesState> {
  final StoryService _storyService;
  final Ref _ref;

  StoriesNotifier(this._storyService, this._ref) : super(const StoriesState());

  Future<void> loadStories() async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) return;

    state = state.copyWith(
      isLoading: true,
      hasError: false,
      error: null,
    );

    try {
      // Load following stories and user stories in parallel
      final followingStoriesFuture = _storyService.getFollowingStories(currentUser.id);
      final userStoriesFuture = _storyService.getUserStories(currentUser.id);

      final followingStories = await followingStoriesFuture;
      final userStories = await userStoriesFuture;

      state = state.copyWith(
        storyBundles: followingStories,
        userStories: userStories,
        isLoading: false,
        lastRefreshAt: DateTime.now(),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      );
    }
  }

  Future<void> refreshStories() async {
    await loadStories();
  }

  void addStory(Story story) {
    // Update user stories
    final updatedUserStories = [story, ...state.userStories];

    // Update or create story bundle
    final updatedBundles = <StoryBundle>[];
    bool bundleUpdated = false;

    for (final bundle in state.storyBundles) {
      if (bundle.user.id == story.userId) {
        final updatedStories = [story, ...bundle.stories];
        updatedBundles.add(bundle.copyWith(
          stories: updatedStories,
          user: bundle.user.copyWith(
            storiesCount: updatedStories.length,
            lastStoryAt: story.createdAt,
          ),
        ));
        bundleUpdated = true;
      } else {
        updatedBundles.add(bundle);
      }
    }

    // Add new bundle if story is from followed user and doesn't exist
    if (!bundleUpdated && story.user != null) {
      updatedBundles.insert(0, StoryBundle(
        user: story.user!,
        stories: [story],
      ));
    }

    // Sort bundles by most recent
    updatedBundles.sort((a, b) => b.stories.first.createdAt.compareTo(a.stories.first.createdAt));

    state = state.copyWith(
      userStories: updatedUserStories,
      storyBundles: updatedBundles,
    );
  }

  void removeStory(String storyId) {
    // Remove from user stories
    final updatedUserStories = state.userStories
        .where((story) => story.id != storyId)
        .toList();

    // Remove from story bundles
    final updatedBundles = <StoryBundle>[];
    for (final bundle in state.storyBundles) {
      final updatedStories = bundle.stories
          .where((story) => story.id != storyId)
          .toList();

      if (updatedStories.isNotEmpty) {
        updatedBundles.add(bundle.copyWith(
          stories: updatedStories,
          user: bundle.user.copyWith(storiesCount: updatedStories.length),
        ));
      }
    }

    state = state.copyWith(
      userStories: updatedUserStories,
      storyBundles: updatedBundles,
    );
  }

  void markStoryAsViewed(String storyId) {
    // Update user stories
    final updatedUserStories = state.userStories.map((story) {
      if (story.id == storyId) {
        return story.copyWith(
          isViewed: true,
          viewedAt: DateTime.now(),
        );
      }
      return story;
    }).toList();

    // Update story bundles
    final updatedBundles = state.storyBundles.map((bundle) {
      final updatedStories = bundle.stories.map((story) {
        if (story.id == storyId) {
          return story.copyWith(
            isViewed: true,
            viewedAt: DateTime.now(),
          );
        }
        return story;
      }).toList();

      return bundle.copyWith(stories: updatedStories);
    }).toList();

    state = state.copyWith(
      userStories: updatedUserStories,
      storyBundles: updatedBundles,
    );
  }
}

// Story Creation State
class StoryCreationState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final String? error;
  final Story? createdStory;

  const StoryCreationState({
    this.isLoading = false,
    this.hasError = false,
    this.error,
    this.createdStory,
  });

  StoryCreationState copyWith({
    bool? isLoading,
    bool? hasError,
    String? error,
    Story? createdStory,
  }) {
    return StoryCreationState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      createdStory: createdStory ?? this.createdStory,
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError, error, createdStory];
}

// Story Creation Notifier
class StoryCreationNotifier extends StateNotifier<StoryCreationState> {
  final StoryService _storyService;
  final Ref _ref;

  StoryCreationNotifier(this._storyService, this._ref) : super(const StoryCreationState());

  Future<Story?> createStory(CreateStoryRequest request) async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    state = state.copyWith(
      isLoading: true,
      hasError: false,
      error: null,
    );

    try {
      final story = await _storyService.createStory(
        userId: currentUser.id,
        mediaFile: request.media,
        mediaType: request.mediaType,
        caption: request.caption,
        location: request.location,
        mentions: request.mentions,
        hashtags: request.hashtags,
      );

      state = state.copyWith(
        isLoading: false,
        createdStory: story,
      );

      // Add to stories state
      _ref.read(storiesProvider.notifier).addStory(story);

      return story;
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
    state = const StoryCreationState();
  }
}

// Story Viewer State
class StoryViewerState extends Equatable {
  final StoryBundle? currentBundle;
  final int currentStoryIndex;
  final bool isLoading;
  final bool hasError;
  final String? error;
  final List<StoryReply> replies;
  final bool isLoadingReplies;
  final Map<String, List<StoryReaction>> reactions;

  const StoryViewerState({
    this.currentBundle,
    this.currentStoryIndex = 0,
    this.isLoading = false,
    this.hasError = false,
    this.error,
    this.replies = const [],
    this.isLoadingReplies = false,
    this.reactions = const {},
  });

  Story? get currentStory => currentBundle?.stories.isNotEmpty == true
      ? currentBundle!.stories[currentStoryIndex]
      : null;

  bool get hasNextStory => currentBundle != null &&
      currentStoryIndex < currentBundle!.stories.length - 1;

  bool get hasPreviousStory => currentStoryIndex > 0;

  bool get hasNextBundle => currentBundle != null;

  StoryViewerState copyWith({
    StoryBundle? currentBundle,
    int? currentStoryIndex,
    bool? isLoading,
    bool? hasError,
    String? error,
    List<StoryReply>? replies,
    bool? isLoadingReplies,
    Map<String, List<StoryReaction>>? reactions,
  }) {
    return StoryViewerState(
      currentBundle: currentBundle ?? this.currentBundle,
      currentStoryIndex: currentStoryIndex ?? this.currentStoryIndex,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      replies: replies ?? this.replies,
      isLoadingReplies: isLoadingReplies ?? this.isLoadingReplies,
      reactions: reactions ?? this.reactions,
    );
  }

  @override
  List<Object?> get props => [
        currentBundle,
        currentStoryIndex,
        isLoading,
        hasError,
        error,
        replies,
        isLoadingReplies,
        reactions,
      ];
}

// Story Viewer Notifier
class StoryViewerNotifier extends StateNotifier<StoryViewerState> {
  final StoryService _storyService;
  final Ref _ref;

  StoryViewerNotifier(this._storyService, this._ref) : super(const StoryViewerState());

  void openStoryBundle(StoryBundle bundle, [int startIndex = 0]) {
    state = state.copyWith(
      currentBundle: bundle,
      currentStoryIndex: startIndex,
      isLoading: false,
      hasError: false,
      error: null,
      replies: [],
      reactions: {},
    );

    // Load replies for current story
    _loadReplies();
    _markStoryAsViewed();
  }

  void nextStory() {
    if (state.hasNextStory) {
      state = state.copyWith(currentStoryIndex: state.currentStoryIndex + 1);
      _loadReplies();
      _markStoryAsViewed();
    } else if (state.hasNextBundle) {
      // Move to next bundle
      final currentIndex = _getCurrentBundleIndex();
      if (currentIndex != -1 && currentIndex < _ref.read(storiesProvider).storyBundles.length - 1) {
        final nextBundle = _ref.read(storiesProvider).storyBundles[currentIndex + 1];
        openStoryBundle(nextBundle, 0);
      }
    }
  }

  void previousStory() {
    if (state.hasPreviousStory) {
      state = state.copyWith(currentStoryIndex: state.currentStoryIndex - 1);
      _loadReplies();
      _markStoryAsViewed();
    } else {
      // Move to previous bundle
      final currentIndex = _getCurrentBundleIndex();
      if (currentIndex > 0) {
        final previousBundle = _ref.read(storiesProvider).storyBundles[currentIndex - 1];
        openStoryBundle(previousBundle, previousBundle.stories.length - 1);
      }
    }
  }

  void goToStory(int index) {
    if (state.currentBundle != null &&
        index >= 0 &&
        index < state.currentBundle!.stories.length) {
      state = state.copyWith(currentStoryIndex: index);
      _loadReplies();
      _markStoryAsViewed();
    }
  }

  void closeStory() {
    state = state.copyWith(
      currentBundle: null,
      currentStoryIndex: 0,
      replies: [],
      reactions: {},
    );
  }

  Future<StoryReply?> addReply(String content) async {
    final story = state.currentStory;
    if (story == null) return null;

    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    try {
      final reply = await _storyService.replyToStory(
        storyId: story.id,
        userId: currentUser.id,
        content: content,
      );

      final updatedReplies = [reply, ...state.replies];
      state = state.copyWith(replies: updatedReplies);

      // Update story reply count
      _updateStoryReplyCount(story.id, state.replies.length);

      return reply;
    } catch (e) {
      return null;
    }
  }

  Future<StoryReaction?> addReaction(StoryReactionType type) async {
    final story = state.currentStory;
    if (story == null) return null;

    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    try {
      final reaction = await _storyService.addStoryReaction(
        storyId: story.id,
        userId: currentUser.id,
        type: type,
      );

      // Update reactions map
      final updatedReactions = Map<String, List<StoryReaction>>.from(state.reactions);
      if (updatedReactions.containsKey(story.id)) {
        // Remove existing reaction from same user
        updatedReactions[story.id] = updatedReactions[story.id]!
            .where((r) => r.userId != currentUser.id)
            .toList();
        // Add new reaction
        updatedReactions[story.id]!.add(reaction);
      } else {
        updatedReactions[story.id] = [reaction];
      }

      state = state.copyWith(reactions: updatedReactions);

      // Update story reaction count
      _updateStoryReactionCount(story.id, updatedReactions[story.id]!.length);

      return reaction;
    } catch (e) {
      return null;
    }
  }

  void _loadReplies() {
    final story = state.currentStory;
    if (story == null) return;

    state = state.copyWith(isLoadingReplies: true);

    _storyService.getStoryReplies(story.id).then((replies) {
      state = state.copyWith(
        replies: replies,
        isLoadingReplies: false,
      );
    }).catchError((e) {
      state = state.copyWith(isLoadingReplies: false);
    });
  }

  void _markStoryAsViewed() {
    final story = state.currentStory;
    if (story == null || story.isViewed) return;

    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) return;

    _storyService.viewStory(story.id, currentUser.id).then((_) {
      _ref.read(storiesProvider.notifier).markStoryAsViewed(story.id);
    });
  }

  int _getCurrentBundleIndex() {
    if (state.currentBundle == null) return -1;

    final bundles = _ref.read(storiesProvider).storyBundles;
    for (int i = 0; i < bundles.length; i++) {
      if (bundles[i].user.id == state.currentBundle!.user.id) {
        return i;
      }
    }
    return -1;
  }

  void _updateStoryReplyCount(String storyId, int count) {
    // Update in stories provider
    final storiesState = _ref.read(storiesProvider);

    // Update user stories
    final updatedUserStories = storiesState.userStories.map((story) {
      if (story.id == storyId) {
        return story.copyWith(repliesCount: count);
      }
      return story;
    }).toList();

    // Update story bundles
    final updatedBundles = storiesState.storyBundles.map((bundle) {
      final updatedStories = bundle.stories.map((story) {
        if (story.id == storyId) {
          return story.copyWith(repliesCount: count);
        }
        return story;
      }).toList();

      return bundle.copyWith(stories: updatedStories);
    }).toList();

    _ref.read(storiesProvider.notifier).state = storiesState.copyWith(
      userStories: updatedUserStories,
      storyBundles: updatedBundles,
    );
  }

  void _updateStoryReactionCount(String storyId, int count) {
    // Similar to reply count update
    final storiesState = _ref.read(storiesProvider);

    final updatedUserStories = storiesState.userStories.map((story) {
      if (story.id == storyId) {
        return story.copyWith(reactionsCount: count);
      }
      return story;
    }).toList();

    final updatedBundles = storiesState.storyBundles.map((bundle) {
      final updatedStories = bundle.stories.map((story) {
        if (story.id == storyId) {
          return story.copyWith(reactionsCount: count);
        }
        return story;
      }).toList();

      return bundle.copyWith(stories: updatedStories);
    }).toList();

    _ref.read(storiesProvider.notifier).state = storiesState.copyWith(
      userStories: updatedUserStories,
      storyBundles: updatedBundles,
    );
  }

  void reset() {
    state = const StoryViewerState();
  }
}

// Story Highlights State
class StoryHighlightsState extends Equatable {
  final List<StoryHighlight> highlights;
  final bool isLoading;
  final bool hasError;
  final String? error;

  const StoryHighlightsState({
    this.highlights = const [],
    this.isLoading = false,
    this.hasError = false,
    this.error,
  });

  bool get isEmpty => highlights.isEmpty && !isLoading;
  bool get hasHighlights => highlights.isNotEmpty;

  StoryHighlightsState copyWith({
    List<StoryHighlight>? highlights,
    bool? isLoading,
    bool? hasError,
    String? error,
  }) {
    return StoryHighlightsState(
      highlights: highlights ?? this.highlights,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [highlights, isLoading, hasError, error];
}

// Story Highlights Notifier
class StoryHighlightsNotifier extends StateNotifier<StoryHighlightsState> {
  final StoryService _storyService;
  final Ref _ref;

  StoryHighlightsNotifier(this._storyService, this._ref) : super(const StoryHighlightsState());

  Future<void> loadHighlights(String userId) async {
    state = state.copyWith(
      isLoading: true,
      hasError: false,
      error: null,
    );

    try {
      final highlights = await _storyService.getUserStoryHighlights(userId);
      state = state.copyWith(
        highlights: highlights,
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

  Future<StoryHighlight?> createHighlight({
    required String title,
    required List<String> storyIds,
    String? coverImageUrl,
  }) async {
    final currentUser = _ref.read(currentUserProvider);
    if (currentUser == null) throw Exception('User not authenticated');

    try {
      final highlight = await _storyService.createStoryHighlight(
        userId: currentUser.id,
        title: title,
        storyIds: storyIds,
        coverImageUrl: coverImageUrl,
      );

      final updatedHighlights = [highlight, ...state.highlights];
      state = state.copyWith(highlights: updatedHighlights);

      return highlight;
    } catch (e) {
      return null;
    }
  }

  void reset() {
    state = const StoryHighlightsState();
  }
}

// Providers
final storyServiceProvider = Provider<StoryService>((ref) {
  return StoryService(ref.watch(supabaseServiceProvider));
});

final storiesProvider = StateNotifierProvider<StoriesNotifier, StoriesState>((ref) {
  final storyService = ref.watch(storyServiceProvider);
  return StoriesNotifier(storyService, ref);
});

final storyCreationProvider = StateNotifierProvider<StoryCreationNotifier, StoryCreationState>((ref) {
  final storyService = ref.watch(storyServiceProvider);
  return StoryCreationNotifier(storyService, ref);
});

final storyViewerProvider = StateNotifierProvider<StoryViewerNotifier, StoryViewerState>((ref) {
  final storyService = ref.watch(storyServiceProvider);
  return StoryViewerNotifier(storyService, ref);
});

final storyHighlightsProvider = StateNotifierProvider<StoryHighlightsNotifier, StoryHighlightsState>((ref) {
  final storyService = ref.watch(storyServiceProvider);
  return StoryHighlightsNotifier(storyService, ref);
});

// Story Stats Provider
final storyStatsProvider = FutureProvider.family<StoryStats, String>((ref, userId) async {
  final storyService = ref.watch(storyServiceProvider);
  return await storyService.getUserStoryStats(userId);
});