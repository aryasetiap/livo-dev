import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    String? username,
    String? displayName,
    String? bio,
    String? avatarUrl,
    String? website,
    String? location,
    @Default(0) int followersCount,
    @Default(0) int followingCount,
    @Default(0) int postsCount,
    @Default(false) bool isPrivate,
    @Default(false) bool isVerified,
    @Default(false) bool isFollowing,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();

  // Getters for computed properties
  String get displayNameOrUsername => displayName ?? username ?? email;

  String get displayNameOrEmail => displayName ?? email;

  String get usernameOrEmail => username ?? email;

  bool get hasAvatar => avatarUrl != null && avatarUrl!.isNotEmpty;

  bool get hasBio => bio != null && bio!.isNotEmpty;

  bool get hasWebsite => website != null && website!.isNotEmpty;

  bool get hasLocation => location != null && location!.isNotEmpty;

  // User validation methods
  bool get isValidUsername {
    if (username == null) return false;
    return RegExp(r'^[a-zA-Z0-9_.]{3,30}$').hasMatch(username!);
  }

  bool get isValidDisplayName {
    if (displayName == null) return true; // Display name is optional
    return displayName!.length <= 50 && displayName!.isNotEmpty;
  }

  bool get isValidBio {
    if (bio == null) return true; // Bio is optional
    return bio!.length <= 150;
  }

  // User copy methods for updates
  User copyWithUpdatedCounts({
    int? followersCount,
    int? followingCount,
    int? postsCount,
  }) {
    return copyWith(
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      postsCount: postsCount ?? this.postsCount,
      updatedAt: DateTime.now(),
    );
  }

  User copyWithFollowStatus(bool isFollowing) {
    return copyWith(
      isFollowing: isFollowing,
      followersCount: isFollowing
          ? followersCount + 1
          : followersCount > 0 ? followersCount - 1 : 0,
      updatedAt: DateTime.now(),
    );
  }

  // Create from Supabase auth user
  factory User.fromSupabaseUser(
    supabase.User supabaseUser, {
    Map<String, dynamic>? profileData,
  }) {
    return User(
      id: supabaseUser.id,
      email: supabaseUser.email ?? '',
      username: profileData?['username'] ?? supabaseUser.userMetadata?['username'],
      displayName: profileData?['display_name'] ?? supabaseUser.userMetadata?['display_name'],
      bio: profileData?['bio'] ?? supabaseUser.userMetadata?['bio'],
      avatarUrl: profileData?['avatar_url'] ?? supabaseUser.userMetadata?['avatar_url'],
      website: profileData?['website'] ?? supabaseUser.userMetadata?['website'],
      location: profileData?['location'] ?? supabaseUser.userMetadata?['location'],
      followersCount: profileData?['followers_count'] ?? 0,
      followingCount: profileData?['following_count'] ?? 0,
      postsCount: profileData?['posts_count'] ?? 0,
      isPrivate: profileData?['is_private'] ?? false,
      isVerified: profileData?['is_verified'] ?? false,
      createdAt: profileData?['created_at'] != null
          ? DateTime.parse(profileData!['created_at'])
          : supabaseUser.createdAt,
      updatedAt: profileData?['updated_at'] != null
          ? DateTime.parse(profileData!['updated_at'])
          : supabaseUser.updatedAt,
    );
  }

  // Convert to map for database operations
  Map<String, dynamic> toProfileMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'display_name': displayName,
      'bio': bio,
      'avatar_url': avatarUrl,
      'website': website,
      'location': location,
      'followers_count': followersCount,
      'following_count': followingCount,
      'posts_count': postsCount,
      'is_private': isPrivate,
      'is_verified': isVerified,
      'updated_at': DateTime.now().toIso8601String(),
    };
  }

  // Create minimal user for list displays
  factory User.minimal({
    required String id,
    required String username,
    String? displayName,
    String? avatarUrl,
    bool isVerified = false,
    bool isFollowing = false,
  }) {
    return User(
      id: id,
      email: '', // Not needed for minimal display
      username: username,
      displayName: displayName,
      avatarUrl: avatarUrl,
      isVerified: isVerified,
      isFollowing: isFollowing,
    );
  }
}

// User extensions for common operations
extension UserExtensions on User {
  // Format follower/following count for display
  String formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }

  String get formattedFollowersCount => formatCount(followersCount);
  String get formattedFollowingCount => formatCount(followingCount);
  String get formattedPostsCount => formatCount(postsCount);

  // Check if user can be followed
  bool get canBeFollowed => id != 'current' && !isFollowing;

  // Get user initials for avatar placeholder
  String get initials {
    final name = displayNameOrUsername;
    if (name.isEmpty) return '?';

    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else {
      return name[0].toUpperCase();
    }
  }

  // Get avatar display color based on username
  int get avatarColorCode {
    if (username == null) return 0xFFE91E63;

    final hash = username!.codeUnits.fold(0, (sum, code) => sum + code);
    final colors = [
      0xFFE91E63, // Pink
      0xFF2196F3, // Blue
      0xFF4CAF50, // Green
      0xFFFF9800, // Orange
      0xFF9C27B0, // Purple
      0xFF00BCD4, // Cyan
      0xFF8BC34A, // Light Green
      0xFFFFC107, // Amber
      0xFF795548, // Brown
      0xFF607D8B, // Blue Grey
    ];

    return colors[hash % colors.length];
  }
}

// User-related enums
enum UserSortOption {
  newest('Newest'),
  oldest('Oldest'),
  mostFollowers('Most Followers'),
  leastFollowers('Least Followers'),
  mostPosts('Most Posts'),
  leastPosts('Least Posts'),
  recentlyActive('Recently Active');

  const UserSortOption(this.label);
  final String label;
}

enum UserFilterOption {
  all('All Users'),
  following('Following'),
  followers('Followers'),
  verified('Verified Only'),
  nearby('Nearby');

  const UserFilterOption(this.label);
  final String label;
}