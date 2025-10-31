import 'package:flutter/foundation.dart';
import 'supabase_config.dart';

class EnvironmentConfig {
  static EnvironmentConfig? _instance;
  static EnvironmentConfig get instance {
    _instance ??= EnvironmentConfig._();
    return _instance!;
  }

  EnvironmentConfig._() {
    _initializeFromEnvironment();
  }

  late final String supabaseUrl;
  late final String supabaseAnonKey;
  late final Environment environment;

  void _initializeFromEnvironment() {
    // In a real app, these would come from environment variables or a .env file
    // For now, we'll use the SupabaseConfig which handles environment switching

    if (kReleaseMode) {
      environment = Environment.production;
    } else if (kDebugMode) {
      environment = Environment.development;
    } else {
      environment = Environment.staging;
    }

    supabaseUrl = SupabaseConfig.url;
    supabaseAnonKey = SupabaseConfig.anonKey;

    // Update AppConstants with the correct values
    AppConstants.supabaseUrl = supabaseUrl;
    AppConstants.supabaseAnonKey = supabaseAnonKey;
  }

  // Configuration flags based on environment
  bool get isDebugMode => kDebugMode;
  bool get isReleaseMode => kReleaseMode;
  bool get isProfileMode => kProfileMode;

  bool get enableDebugLogging => isDebugMode;
  bool get enableNetworkLogging => isDebugMode;
  bool get enablePerformanceMonitoring => !isReleaseMode;

  // API endpoints that might differ by environment
  String get apiBaseUrl {
    switch (environment) {
      case Environment.development:
        return 'https://dev-api.livo.app';
      case Environment.staging:
        return 'https://staging-api.livo.app';
      case Environment.production:
        return 'https://api.livo.app';
    }
  }

  String get webUrl {
    switch (environment) {
      case Environment.development:
        return 'https://dev.livo.app';
      case Environment.staging:
        return 'https://staging.livo.app';
      case Environment.production:
        return 'https://livo.app';
    }
  }

  // Deep linking URLs
  String get deepLinkScheme => 'livo';
  String get callbackUrl => 'io.supabase.flutter://callback';

  // OAuth providers configuration
  Map<String, String> get oauthProviders {
    return {
      'google': callbackUrl,
      'facebook': callbackUrl,
      'twitter': callbackUrl,
    };
  }

  // Storage bucket names might differ by environment
  String get profilesBucket {
    return '${SupabaseConfig.profilesBucket}_${environment.name.toLowerCase()}';
  }

  String get postsBucket {
    return '${SupabaseConfig.postsBucket}_${environment.name.toLowerCase()}';
  }

  String get storiesBucket {
    return '${SupabaseConfig.storiesBucket}_${environment.name.toLowerCase()}';
  }

  String get messagesBucket {
    return '${SupabaseConfig.messagesBucket}_${environment.name.toLowerCase()}';
  }

  // Log configuration
  void log(String message, {String? tag}) {
    if (enableDebugLogging) {
      final prefix = tag != null ? '[$tag] ' : '';
      print('🔧 $prefix$message');
    }
  }

  void logError(String error, {String? tag, StackTrace? stackTrace}) {
    final prefix = tag != null ? '[$tag] ' : '';
    print('❌ $prefix$error');
    if (stackTrace != null && enableDebugLogging) {
      print('Stack trace: $stackTrace');
    }
  }

  void logNetwork(String method, String url, {int? statusCode, dynamic body}) {
    if (enableNetworkLogging) {
      final status = statusCode != null ? ' [$statusCode]' : '';
      print('🌐 $method $url$status');
      if (body != null && enableDebugLogging) {
        print('Response: $body');
      }
    }
  }

  void logPerformance(String operation, Duration duration) {
    if (enablePerformanceMonitoring) {
      print('⏱️ $operation took ${duration.inMilliseconds}ms');
    }
  }

  // Environment-specific feature flags
  bool get isFeatureEnabled(String feature) {
    // Feature flags can be controlled per environment
    switch (feature) {
      case 'stories':
        return environment != Environment.development; // Enable in non-dev
      case 'analytics':
        return environment == Environment.production;
      case 'crashlytics':
        return environment == Environment.production;
      case 'beta_features':
        return environment == Environment.development;
      default:
        return true;
    }
  }

  // Reset instance (useful for testing)
  static void reset() {
    _instance = null;
  }
}