import 'package:flutter/foundation.dart';
import '../constants/app_constants.dart';

class SupabaseConfig {
  // Production environment (default)
  static const String _prodUrl = 'YOUR_PRODUCTION_SUPABASE_URL';
  static const String _prodAnonKey = 'YOUR_PRODUCTION_SUPABASE_ANON_KEY';

  // Development environment
  static const String _devUrl = 'YOUR_DEVELOPMENT_SUPABASE_URL';
  static const String _devAnonKey = 'YOUR_DEVELOPMENT_SUPABASE_ANON_KEY';

  // Staging environment
  static const String _stagingUrl = 'YOUR_STAGING_SUPABASE_URL';
  static const String _stagingAnonKey = 'YOUR_STAGING_SUPABASE_ANON_KEY';

  // Get current environment
  static Environment get currentEnvironment {
    if (kReleaseMode) {
      return Environment.production;
    } else if (kDebugMode) {
      return Environment.development;
    } else {
      return Environment.staging;
    }
  }

  // Get Supabase URL based on environment
  static String get url {
    switch (currentEnvironment) {
      case Environment.development:
        return _devUrl;
      case Environment.staging:
        return _stagingUrl;
      case Environment.production:
      default:
        return _prodUrl;
    }
  }

  // Get Supabase Anon Key based on environment
  static String get anonKey {
    switch (currentEnvironment) {
      case Environment.development:
        return _devAnonKey;
      case Environment.staging:
        return _stagingAnonKey;
      case Environment.production:
      default:
        return _prodAnonKey;
    }
  }

  // Storage buckets
  static const String profilesBucket = 'profiles';
  static const String postsBucket = 'posts';
  static const String storiesBucket = 'stories';
  static const String messagesBucket = 'messages';

  // Database schema
  static const String profilesTable = 'profiles';
  static const String postsTable = 'posts';
  static const String likesTable = 'likes';
  static const String commentsTable = 'comments';
  static const String followsTable = 'follows';
  static const String storiesTable = 'stories';
  static const String messagesTable = 'messages';
  static const String notificationsTable = 'notifications';
  static const String savedPostsTable = 'saved_posts';

  // Database functions
  static const String followUserFunction = 'follow_user';
  static const String unfollowUserFunction = 'unfollow_user';
  static const String getFollowersFunction = 'get_followers';
  static const String getFollowingFunction = 'get_following';
  static const String likePostFunction = 'like_post';
  static const String unlikePostFunction = 'unlike_post';
  static const String savePostFunction = 'save_post';
  static const String unsavePostFunction = 'unsave_post';

  // Realtime channels
  static const String feedChannel = 'feed';
  static const String notificationsChannel = 'notifications';
  static const String messagesChannel = 'messages';
  static const String storiesChannel = 'stories';

  // Row Level Security (RLS) Policies
  static const Map<String, List<String>> rlsPolicies = {
    profilesTable: [
      'Users can view their own profile',
      'Users can update their own profile',
      'Authenticated users can view all profiles',
    ],
    postsTable: [
      'Users can insert their own posts',
      'Users can update their own posts',
      'Users can delete their own posts',
      'Authenticated users can view all posts',
    ],
    likesTable: [
      'Users can insert their own likes',
      'Users can delete their own likes',
      'Authenticated users can view all likes',
    ],
    commentsTable: [
      'Users can insert their own comments',
      'Users can update their own comments',
      'Users can delete their own comments',
      'Authenticated users can view all comments',
    ],
    followsTable: [
      'Users can insert their own follows',
      'Users can delete their own follows',
      'Users can view their own followers/following',
    ],
    storiesTable: [
      'Users can insert their own stories',
      'Users can update their own stories',
      'Users can delete their own stories',
      'Authenticated users can view stories of users they follow',
    ],
    messagesTable: [
      'Users can view messages in conversations they are part of',
      'Users can insert messages to conversations they are part of',
      'Users can update their own messages',
    ],
    notificationsTable: [
      'Users can view their own notifications',
      'Users can update their own notifications',
      'System can insert notifications',
    ],
    savedPostsTable: [
      'Users can insert their own saved posts',
      'Users can delete their own saved posts',
      'Users can view their own saved posts',
    ],
  };

  // Validation rules
  static const Map<String, Map<String, dynamic>> validationRules = {
    profilesTable: {
      'username': {
        'min_length': 3,
        'max_length': 30,
        'pattern': r'^[a-zA-Z0-9_.]+$',
        'unique': true,
      },
      'display_name': {
        'max_length': 50,
      },
      'bio': {
        'max_length': AppConstants.maxBioLength,
      },
    },
    postsTable: {
      'caption': {
        'max_length': AppConstants.maxCaptionLength,
      },
    },
    commentsTable: {
      'content': {
        'max_length': AppConstants.maxCommentLength,
        'required': true,
      },
    },
    messagesTable: {
      'content': {
        'max_length': AppConstants.maxMessageLength,
        'required': true,
      },
    },
  };

  // File upload constraints
  static const Map<String, Map<String, dynamic>> fileConstraints = {
    profilesBucket: {
      'max_size_mb': 5,
      'allowed_extensions': ['.jpg', '.jpeg', '.png', '.webp'],
      'max_width': 1024,
      'max_height': 1024,
    },
    postsBucket: {
      'max_size_mb': AppConstants.maxImageSizeMB,
      'allowed_extensions': AppConstants.supportedImageExtensions,
      'max_width': 2048,
      'max_height': 2048,
    },
    storiesBucket: {
      'max_size_mb': 20,
      'allowed_extensions': [...AppConstants.supportedImageExtensions, ...AppConstants.supportedVideoExtensions],
      'max_width': 1080,
      'max_height': 1920,
    },
    messagesBucket: {
      'max_size_mb': 10,
      'allowed_extensions': [...AppConstants.supportedImageExtensions, ...AppConstants.supportedVideoExtensions],
    },
  };

  // Cache settings
  static const Map<String, Duration> cacheSettings = {
    profilesTable: AppConstants.profileCacheDuration,
    postsTable: AppConstants.feedCacheDuration,
    'images': AppConstants.imageCacheDuration,
  };

  // Pagination settings
  static const Map<String, int> paginationSettings = {
    'default_page_size': AppConstants.defaultPageSize,
    'max_page_size': AppConstants.maxPageSize,
    'search_page_size': AppConstants.searchPageSize,
  };
}

enum Environment {
  development,
  staging,
  production,
}

extension EnvironmentExtension on Environment {
  String get name {
    switch (this) {
      case Environment.development:
        return 'Development';
      case Environment.staging:
        return 'Staging';
      case Environment.production:
        return 'Production';
    }
  }

  bool get isDevelopment => this == Environment.development;
  bool get isStaging => this == Environment.staging;
  bool get isProduction => this == Environment.production;
}