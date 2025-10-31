import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../models/follow_model.dart';
import '../services/profile_service.dart';
import '../core/errors/app_exception.dart';
import '../core/constants/app_constants.dart';

// Profile state
class ProfileState {
  final User? user;
  final bool isLoading;
  final bool isUpdating;
  final bool isUploadingPhoto;
  final String? error;
  final bool isFollowing;
  final FollowStats? stats;

  const ProfileState({
    this.user,
    this.isLoading = false,
    this.isUpdating = false,
    this.isUploadingPhoto = false,
    this.error,
    this.isFollowing = false,
    this.stats,
  });

  ProfileState copyWith({
    User? user,
    bool? isLoading,
    bool? isUpdating,
    bool? isUploadingPhoto,
    String? error,
    bool? isFollowing,
    FollowStats? stats,
    bool clearError = false,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      isUploadingPhoto: isUploadingPhoto ?? this.isUploadingPhoto,
      error: clearError ? null : (error ?? this.error),
      isFollowing: isFollowing ?? this.isFollowing,
      stats: stats ?? this.stats,
    );
  }

  bool get hasError => error != null;
  bool get hasUser => user != null;
  bool get hasStats => stats != null;
}

// Profile notifier
class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileService _profileService;

  ProfileNotifier(this._profileService) : super(const ProfileState());

  // Load user profile
  Future<void> loadProfile(String userId) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final user = await _profileService.getUserProfile(userId);
      final isFollowing = userId != 'current' ? await _profileService.isFollowing(userId) : false;
      final stats = await _profileService.getUserStats(userId);

      state = state.copyWith(
        user: user,
        isFollowing: isFollowing,
        stats: stats,
        isLoading: false,
      );
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isLoading: false,
      );
    }
  }

  // Update profile
  Future<bool> updateProfile({
    String? username,
    String? displayName,
    String? bio,
    String? website,
    String? location,
  }) async {
    state = state.copyWith(isUpdating: true, clearError: true);

    try {
      final updatedUser = await _profileService.updateProfile(
        username: username,
        displayName: displayName,
        bio: bio,
        website: website,
        location: location,
      );

      state = state.copyWith(
        user: updatedUser,
        isUpdating: false,
      );

      return true;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isUpdating: false,
      );
      return false;
    }
  }

  // Upload profile photo
  Future<bool> uploadProfilePhoto(dynamic imageFile) async {
    state = state.copyWith(isUploadingPhoto: true, clearError: true);

    try {
      final updatedUser = await _profileService.uploadProfilePhoto(imageFile);

      state = state.copyWith(
        user: updatedUser,
        isUploadingPhoto: false,
      );

      return true;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isUploadingPhoto: false,
      );
      return false;
    }
  }

  // Remove profile photo
  Future<bool> removeProfilePhoto() async {
    state = state.copyWith(isUpdating: true, clearError: true);

    try {
      final updatedUser = await _profileService.removeProfilePhoto();

      state = state.copyWith(
        user: updatedUser,
        isUpdating: false,
      );

      return true;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isUpdating: false,
      );
      return false;
    }
  }

  // Follow user
  Future<bool> followUser(String userId) async {
    try {
      final success = await _profileService.followUser(userId);

      if (success && state.user?.id == userId) {
        // Update stats if this is the current user's profile
        final newStats = state.stats?.copyWith(
          followersCount: state.stats!.followersCount + 1,
        );

        state = state.copyWith(
          isFollowing: true,
          stats: newStats,
        );
      } else {
        state = state.copyWith(isFollowing: true);
      }

      return true;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(error: errorMessage);
      return false;
    }
  }

  // Unfollow user
  Future<bool> unfollowUser(String userId) async {
    try {
      final success = await _profileService.unfollowUser(userId);

      if (success && state.user?.id == userId) {
        // Update stats if this is the current user's profile
        final newStats = state.stats?.copyWith(
          followersCount: state.stats!.followersCount > 0
              ? state.stats!.followersCount - 1
              : 0,
        );

        state = state.copyWith(
          isFollowing: false,
          stats: newStats,
        );
      } else {
        state = state.copyWith(isFollowing: false);
      }

      return true;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(error: errorMessage);
      return false;
    }
  }

  // Refresh profile
  Future<void> refreshProfile(String userId) async {
    await loadProfile(userId);
  }

  // Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  // Reset state
  void reset() {
    state = const ProfileState();
  }

  @override
  void dispose() {
    _profileService.dispose();
    super.dispose();
  }
}

