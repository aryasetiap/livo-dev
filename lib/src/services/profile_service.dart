import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../core/constants/app_constants.dart';
import '../core/config/environment_config.dart';
import '../core/config/supabase_config.dart';
import '../shared/models/user_model.dart' as app_models;
import '../shared/models/follow_model.dart';
import '../core/errors/app_exception.dart';
import 'supabase_service.dart';

class ProfileService {
  final SupabaseService _supabaseService;
  final EnvironmentConfig _env;

  ProfileService(this._supabaseService, this._env);

  // Get user profile by ID
  Future<app_models.User?> getUserProfile(String userId) async {
    try {
      _env.log('Getting user profile: $userId', tag: 'ProfileService');

      final response = await _supabaseService.from(SupabaseConfig.profilesTable)
          .select()
          .eq('id', userId)
          .maybeSingle();

      if (response != null) {
        final user = app_models.User.fromSupabaseUser(
          _supabaseService.auth.currentUser!,
          profileData: response,
        );
        _env.log('User profile retrieved successfully', tag: 'ProfileService');
        return user;
      }

      _env.log('User profile not found: $userId', tag: 'ProfileService');
      return null;
    } catch (e) {
      _env.logError('Error getting user profile: $e', tag: 'ProfileService');
      throw ProfileException('Failed to get user profile: ${e.toString()}');
    }
  }

  // Get multiple user profiles
  Future<List<app_models.User>> getUserProfiles(List<String> userIds) async {
    try {
      if (userIds.isEmpty) return [];

      _env.log('Getting ${userIds.length} user profiles', tag: 'ProfileService');

      final response = await _supabaseService.from(SupabaseConfig.profilesTable)
          .select()
          .in_('id', userIds);

      final users = response.map((profile) {
        return app_models.User.fromSupabaseUser(
          _supabaseService.auth.currentUser!,
          profileData: profile,
        );
      }).toList();

      _env.log('Retrieved ${users.length} user profiles', tag: 'ProfileService');
      return users;
    } catch (e) {
      _env.logError('Error getting user profiles: $e', tag: 'ProfileService');
      throw ProfileException('Failed to get user profiles: ${e.toString()}');
    }
  }

  // Update user profile
  Future<User> updateProfile({
    String? username,
    String? displayName,
    String? bio,
    String? website,
    String? location,
  }) async {
    try {
      final currentUserId = _supabaseService.currentUser?.id;
      if (currentUserId == null) {
        throw AuthException('No authenticated user found');
      }

      _env.log('Updating profile for user: $currentUserId', tag: 'ProfileService');

      // Validate input
      if (username != null && !_isValidUsername(username)) {
        throw ValidationException.invalidFormat('username', '3-30 characters, alphanumeric + underscore/dot');
      }

      if (displayName != null && displayName.length > 50) {
        throw ValidationException.tooLong('display_name', 50);
      }

      if (bio != null && bio.length > AppConstants.maxBioLength) {
        throw ValidationException.tooLong('bio', AppConstants.maxBioLength);
      }

      // Check username uniqueness if changing
      if (username != null) {
        final existingUser = await _supabaseService.database(SupabaseConfig.profilesTable)
            .select('id')
            .eq('username', username)
            .neq('id', currentUserId)
            .maybeSingle();

        if (existingUser != null) {
          throw ValidationException('Username already exists');
        }
      }

      // Update profile in database
      final updateData = {
        if (username != null) 'username': username.trim(),
        if (displayName != null) 'display_name': displayName.trim(),
        if (bio != null) 'bio': bio.trim(),
        if (website != null) 'website': website.trim(),
        if (location != null) 'location': location.trim(),
        'updated_at': DateTime.now().toIso8601String(),
      };

      final response = await _supabaseService.database(SupabaseConfig.profilesTable)
          .update(updateData)
          .eq('id', currentUserId)
          .select()
          .single();

      // Update auth metadata
      await _supabaseService.auth.updateUser(
        UserAttributes(
          data: {
            if (username != null) 'username': username.trim(),
            if (displayName != null) 'display_name': displayName.trim(),
            if (bio != null) 'bio': bio.trim(),
            if (website != null) 'website': website.trim(),
            if (location != null) 'location': location.trim(),
          },
        ),
      );

      final updatedUser = User.fromSupabaseUser(
        _supabaseService.currentUser!,
        profileData: response,
      );

      _env.log('Profile updated successfully', tag: 'ProfileService');
      return updatedUser;
    } catch (e) {
      _env.logError('Error updating profile: $e', tag: 'ProfileService');
      if (e is ValidationException || e is ProfileException) {
        rethrow;
      }
      throw ProfileException('Failed to update profile: ${e.toString()}');
    }
  }

