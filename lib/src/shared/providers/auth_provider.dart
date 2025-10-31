import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';
import '../core/errors/app_exception.dart';
import '../core/constants/app_constants.dart';

// Authentication state
enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

class AuthState {
  final AuthStatus status;
  final User? user;
  final String? error;
  final bool isLoading;
  final bool isRefreshing;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.error,
    this.isLoading = false,
    this.isRefreshing = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? error,
    bool? isLoading,
    bool? isRefreshing,
    bool clearError = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: clearError ? null : (error ?? this.error),
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;
  bool get isUnauthenticated => status == AuthStatus.unauthenticated;
  bool get hasError => status == AuthStatus.error && error != null;
  bool get isInitial => status == AuthStatus.initial;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthState &&
        other.status == status &&
        other.user == user &&
        other.error == error &&
        other.isLoading == isLoading &&
        other.isRefreshing == isRefreshing;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        user.hashCode ^
        error.hashCode ^
        isLoading.hashCode ^
        isRefreshing.hashCode;
  }

  @override
  String toString() {
    return 'AuthState(status: $status, user: $user, error: $error, isLoading: $isLoading, isRefreshing: $isRefreshing)';
  }
}

// Auth notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(const AuthState()) {
    _initializeAuth();
  }

  // Initialize authentication state
  Future<void> _initializeAuth() async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await _authService.initializeCurrentUser();

      _authService.authStateChanges.listen((user) {
        if (user != null) {
          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: user,
            isLoading: false,
            clearError: true,
          );
        } else {
          state = state.copyWith(
            status: AuthStatus.unauthenticated,
            user: null,
            isLoading: false,
            clearError: true,
          );
        }
      });

      // Check if we already have a user after initialization
      final currentUser = _authService.currentUser;
      if (currentUser != null) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: currentUser,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          isLoading: false,
        );
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        status: AuthStatus.error,
        error: errorMessage,
        isLoading: false,
      );
    }
  }

  // Sign up with email and password
  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    required String confirmPassword,
    String? username,
    String? displayName,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = await _authService.signUpWithEmail(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        username: username,
        displayName: displayName,
      );

      if (result.success && result.user != null) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
          isLoading: false,
          clearError: true,
        );
        return true;
      } else {
        state = state.copyWith(
          status: AuthStatus.error,
          error: result.error ?? AppConstants.genericErrorMessage,
          isLoading: false,
        );
        return false;
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        status: AuthStatus.error,
        error: errorMessage,
        isLoading: false,
      );
      return false;
    }
  }

  // Sign in with email and password
  Future<bool> signInWithEmail({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = await _authService.signInWithEmail(
        email: email,
        password: password,
      );

      if (result.success && result.user != null) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
          isLoading: false,
          clearError: true,
        );
        return true;
      } else {
        state = state.copyWith(
          status: AuthStatus.error,
          error: result.error ?? AppConstants.invalidCredentialsMessage,
          isLoading: false,
        );
        return false;
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        status: AuthStatus.error,
        error: errorMessage,
        isLoading: false,
      );
      return false;
    }
  }

  // Sign in with Google
  Future<bool> signInWithGoogle() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = await _authService.signInWithGoogle();

      if (result.success && result.user != null) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
          isLoading: false,
          clearError: true,
        );
        return true;
      } else {
        state = state.copyWith(
          status: AuthStatus.error,
          error: result.error ?? 'Failed to sign in with Google',
          isLoading: false,
        );
        return false;
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        status: AuthStatus.error,
        error: errorMessage,
        isLoading: false,
      );
      return false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await _authService.signOut();
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
        isLoading: false,
        clearError: true,
      );
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        status: AuthStatus.error,
        error: errorMessage,
        isLoading: false,
      );
    }
  }

  // Reset password
  Future<bool> resetPassword(String email) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = await _authService.resetPassword(email);

      if (result.success) {
        state = state.copyWith(isLoading: false, clearError: true);
        return true;
      } else {
        state = state.copyWith(
          status: AuthStatus.error,
          error: result.error ?? AppConstants.genericErrorMessage,
          isLoading: false,
        );
        return false;
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        status: AuthStatus.error,
        error: errorMessage,
        isLoading: false,
      );
      return false;
    }
  }

  // Update user profile
  Future<bool> updateProfile({
    String? username,
    String? displayName,
    String? bio,
    String? avatarUrl,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = await _authService.updateProfile(
        username: username,
        displayName: displayName,
        bio: bio,
        avatarUrl: avatarUrl,
      );

      if (result.success && result.user != null) {
        state = state.copyWith(
          user: result.user,
          isLoading: false,
          clearError: true,
        );
        return true;
      } else {
        state = state.copyWith(
          status: AuthStatus.error,
          error: result.error ?? AppConstants.genericErrorMessage,
          isLoading: false,
        );
        return false;
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        status: AuthStatus.error,
        error: errorMessage,
        isLoading: false,
      );
      return false;
    }
  }

  // Refresh session
  Future<bool> refreshSession() async {
    if (state.isRefreshing) return false;

    state = state.copyWith(isRefreshing: true, clearError: true);

    try {
      final success = await _authService.refreshSession();

      if (success) {
        state = state.copyWith(isRefreshing: false, clearError: true);
        return true;
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          user: null,
          isRefreshing: false,
          error: 'Failed to refresh session',
        );
        return false;
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
        isRefreshing: false,
        error: errorMessage,
      );
      return false;
    }
  }

  // Delete account
  Future<bool> deleteAccount() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = await _authService.deleteAccount();

      if (result.success) {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          user: null,
          isLoading: false,
          clearError: true,
        );
        return true;
      } else {
        state = state.copyWith(
          status: AuthStatus.error,
          error: result.error ?? AppConstants.genericErrorMessage,
          isLoading: false,
        );
        return false;
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.getErrorMessage(e);
      state = state.copyWith(
        status: AuthStatus.error,
        error: errorMessage,
        isLoading: false,
      );
      return false;
    }
  }

  // Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  // Set loading state manually
  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  // Handle authentication errors gracefully
  void handleAuthError(dynamic error) {
    final errorMessage = ExceptionHandler.getErrorMessage(error);

    if (error is AuthException && error.code == 'SESSION_EXPIRED') {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
        error: errorMessage,
        isLoading: false,
        isRefreshing: false,
      );
    } else {
      state = state.copyWith(
        status: AuthStatus.error,
        error: errorMessage,
        isLoading: false,
        isRefreshing: false,
      );
    }
  }

  @override
  void dispose() {
    _authService.dispose();
    super.dispose();
  }
}

// Providers
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});

// Convenience providers
final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authProvider).user;
});

final authStatusProvider = Provider<AuthStatus>((ref) {
  return ref.watch(authProvider).status;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isAuthenticated;
});

final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isLoading;
});

final authErrorProvider = Provider<String?>((ref) {
  return ref.watch(authProvider).error;
});

// Import required types
import '../services/auth_service.dart';