// Followers state
class FollowersState {
  final List<User> followers;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final String? error;

  const FollowersState({
    this.followers = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.error,
  });

  FollowersState copyWith({
    List<User>? followers,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    String? error,
    bool clearError = false,
  }) {
    return FollowersState(
      followers: followers ?? this.followers,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      error: clearError ? null : (error ?? this.error),
    );
  }

  bool get hasError => error != null;
  bool get isEmpty => followers.isEmpty && !isLoading;
  bool get isNotEmpty => followers.isNotEmpty;
}

// Followers notifier
class FollowersNotifier extends StateNotifier<FollowersState> {
  final ProfileService _profileService;
  int _currentPage = 0;
  static const int _pageSize = 20;

  FollowersNotifier(this._profileService) : super(const FollowersState());

  // Load followers
  Future<void> loadFollowers(String userId, {bool refresh = false}) async {
    if (refresh) {
      _currentPage = 0;
      state = state.copyWith(
        isLoading: true,
        followers: const [],
        hasMore: true,
        clearError: true,
      );
    } else {
      state = state.copyWith(isLoading: true, clearError: true);
    }

    try {
      final followers = await _profileService.getFollowers(
        userId,
        limit: _pageSize,
        offset: _currentPage * _pageSize,
      );

      final hasMore = followers.length == _pageSize;

      state = state.copyWith(
        followers: refresh ? followers : [...state.followers, ...followers],
        isLoading: false,
        hasMore: hasMore,
      );

      _currentPage++;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isLoading: false,
      );
    }
  }

  // Load more followers
  Future<void> loadMoreFollowers(String userId) async {
    if (state.isLoading || state.isLoadingMore || !state.hasMore) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final followers = await _profileService.getFollowers(
        userId,
        limit: _pageSize,
        offset: _currentPage * _pageSize,
      );

      final hasMore = followers.length == _pageSize;

      state = state.copyWith(
        followers: [...state.followers, ...followers],
        isLoadingMore: false,
        hasMore: hasMore,
      );

      _currentPage++;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isLoadingMore: false,
      );
    }
  }

  // Refresh followers
  Future<void> refreshFollowers(String userId) async {
    await loadFollowers(userId, refresh: true);
  }

  // Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  // Reset state
  void reset() {
    _currentPage = 0;
    state = const FollowersState();
  }
}

// Following state (similar to FollowersState)
class FollowingState {
  final List<User> following;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final String? error;

  const FollowingState({
    this.following = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.error,
  });

  FollowingState copyWith({
    List<User>? following,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    String? error,
    bool clearError = false,
  }) {
    return FollowingState(
      following: following ?? this.following,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      error: clearError ? null : (error ?? this.error),
    );
  }

  bool get hasError => error != null;
  bool get isEmpty => following.isEmpty && !isLoading;
  bool get isNotEmpty => following.isNotEmpty;
}

// Following notifier
class FollowingNotifier extends StateNotifier<FollowingState> {
  final ProfileService _profileService;
  int _currentPage = 0;
  static const int _pageSize = 20;

  FollowingNotifier(this._profileService) : super(const FollowingState());

  // Load following
  Future<void> loadFollowing(String userId, {bool refresh = false}) async {
    if (refresh) {
      _currentPage = 0;
      state = state.copyWith(
        isLoading: true,
        following: const [],
        hasMore: true,
        clearError: true,
      );
    } else {
      state = state.copyWith(isLoading: true, clearError: true);
    }

    try {
      final following = await _profileService.getFollowing(
        userId,
        limit: _pageSize,
        offset: _currentPage * _pageSize,
      );

      final hasMore = following.length == _pageSize;

      state = state.copyWith(
        following: refresh ? following : [...state.following, ...following],
        isLoading: false,
        hasMore: hasMore,
      );

      _currentPage++;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isLoading: false,
      );
    }
  }

  // Load more following
  Future<void> loadMoreFollowing(String userId) async {
    if (state.isLoading || state.isLoadingMore || !state.hasMore) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final following = await _profileService.getFollowing(
        userId,
        limit: _pageSize,
        offset: _currentPage * _pageSize,
      );

      final hasMore = following.length == _pageSize;

      state = state.copyWith(
        following: [...state.following, ...following],
        isLoadingMore: false,
        hasMore: hasMore,
      );

      _currentPage++;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isLoadingMore: false,
      );
    }
  }

  // Refresh following
  Future<void> refreshFollowing(String userId) async {
    await loadFollowing(userId, refresh: true);
  }

  // Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  // Reset state
  void reset() {
    _currentPage = 0;
    state = const FollowingState();
  }
}

