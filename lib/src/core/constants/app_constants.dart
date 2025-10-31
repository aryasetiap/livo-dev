class AppConstants {
  // App Information
  static const String appName = 'Livo';
  static const String appVersion = '1.0.0';

  // Supabase Configuration - These will be loaded from environment
  static String supabaseUrl = 'YOUR_SUPABASE_URL';
  static String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';

  // API Endpoints
  static const String apiBaseUrl = 'https://api.livo.app';
  static const String apiVersion = 'v1';

  // Social Media Limits
  static const int maxBioLength = 150;
  static const int maxUsernameLength = 30;
  static const int maxCaptionLength = 2200;
  static const int maxCommentLength = 500;
  static const int maxMessageLength = 1000;

  // Media Limits
  static const int maxImageSizeMB = 10;
  static const int maxVideoSizeMB = 100;
  static const int maxImageUploadCount = 10;
  static const Duration maxStoryDuration = Duration(seconds: 30);
  static const Duration storyExpiryDuration = Duration(hours: 24);

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 50;
  static const int searchPageSize = 15;

  // Cache Settings
  static const Duration imageCacheDuration = Duration(days: 7);
  static const Duration profileCacheDuration = Duration(hours: 1);
  static const Duration feedCacheDuration = Duration(minutes: 5);

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 150);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  static const Duration splashAnimationDuration = Duration(seconds: 2);

  // Debounce Times
  static const Duration searchDebounce = Duration(milliseconds: 500);
  static const Duration typingDebounce = Duration(milliseconds: 300);
  static const Duration scrollDebounce = Duration(milliseconds: 100);

  // Network Timeouts
  static const Duration connectionTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
  static const Duration sendTimeout = Duration(seconds: 10);

  // Retry Settings
  static const int maxRetryAttempts = 3;
  static const Duration retryDelay = Duration(seconds: 1);

  // UI Dimensions
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;
  static const double borderRadiusXLarge = 16.0;
  static const double borderRadiusXXLarge = 24.0;

  static const double spacingXSmall = 4.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  static const double spacingXLarge = 32.0;
  static const double spacingXXLarge = 48.0;

  // Avatar Sizes
  static const double avatarSizeSmall = 32.0;
  static const double avatarSizeMedium = 48.0;
  static const double avatarSizeLarge = 64.0;
  static const double avatarSizeXLarge = 96.0;

  // Post Image Sizes
  static const double postImageHeight = 375.0;
  static const double thumbnailSize = 80.0;
  static const double gridImageSize = 120.0;

  // Story Sizes
  static const double storySize = 80.0;
  static const double storyRingWidth = 3.0;

  // Validation Patterns
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String usernamePattern = r'^[a-zA-Z0-9_.]{3,30}$';
  static const String passwordPattern = r'.{8,}'; // Minimum 8 characters

  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';
  static const String userProfileKey = 'user_profile';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language_code';
  static const String onboardingCompletedKey = 'onboarding_completed';

  // Shared Preferences Keys
  static const String prefsKey = 'livo_prefs';
  static const String cacheKey = 'livo_cache';

  // Error Messages
  static const String genericErrorMessage = 'Something went wrong. Please try again.';
  static const String networkErrorMessage = 'Please check your internet connection.';
  static const String serverErrorMessage = 'Server error. Please try again later.';
  static const String sessionExpiredMessage = 'Your session has expired. Please login again.';
  static const String invalidCredentialsMessage = 'Invalid email or password.';
  static const String userNotFoundMessage = 'User not found.';
  static const String emailAlreadyExistsMessage = 'Email already exists.';
  static const String usernameAlreadyExistsMessage = 'Username already exists.';
  static const String weakPasswordMessage = 'Password is too weak. Please use a stronger password.';
  static const String invalidEmailMessage = 'Please enter a valid email address.';
  static const String invalidUsernameMessage = 'Username must be 3-30 characters and can only contain letters, numbers, underscores, and dots.';
  static const String invalidPasswordMessage = 'Password must be at least 8 characters long.';
  static const String passwordsDoNotMatchMessage = 'Passwords do not match.';

  // Success Messages
  static const String loginSuccessMessage = 'Login successful!';
  static const String signupSuccessMessage = 'Account created successfully!';
  static const String logoutSuccessMessage = 'Logged out successfully!';
  static const String profileUpdatedMessage = 'Profile updated successfully!';
  static const String passwordResetSentMessage = 'Password reset email sent!';
  static const String passwordResetSuccessMessage = 'Password reset successfully!';
  static const String followSuccessMessage = 'Followed successfully!';
  static const String unfollowSuccessMessage = 'Unfollowed successfully!';
  static const String postUploadedMessage = 'Post uploaded successfully!';
  static const String storyUploadedMessage = 'Story uploaded successfully!';
  static const String commentPostedMessage = 'Comment posted successfully!';
  static const String messageSentMessage = 'Message sent successfully!';

  // Loading Messages
  static const String loginLoadingMessage = 'Logging in...';
  static const String signupLoadingMessage = 'Creating account...';
  static const String logoutLoadingMessage = 'Logging out...';
  static const String profileUpdateLoadingMessage = 'Updating profile...';
  static const String passwordResetLoadingMessage = 'Sending password reset email...';
  static const String postUploadLoadingMessage = 'Uploading post...';
  static const String storyUploadLoadingMessage = 'Uploading story...';
  static const String imageUploadLoadingMessage = 'Uploading image...';
  static const String videoUploadLoadingMessage = 'Uploading video...';

  // Social Login Providers
  static const String googleProvider = 'google';
  static const String facebookProvider = 'facebook';
  static const String twitterProvider = 'twitter';

  // Post Types
  static const String postTypeImage = 'image';
  static const String postTypeVideo = 'video';
  static const String postTypeCarousel = 'carousel';

  // Story Types
  static const String storyTypeImage = 'image';
  static const String storyTypeVideo = 'video';

  // Notification Types
  static const String notificationTypeLike = 'like';
  static const String notificationTypeComment = 'comment';
  static const String notificationTypeFollow = 'follow';
  static const String notificationTypeMessage = 'message';
  static const String notificationTypeMention = 'mention';
  static const String notificationTypePost = 'post';

  // Message Types
  static const String messageTypeText = 'text';
  static const String messageTypeImage = 'image';
  static const String messageTypeVideo = 'video';
  static const String messageTypeAudio = 'audio';

  // File Extensions
  static const List<String> supportedImageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
  static const List<String> supportedVideoExtensions = ['.mp4', '.mov', '.avi', '.mkv'];

  // Lottie Animation Paths
  static const String splashAnimation = 'assets/animations/splash.json';
  static const String onboardingAnimation1 = 'assets/animations/onboarding1.json';
  static const String onboardingAnimation2 = 'assets/animations/onboarding2.json';
  static const String onboardingAnimation3 = 'assets/animations/onboarding3.json';
  static const String loadingAnimation = 'assets/animations/loading.json';
  static const String successAnimation = 'assets/animations/success.json';
  static const String errorAnimation = 'assets/animations/error.json';
  static const String emptyAnimation = 'assets/animations/empty.json';
  static const String noInternetAnimation = 'assets/animations/no_internet.json';

  // Development & Debug
  static const bool enableLogging = true;
  static const bool enableNetworkLogging = false;
  static const bool enablePerformanceMonitoring = false;

  // Feature Flags
  static const bool enableStories = true;
  static const bool enableDirectMessaging = true;
  static const bool enablePushNotifications = true;
  static const bool enableVideoPosts = true;
  static const bool enableCarouselPosts = true;
  static const bool enableExplorePage = true;
  static const bool enableSavedPosts = true;
  static const bool enableArchivedPosts = true;

  // Private constructor to prevent instantiation
  AppConstants._();
}

// Import AppTheme for color references
import 'app_theme.dart';