  // Upload profile photo
  Future<User> uploadProfilePhoto(File imageFile) async {
    try {
      final currentUserId = _supabaseService.currentUser?.id;
      if (currentUserId == null) {
        throw AuthException('No authenticated user found');
      }

      _env.log('Uploading profile photo for user: $currentUserId', tag: 'ProfileService');

      // Validate file
      final fileSize = await imageFile.length();
      if (fileSize > AppConstants.maxImageSizeMB * 1024 * 1024) {
        throw StorageException.fileTooBig(AppConstants.maxImageSizeMB);
      }

      final fileExtension = imageFile.path.split('.').last.toLowerCase();
      if (!AppConstants.supportedImageExtensions.contains('.$fileExtension')) {
        throw StorageException.invalidFileType(AppConstants.supportedImageExtensions);
      }

      // Generate unique file name
      final fileName = 'avatar_${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
      final filePath = '$currentUserId/$fileName';

      // Upload to storage
      final bytes = await imageFile.readAsBytes();
      final publicUrl = await _supabaseService.uploadFile(
        bucket: SupabaseConfig.profilesBucket,
        path: filePath,
        fileBytes: bytes,
        contentType: 'image/$fileExtension',
      );

      // Update user profile with new avatar URL
      final avatarUrl = _supabaseService.getPublicUrl(SupabaseConfig.profilesBucket, filePath);

      final response = await _supabaseService.database(SupabaseConfig.profilesTable)
          .update({
            'avatar_url': avatarUrl,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', currentUserId)
          .select()
          .single();

      // Update auth metadata
      await _supabaseService.auth.updateUser(
        UserAttributes(
          data: {'avatar_url': avatarUrl},
        ),
      );

      final updatedUser = User.fromSupabaseUser(
        _supabaseService.currentUser!,
        profileData: response,
      );

      _env.log('Profile photo uploaded successfully', tag: 'ProfileService');
      return updatedUser;
    } catch (e) {
      _env.logError('Error uploading profile photo: $e', tag: 'ProfileService');
      if (e is StorageException) {
        rethrow;
      }
      throw ProfileException('Failed to upload profile photo: ${e.toString()}');
    }
  }

  // Remove profile photo
  Future<User> removeProfilePhoto() async {
    try {
      final currentUserId = _supabaseService.currentUser?.id;
      if (currentUserId == null) {
        throw AuthException('No authenticated user found');
      }

      _env.log('Removing profile photo for user: $currentUserId', tag: 'ProfileService');

      // Get current user profile to find avatar URL
      final currentProfile = await getUserProfile(currentUserId);
      if (currentProfile?.avatarUrl != null) {
        // Extract file path from URL
        final url = currentProfile!.avatarUrl!;
        final pathParts = url.split('/');
        final fileName = pathParts.last;
        final filePath = '$currentUserId/$fileName';

        // Delete from storage
        await _supabaseService.deleteFile(
          bucket: SupabaseConfig.profilesBucket,
          path: filePath,
        );
      }

      // Update profile to remove avatar URL
      final response = await _supabaseService.database(SupabaseConfig.profilesTable)
          .update({
            'avatar_url': null,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', currentUserId)
          .select()
          .single();

      // Update auth metadata
      await _supabaseService.auth.updateUser(
        UserAttributes(
          data: {'avatar_url': null},
        ),
      );

      final updatedUser = User.fromSupabaseUser(
        _supabaseService.currentUser!,
        profileData: response,
      );

      _env.log('Profile photo removed successfully', tag: 'ProfileService');
      return updatedUser;
    } catch (e) {
      _env.logError('Error removing profile photo: $e', tag: 'ProfileService');
      throw ProfileException('Failed to remove profile photo: ${e.toString()}');
    }
  }

  // Follow user
  Future<bool> followUser(String targetUserId) async {
    try {
      final currentUserId = _supabaseService.currentUser?.id;
      if (currentUserId == null) {
        throw AuthException('No authenticated user found');
      }

      if (currentUserId == targetUserId) {
        throw ValidationException('You cannot follow yourself');
      }

      _env.log('Following user: $targetUserId', tag: 'ProfileService');

      // Check if already following
      final existingFollow = await _supabaseService.database(SupabaseConfig.followsTable)
          .select()
          .eq('follower_id', currentUserId)
          .eq('following_id', targetUserId)
          .maybeSingle();

      if (existingFollow != null) {
        _env.log('Already following user: $targetUserId', tag: 'ProfileService');
        return false;
      }

      // Create follow relationship using database function
      final response = await _supabaseService.database.rpc('follow_user', params: {
        'target_user_id': targetUserId,
      });

      _env.log('Successfully followed user: $targetUserId', tag: 'ProfileService');
      return response;
    } catch (e) {
      _env.logError('Error following user: $e', tag: 'ProfileService');
      throw ProfileException('Failed to follow user: ${e.toString()}');
    }
  }

  // Unfollow user
  Future<bool> unfollowUser(String targetUserId) async {
    try {
      final currentUserId = _supabaseService.currentUser?.id;
      if (currentUserId == null) {
        throw AuthException('No authenticated user found');
      }

      _env.log('Unfollowing user: $targetUserId', tag: 'ProfileService');

      // Check if following exists
      final existingFollow = await _supabaseService.database(SupabaseConfig.followsTable)
          .select()
          .eq('follower_id', currentUserId)
          .eq('following_id', targetUserId)
          .maybeSingle();

      if (existingFollow == null) {
        _env.log('Not following user: $targetUserId', tag: 'ProfileService');
        return false;
      }

      // Remove follow relationship using database function
      final response = await _supabaseService.database.rpc('unfollow_user', params: {
        'target_user_id': targetUserId,
      });

      _env.log('Successfully unfollowed user: $targetUserId', tag: 'ProfileService');
      return response;
    } catch (e) {
      _env.logError('Error unfollowing user: $e', tag: 'ProfileService');
      throw ProfileException('Failed to unfollow user: ${e.toString()}');
    }
  }

  // Get followers
  Future<List<User>> getFollowers(String userId, {int limit = 20, int offset = 0}) async {
    try {
      _env.log('Getting followers for user: $userId', tag: 'ProfileService');

      final response = await _supabaseService.database(SupabaseConfig.followsTable)
          .select('''
            follower_id,
            profiles!follower_id (
              id, email, username, display_name, avatar_url,
              followers_count, following_count, posts_count,
              is_private, is_verified, created_at
            )
          ''')
          .eq('following_id', userId)
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      final followers = response.map((row) {
        final profileData = row['profiles'];
        return User.fromSupabaseUser(
          _supabaseService.auth.currentUser!,
          profileData: profileData,
        ).copyWith(isFollowing: true);
      }).toList();

      _env.log('Retrieved ${followers.length} followers', tag: 'ProfileService');
      return followers;
    } catch (e) {
      _env.logError('Error getting followers: $e', tag: 'ProfileService');
      throw ProfileException('Failed to get followers: ${e.toString()}');
    }
  }

  // Get following
  Future<List<User>> getFollowing(String userId, {int limit = 20, int offset = 0}) async {
    try {
      _env.log('Getting following for user: $userId', tag: 'ProfileService');

      final response = await _supabaseService.database(SupabaseConfig.followsTable)
          .select('''
            following_id,
            profiles!following_id (
              id, email, username, display_name, avatar_url,
              followers_count, following_count, posts_count,
              is_private, is_verified, created_at
            )
          ''')
          .eq('follower_id', userId)
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      final following = response.map((row) {
        final profileData = row['profiles'];
        return User.fromSupabaseUser(
          _supabaseService.auth.currentUser!,
          profileData: profileData,
        ).copyWith(isFollowing: true);
      }).toList();

      _env.log('Retrieved ${following.length} following', tag: 'ProfileService');
      return following;
    } catch (e) {
      _env.logError('Error getting following: $e', tag: 'ProfileService');
      throw ProfileException('Failed to get following: ${e.toString()}');
    }
  }

  // Check follow status
  Future<bool> isFollowing(String targetUserId) async {
    try {
      final currentUserId = _supabaseService.currentUser?.id;
      if (currentUserId == null) return false;

      final response = await _supabaseService.database(SupabaseConfig.followsTable)
          .select('id')
          .eq('follower_id', currentUserId)
          .eq('following_id', targetUserId)
          .maybeSingle();

      return response != null;
    } catch (e) {
      _env.logError('Error checking follow status: $e', tag: 'ProfileService');
      return false;
    }
  }

  // Search users
  Future<List<User>> searchUsers(String query, {int limit = 20, int offset = 0}) async {
    try {
      if (query.trim().isEmpty) return [];

      _env.log('Searching users with query: $query', tag: 'ProfileService');

      final response = await _supabaseService.database(SupabaseConfig.profilesTable)
          .select()
          .or('username.ilike.%$query%,display_name.ilike.%$query%')
          .order('followers_count', ascending: false)
          .range(offset, offset + limit - 1);

      final users = response.map((profile) {
        return User.fromSupabaseUser(
          _supabaseService.auth.currentUser!,
          profileData: profile,
        );
      }).toList();

      _env.log('Found ${users.length} users', tag: 'ProfileService');
      return users;
    } catch (e) {
      _env.logError('Error searching users: $e', tag: 'ProfileService');
      throw ProfileException('Failed to search users: ${e.toString()}');
    }
  }

  // Get user stats
  Future<FollowStats> getUserStats(String userId) async {
    try {
      _env.log('Getting user stats for: $userId', tag: 'ProfileService');

      final response = await _supabaseService.database(SupabaseConfig.profilesTable)
          .select('followers_count, following_count, posts_count')
          .eq('id', userId)
          .single();

      return FollowStats(
        followersCount: response['followers_count'] ?? 0,
        followingCount: response['following_count'] ?? 0,
        postsCount: response['posts_count'] ?? 0,
      );
    } catch (e) {
      _env.logError('Error getting user stats: $e', tag: 'ProfileService');
      throw ProfileException('Failed to get user stats: ${e.toString()}');
    }
  }

  // Private validation methods
  bool _isValidUsername(String username) {
    return RegExp(AppConstants.usernamePattern).hasMatch(username);
  }

  // Pick image from gallery or camera
  Future<File?> pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      _env.logError('Error picking image: $e', tag: 'ProfileService');
      throw ProfileException('Failed to pick image: ${e.toString()}');
    }
  }

  // Compress image if needed
  Future<Uint8List> compressImage(File imageFile) async {
    try {
      final fileSize = await imageFile.length();
      if (fileSize <= 1024 * 1024) { // Less than 1MB
        return await imageFile.readAsBytes();
      }

      // TODO: Implement image compression
      // For now, just read the bytes
      return await imageFile.readAsBytes();
    } catch (e) {
      _env.logError('Error compressing image: $e', tag: 'ProfileService');
      throw ProfileException('Failed to compress image: ${e.toString()}');
    }
  }

  // Dispose resources
  void dispose() {
    // Clean up any resources if needed
  }
}

// Custom profile exception
class ProfileException extends AppException {
  ProfileException(String message, {String? code, dynamic originalError})
      : super(message, code: code ?? 'PROFILE_ERROR', originalError: originalError);
}