// Search users state
class SearchUsersState {
  final List<User> users;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final String? error;
  final String query;

  const SearchUsersState({
    this.users = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.error,
    this.query = '',
  });

  SearchUsersState copyWith({
    List<User>? users,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    String? error,
    String? query,
    bool clearError = false,
  }) {
    return SearchUsersState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      error: clearError ? null : (error ?? this.error),
      query: query ?? this.query,
    );
  }

  bool get hasError => error != null;
  bool get isEmpty => users.isEmpty && !isLoading;
  bool get isNotEmpty => users.isNotEmpty;
  bool get hasQuery => query.isNotEmpty;
}

// Search users notifier
class SearchUsersNotifier extends StateNotifier<SearchUsersState> {
  final ProfileService _profileService;
  int _currentPage = 0;
  static const int _pageSize = 20;

  SearchUsersNotifier(this._profileService) : super(const SearchUsersState());

  // Search users
  Future<void> searchUsers(String query, {bool refresh = false}) async {
    if (query.trim().isEmpty) {
      state = const SearchUsersState();
      return;
    }

    if (refresh || state.query != query) {
      _currentPage = 0;
      state = state.copyWith(
        isLoading: true,
        users: const [],
        hasMore: true,
        query: query,
        clearError: true,
      );
    } else {
      state = state.copyWith(isLoading: true, clearError: true);
    }

    try {
      final users = await _profileService.searchUsers(
        query,
        limit: _pageSize,
        offset: _currentPage * _pageSize,
      );

      final hasMore = users.length == _pageSize;

      state = state.copyWith(
        users: refresh || state.query != query ? users : [...state.users, ...users],
        isLoading: false,
        hasMore: hasMore,
      );

      _currentPage++;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isLoading: false,
      );
    }
  }

  // Load more users
  Future<void> loadMoreUsers() async {
    if (state.isLoading || state.isLoadingMore || !state.hasMore || state.query.isEmpty) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final users = await _profileService.searchUsers(
        state.query,
        limit: _pageSize,
        offset: _currentPage * _pageSize,
      );

      final hasMore = users.length == _pageSize;

      state = state.copyWith(
        users: [...state.users, ...users],
        isLoadingMore: false,
        hasMore: hasMore,
      );

      _currentPage++;
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        error: errorMessage,
        isLoadingMore: false,
      );
    }
  }

  // Clear search
  void clearSearch() {
    _currentPage = 0;
    state = const SearchUsersState();
  }

  // Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}

// Providers
final profileServiceProvider = Provider<ProfileService>((ref) {
  return ProfileService();
});

// Profile provider family - for different user profiles
final profileProviderFamily = StateNotifierProvider.family<ProfileNotifier, ProfileState, String>((ref, userId) {
  return ProfileNotifier(ref.watch(profileServiceProvider));
});

// Current user profile provider
final currentUserProfileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(ref.watch(profileServiceProvider));
});

// Followers provider family
final followersProviderFamily = StateNotifierProvider.family<FollowersNotifier, FollowersState, String>((ref, userId) {
  return FollowersNotifier(ref.watch(profileServiceProvider));
});

// Following provider family
final followingProviderFamily = StateNotifierProvider.family<FollowingNotifier, FollowingState, String>((ref, userId) {
  return FollowingNotifier(ref.watch(profileServiceProvider));
});

// Search users provider
final searchUsersProvider = StateNotifierProvider<SearchUsersNotifier, SearchUsersState>((ref) {
  return SearchUsersNotifier(ref.watch(profileServiceProvider));
});

// Convenience selectors
final profileUserProvider = Provider.family<User?, String>((ref, userId) {
  return ref.watch(profileProviderFamily(userId)).user;
});

final profileStatsProvider = Provider.family<FollowStats?, String>((ref, userId) {
  return ref.watch(profileProviderFamily(userId)).stats;
});

final profileIsFollowingProvider = Provider.family<bool, String>((ref, userId) {
  return ref.watch(profileProviderFamily(userId)).isFollowing;
});