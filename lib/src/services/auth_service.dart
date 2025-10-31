import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../shared/models/user_model.dart' as app_models;
import 'supabase_service.dart';

// Auth Result helper class
class AuthResult {
  final app_models.User? user;
  final String? error;
  final bool success;

  AuthResult({
    this.user,
    this.error,
    required this.success,
  });

  factory AuthResult.success(app_models.User user) {
    return AuthResult(
      user: user,
      success: true,
    );
  }

  factory AuthResult.failure(String error) {
    return AuthResult(
      error: error,
      success: false,
    );
  }
}

class AuthService {
  final SupabaseService _supabaseService;

  AuthService(this._supabaseService);

  // Stream of authentication state changes
  Stream<app_models.User?> get authStateChanges {
    return _supabaseService.auth.onAuthStateChange.map((event) {
      final session = event.session;
      if (session?.user != null) {
        return _mapSupabaseUserToAppUser(session!.user);
      }
      return null;
    });
  }

  // Get current authenticated user
  app_models.User? get currentUser {
    final supabaseUser = _supabaseService.auth.currentUser;
    if (supabaseUser != null) {
      return _mapSupabaseUserToAppUser(supabaseUser);
    }
    return null;
  }

  // Sign up with email and password
  Future<AuthResult> signUpWithEmail({
    required String email,
    required String password,
    String? username,
  }) async {
    try {
      final response = await _supabaseService.auth.signUp(
        email: email,
        password: password,
        data: {
          'username': username ?? email.split('@')[0],
        },
      );

      if (response.user != null) {
        final appUser = _mapSupabaseUserToAppUser(response.user!);
        return AuthResult.success(appUser);
      } else {
        return AuthResult.failure('Sign up failed');
      }
    } catch (e) {
      return AuthResult.failure(_handleAuthError(e));
    }
  }

  // Sign in with email and password
  Future<AuthResult> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseService.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        final appUser = _mapSupabaseUserToAppUser(response.user!);
        return AuthResult.success(appUser);
      } else {
        return AuthResult.failure('Sign in failed');
      }
    } catch (e) {
      return AuthResult.failure(_handleAuthError(e));
    }
  }

  // Sign in with Google OAuth
  Future<AuthResult> signInWithGoogle() async {
    try {
      final response = await _supabaseService.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'io.supabase.flutter://callback',
      );

      if (response.user != null) {
        final appUser = _mapSupabaseUserToAppUser(response.user!);
        return AuthResult.success(appUser);
      } else {
        return AuthResult.failure('Google sign in failed');
      }
    } catch (e) {
      return AuthResult.failure(_handleAuthError(e));
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _supabaseService.auth.signOut();
    } catch (e) {
      debugPrint('Error signing out: $e');
      rethrow;
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _supabaseService.auth.resetPasswordForEmail(email);
    } catch (e) {
      debugPrint('Error resetting password: $e');
      rethrow;
    }
  }

  // Update user profile
  Future<AuthResult> updateProfile({
    String? username,
    String? displayName,
    String? bio,
  }) async {
    try {
      final currentUser = _supabaseService.auth.currentUser;
      if (currentUser == null) {
        return AuthResult.failure('No authenticated user');
      }

      final response = await _supabaseService.auth.updateUser(
        UserAttributes(
          data: {
            if (username != null) 'username': username,
            if (displayName != null) 'display_name': displayName,
            if (bio != null) 'bio': bio,
          },
        ),
      );

      if (response.user != null) {
        final appUser = _mapSupabaseUserToAppUser(response.user!);
        return AuthResult.success(appUser);
      } else {
        return AuthResult.failure('Profile update failed');
      }
    } catch (e) {
      return AuthResult.failure(_handleAuthError(e));
    }
  }

  // Private helper methods

  app_models.User _mapSupabaseUserToAppUser(User supabaseUser) {
    final metadata = supabaseUser.userMetadata ?? {};

    return app_models.User(
      id: supabaseUser.id,
      email: supabaseUser.email ?? '',
      username: metadata['username'] as String?,
      displayName: metadata['display_name'] as String? ?? metadata['name'] as String?,
      bio: metadata['bio'] as String?,
      avatarUrl: metadata['avatar_url'] as String?,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
    );
  }

  String _handleAuthError(dynamic error) {
    final message = error.toString().toLowerCase();

    if (message.contains('invalid login credentials')) {
      return 'Invalid email or password';
    } else if (message.contains('user already registered')) {
      return 'An account with this email already exists';
    } else if (message.contains('email not confirmed')) {
      return 'Please confirm your email address';
    } else if (message.contains('invalid email')) {
      return 'Please enter a valid email address';
    } else if (message.contains('password should be at least 6 characters')) {
      return 'Password should be at least 6 characters';
    }

    return error.toString();
  }
}