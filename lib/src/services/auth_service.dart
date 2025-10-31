import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/constants/app_constants.dart';
import '../core/config/environment_config.dart';
import '../core/errors/app_exception.dart';
import 'supabase_service.dart';

// Models
class User {
  final String id;
  final String email;
  final String? username;
  final String? displayName;
  final String? bio;
  final String? avatarUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.id,
    required this.email,
    this.username,
    this.displayName,
    this.bio,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromSupabaseUser(User supabaseUser, [Map<String, dynamic>? profile]) {
    return User(
      id: supabaseUser.id,
      email: supabaseUser.email ?? '',
      username: profile?['username'] ?? supabaseUser.userMetadata?['username'],
      displayName: profile?['display_name'] ?? supabaseUser.userMetadata?['display_name'],
      bio: profile?['bio'] ?? supabaseUser.userMetadata?['bio'],
      avatarUrl: profile?['avatar_url'] ?? supabaseUser.userMetadata?['avatar_url'],
      createdAt: profile?['created_at'] != null
          ? DateTime.parse(profile!['created_at'])
          : supabaseUser.createdAt,
      updatedAt: profile?['updated_at'] != null
          ? DateTime.parse(profile!['updated_at'])
          : supabaseUser.updatedAt,
    );
  }

  User copyWith({
    String? id,
    String? email,
    String? username,
    String? displayName,
    String? bio,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'display_name': displayName,
      'bio': bio,
      'avatar_url': avatarUrl,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class AuthResult {
  final User? user;
  final String? error;
  final bool success;

  AuthResult({
    this.user,
    this.error,
    required this.success,
  });

  factory AuthResult.success(User user) {
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

// AuthService
class AuthService {
  final SupabaseService _supabaseService = SupabaseService.instance;
  final EnvironmentConfig _env = EnvironmentConfig.instance;

  User? _currentUser;
  User? get currentUser => _currentUser;

  bool get isAuthenticated => _currentUser != null;

  Stream<User?> get authStateChanges {
    return _supabaseService.authStateChanges
        .map((authState) => _handleAuthStateChange(authState));
  }

  User? _handleAuthStateChange(AuthState authState) {
    if (authState.session != null && authState.user != null) {
      _currentUser = User.fromSupabaseUser(authState.user!);
      _env.log('User authenticated: ${_currentUser!.email}', tag: 'AuthService');
    } else {
      _currentUser = null;
      _env.log('User signed out', tag: 'AuthService');
    }
    return _currentUser;
  }

  // Initialize current user from existing session
  Future<void> initializeCurrentUser() async {
    try {
      final currentUser = _supabaseService.currentUser;
      if (currentUser != null) {
        // Fetch user profile from database
        final profileData = await _supabaseService.database('profiles')
            .select()
            .eq('id', currentUser.id)
            .maybeSingle();

        _currentUser = User.fromSupabaseUser(currentUser, profileData);
        _env.log('Current user initialized: ${_currentUser!.email}', tag: 'AuthService');
      }
    } catch (e) {
      _env.logError('Failed to initialize current user: $e', tag: 'AuthService');
    }
  }

  // Sign up with email and password
  Future<AuthResult> signUpWithEmail({
    required String email,
    required String password,
    required String confirmPassword,
    String? username,
    String? displayName,
  }) async {
    try {
      // Validation
      if (!_isValidEmail(email)) {
        return AuthResult.failure(AppConstants.invalidEmailMessage);
      }

      if (password.length < 8) {
        return AuthResult.failure(AppConstants.invalidPasswordMessage);
      }

      if (password != confirmPassword) {
        return AuthResult.failure(AppConstants.passwordsDoNotMatchMessage);
      }

      if (username != null && !_isValidUsername(username)) {
        return AuthResult.failure(AppConstants.invalidUsernameMessage);
      }

      _env.log('Attempting to sign up user: $email', tag: 'AuthService');

      final response = await _supabaseService.signUpWithEmail(
        email: email.trim(),
        password: password,
        username: username?.trim(),
        userMetadata: {
          if (displayName != null) 'display_name': displayName.trim(),
        },
      );

      if (response.user != null) {
        _env.log('Sign up successful: $email', tag: 'AuthService');
        return AuthResult.success(User.fromSupabaseUser(response.user!));
      } else {
        return AuthResult.failure(AppConstants.genericErrorMessage);
      }
    } catch (e) {
      final errorMessage = _supabaseService.handleSupabaseError(e);
      _env.logError('Sign up error: $errorMessage', tag: 'AuthService');
      return AuthResult.failure(errorMessage);
    }
  }

  // Sign in with email and password
  Future<AuthResult> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      if (!_isValidEmail(email)) {
        return AuthResult.failure(AppConstants.invalidEmailMessage);
      }

      if (password.isEmpty) {
        return AuthResult.failure(AppConstants.invalidPasswordMessage);
      }

      _env.log('Attempting to sign in user: $email', tag: 'AuthService');

      final response = await _supabaseService.signInWithEmail(
        email: email.trim(),
        password: password,
      );

      if (response.user != null && response.session != null) {
        // Fetch user profile
        final profileData = await _supabaseService.database('profiles')
            .select()
            .eq('id', response.user!.id)
            .maybeSingle();

        final user = User.fromSupabaseUser(response.user!, profileData);
        _currentUser = user;

        _env.log('Sign in successful: ${user.email}', tag: 'AuthService');
        return AuthResult.success(user);
      } else {
        return AuthResult.failure(AppConstants.invalidCredentialsMessage);
      }
    } catch (e) {
      final errorMessage = _supabaseService.handleSupabaseError(e);
      _env.logError('Sign in error: $errorMessage', tag: 'AuthService');
      return AuthResult.failure(errorMessage);
    }
  }

  // Sign in with Google
  Future<AuthResult> signInWithGoogle() async {
    try {
      _env.log('Attempting to sign in with Google', tag: 'AuthService');

      final response = await _supabaseService.signInWithGoogle();

      if (response.user != null && response.session != null) {
        // Fetch or create user profile
        final profileData = await _supabaseService.database('profiles')
            .select()
            .eq('id', response.user!.id)
            .maybeSingle();

        final user = User.fromSupabaseUser(response.user!, profileData);
        _currentUser = user;

        _env.log('Google sign in successful: ${user.email}', tag: 'AuthService');
        return AuthResult.success(user);
      } else {
        return AuthResult.failure('Failed to sign in with Google');
      }
    } catch (e) {
      final errorMessage = _supabaseService.handleSupabaseError(e);
      _env.logError('Google sign in error: $errorMessage', tag: 'AuthService');
      return AuthResult.failure(errorMessage);
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      _env.log('Signing out user', tag: 'AuthService');
      await _supabaseService.signOut();
      _currentUser = null;
      _env.log('Sign out successful', tag: 'AuthService');
    } catch (e) {
      final errorMessage = _supabaseService.handleSupabaseError(e);
      _env.logError('Sign out error: $errorMessage', tag: 'AuthService');
      throw AuthException(errorMessage);
    }
  }

  // Reset password
  Future<AuthResult> resetPassword(String email) async {
    try {
      if (!_isValidEmail(email)) {
        return AuthResult.failure(AppConstants.invalidEmailMessage);
      }

      _env.log('Sending password reset email to: $email', tag: 'AuthService');
      await _supabaseService.resetPassword(email.trim());

      _env.log('Password reset email sent successfully', tag: 'AuthService');
      return AuthResult.success(
        User(id: '', email: email) // Placeholder user for success state
      );
    } catch (e) {
      final errorMessage = _supabaseService.handleSupabaseError(e);
      _env.logError('Password reset error: $errorMessage', tag: 'AuthService');
      return AuthResult.failure(errorMessage);
    }
  }

  // Update user profile
  Future<AuthResult> updateProfile({
    String? username,
    String? displayName,
    String? bio,
    String? avatarUrl,
  }) async {
    try {
      if (_currentUser == null) {
        return AuthResult.failure('No authenticated user found');
      }

      if (username != null && !_isValidUsername(username)) {
        return AuthResult.failure(AppConstants.invalidUsernameMessage);
      }

      if (bio != null && bio.length > AppConstants.maxBioLength) {
        return AuthResult.failure('Bio is too long');
      }

      _env.log('Updating profile for user: ${_currentUser!.email}', tag: 'AuthService');

      final response = await _supabaseService.updateProfile(
        username: username?.trim(),
        displayName: displayName?.trim(),
        bio: bio?.trim(),
        avatarUrl: avatarUrl?.trim(),
      );

      if (response.user != null) {
        // Fetch updated profile
        final profileData = await _supabaseService.database('profiles')
            .select()
            .eq('id', _currentUser!.id)
            .maybeSingle();

        final updatedUser = User.fromSupabaseUser(response.user!, profileData);
        _currentUser = updatedUser;

        _env.log('Profile updated successfully', tag: 'AuthService');
        return AuthResult.success(updatedUser);
      } else {
        return AuthResult.failure('Failed to update profile');
      }
    } catch (e) {
      final errorMessage = _supabaseService.handleSupabaseError(e);
      _env.logError('Profile update error: $errorMessage', tag: 'AuthService');
      return AuthResult.failure(errorMessage);
    }
  }

  // Refresh session
  Future<bool> refreshSession() async {
    try {
      _env.log('Refreshing session', tag: 'AuthService');
      final refreshed = await _supabaseService.auth.refreshSession();

      if (refreshed.session != null) {
        _env.log('Session refreshed successfully', tag: 'AuthService');
        return true;
      } else {
        _env.log('Failed to refresh session', tag: 'AuthService');
        return false;
      }
    } catch (e) {
      _env.logError('Session refresh error: $e', tag: 'AuthService');
      return false;
    }
  }

  // Delete account
  Future<AuthResult> deleteAccount() async {
    try {
      if (_currentUser == null) {
        return AuthResult.failure('No authenticated user found');
      }

      _env.log('Deleting account for user: ${_currentUser!.email}', tag: 'AuthService');

      // First, delete user's data from all tables
      final userId = _currentUser!.id;

      await _supabaseService.database('profiles').delete().eq('id', userId);
      await _supabaseService.database('posts').delete().eq('user_id', userId);
      await _supabaseService.database('likes').delete().eq('user_id', userId);
      await _supabaseService.database('comments').delete().eq('user_id', userId);
      await _supabaseService.database('follows').delete().or('follower_id=eq.$userId,following_id=eq.$userId');
      await _supabaseService.database('stories').delete().eq('user_id', userId);
      await _supabaseService.database('messages').delete().or('sender_id=eq.$userId,receiver_id=eq.$userId');
      await _supabaseService.database('notifications').delete().eq('user_id', userId);
      await _supabaseService.database('saved_posts').delete().eq('user_id', userId);

      // Delete the auth user
      await _supabaseService.auth.admin.deleteUser(userId);

      _currentUser = null;
      _env.log('Account deleted successfully', tag: 'AuthService');
      return AuthResult.success(
        User(id: '', email: '') // Placeholder user for success state
      );
    } catch (e) {
      final errorMessage = _supabaseService.handleSupabaseError(e);
      _env.logError('Account deletion error: $errorMessage', tag: 'AuthService');
      return AuthResult.failure(errorMessage);
    }
  }

  // Validation helpers
  bool _isValidEmail(String email) {
    return RegExp(AppConstants.emailPattern).hasMatch(email);
  }

  bool _isValidUsername(String username) {
    return RegExp(AppConstants.usernamePattern).hasMatch(username);
  }

  // Clear current user (for testing purposes)
  void clearCurrentUser() {
    _currentUser = null;
  }

  // Dispose
  void dispose() {
    _currentUser = null;
  }
}

// Custom Auth Exception
class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => message;
}