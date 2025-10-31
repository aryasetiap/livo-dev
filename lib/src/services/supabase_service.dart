import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase/supabase.dart';
import '../core/constants/app_constants.dart';

class SupabaseService {
  static SupabaseClient? _client;
  static SupabaseService? _instance;

  SupabaseService._();

  static SupabaseService get instance {
    _instance ??= SupabaseService._();
    return _instance!;
  }

  SupabaseClient get client {
    _client ??= Supabase.instance.client;
    return _client!;
  }

  // Initialize Supabase
  static Future<void> initialize() async {
    try {
      await Supabase.initialize(
        url: AppConstants.supabaseUrl,
        anonKey: AppConstants.supabaseAnonKey,
        authOptions: const FlutterAuthClientOptions(
          authFlowType: AuthFlowType.pkce,
          autoRefreshToken: true,
          persistSession: true,
          localStorage: SharedPreferencesLocalStorage(),
        ),
        realtimeClientOptions: const RealtimeClientOptions(
          eventsPerSecond: 40,
        ),
        storageOptions: const StorageClientOptions(
          retryAttempts: 3,
        ),
      );
      print('Supabase initialized successfully');
    } catch (e) {
      print('Error initializing Supabase: $e');
      rethrow;
    }
  }

  // Auth related methods
  Auth get auth => client.auth;

  // Database related methods
  PostgrestClient get database => client.from;

  // Storage related methods
  SupabaseStorageClient get storage => client.storage;

  // Realtime subscriptions
  RealtimeChannel get channel(String name) => client.channel(name);

  // Convenience methods for common operations

  // User management
  User? get currentUser => auth.currentUser;

  bool get isLoggedIn => currentUser != null;

  Stream<AuthState> get authStateChanges => auth.onAuthStateChange;

  // Sign up with email and password
  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    String? username,
    Map<String, dynamic>? userMetadata,
  }) async {
    try {
      final response = await auth.signUp(
        email: email,
        password: password,
        data: {
          'username': username,
          ...?userMetadata,
        },
      );

      if (response.user != null) {
        // Create user profile in the users table
        if (response.user?.id != null) {
          await _createUserProfile(
            userId: response.user!.id,
            email: email,
            username: username,
            metadata: userMetadata,
          );
        }
      }

      return response;
    } catch (e) {
      print('Error signing up: $e');
      rethrow;
    }
  }

  // Sign in with email and password
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error signing in: $e');
      rethrow;
    }
  }

  // Sign in with Google OAuth
  Future<AuthResponse> signInWithGoogle() async {
    try {
      return await auth.signInWithOAuth(
        Provider.google,
        redirectTo: 'io.supabase.flutter://callback',
        queryParams: {
          'access_type': 'offline',
        },
      );
    } catch (e) {
      print('Error signing in with Google: $e');
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
      rethrow;
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await auth.resetPasswordForEmail(email);
    } catch (e) {
      print('Error resetting password: $e');
      rethrow;
    }
  }

  // Update user profile
  Future<UserResponse> updateProfile({
    String? username,
    String? displayName,
    String? bio,
    String? avatarUrl,
    Map<String, dynamic>? otherData,
  }) async {
    try {
      // Update auth metadata
      final authResponse = await auth.updateUser(
        UserAttributes(
          data: {
            if (username != null) 'username': username,
            if (displayName != null) 'display_name': displayName,
            if (bio != null) 'bio': bio,
            if (avatarUrl != null) 'avatar_url': avatarUrl,
            ...?otherData,
          },
        ),
      );

      // Update profile in database
      if (currentUser?.id != null) {
        await database('profiles').update({
          if (username != null) 'username': username,
          if (displayName != null) 'display_name': displayName,
          if (bio != null) 'bio': bio,
          if (avatarUrl != null) 'avatar_url': avatarUrl,
          'updated_at': DateTime.now().toIso8601String(),
          ...?otherData,
        }).eq('id', currentUser!.id);
      }

      return authResponse;
    } catch (e) {
      print('Error updating profile: $e');
      rethrow;
    }
  }

  // Private helper to create user profile
  Future<void> _createUserProfile({
    required String userId,
    required String email,
    String? username,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      await database('profiles').insert({
        'id': userId,
        'email': email,
        'username': username ?? email.split('@')[0],
        'display_name': metadata?['display_name'] ?? username,
        'bio': metadata?['bio'] ?? '',
        'avatar_url': metadata?['avatar_url'] ?? '',
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      print('Error creating user profile: $e');
      // Don't rethrow here as the user is already created in auth
    }
  }

  // File upload to storage
  Future<String> uploadFile({
    required String bucket,
    required String path,
    required Uint8List fileBytes,
    String? contentType,
  }) async {
    try {
      final response = await storage.from(bucket).uploadBinary(
        path,
        fileBytes,
        fileOptions: FileOptions(
          contentType: contentType,
          upsert: true,
        ),
      );
      return response;
    } catch (e) {
      print('Error uploading file: $e');
      rethrow;
    }
  }

  // Get public URL for file
  String getPublicUrl(String bucket, String path) {
    return storage.from(bucket).getPublicUrl(path);
  }

  // Delete file from storage
  Future<void> deleteFile({
    required String bucket,
    required String path,
  }) async {
    try {
      await storage.from(bucket).remove([path]);
    } catch (e) {
      print('Error deleting file: $e');
      rethrow;
    }
  }

  // Realtime subscription helper
  RealtimeChannel subscribeToTable({
    required String tableName,
    required String event,
    required Function(dynamic payload) callback,
    String? filter,
  }) {
    final channel = client.channel('public:$tableName');

    channel.onPostgresChanges(
      event: event,
      schema: 'public',
      table: tableName,
      filter: filter,
      callback: (payload) => callback(payload),
    );

    channel.subscribe();
    return channel;
  }

  // Utility method to handle errors
  String handleSupabaseError(dynamic error) {
    if (error is AuthException) {
      switch (error.message) {
        case 'Invalid login credentials':
          return AppConstants.invalidCredentialsMessage;
        case 'User not found':
          return AppConstants.userNotFoundMessage;
        case 'User already registered':
          return AppConstants.emailAlreadyExistsMessage;
        case 'Password should be at least 6 characters':
          return AppConstants.weakPasswordMessage;
        default:
          return error.message;
      }
    } else if (error is PostgrestException) {
      return error.message;
    } else if (error is StorageException) {
      return error.message;
    }
    return AppConstants.genericErrorMessage;
  }

  // Dispose resources
  void dispose() {
    // Clean up any resources if needed
    _client = null;
    _instance = null;
  }
}