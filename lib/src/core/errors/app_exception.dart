import '../constants/app_constants.dart';

// Base exception class
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  AppException(this.message, {this.code, this.originalError});

  @override
  String toString() => message;
}

// Network related exceptions
class NetworkException extends AppException {
  NetworkException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);

  factory NetworkException.noConnection() {
    return NetworkException(
      AppConstants.networkErrorMessage,
      code: 'NO_CONNECTION',
    );
  }

  factory NetworkException.timeout() {
    return NetworkException(
      'Request timed out. Please try again.',
      code: 'TIMEOUT',
    );
  }

  factory NetworkException.serverError({String? message}) {
    return NetworkException(
      message ?? AppConstants.serverErrorMessage,
      code: 'SERVER_ERROR',
    );
  }

  factory NetworkException.badRequest(String message) {
    return NetworkException(
      message,
      code: 'BAD_REQUEST',
    );
  }

  factory NetworkException.unauthorized(String message) {
    return NetworkException(
      message,
      code: 'UNAUTHORIZED',
    );
  }

  factory NetworkException.forbidden(String message) {
    return NetworkException(
      message,
      code: 'FORBIDDEN',
    );
  }

  factory NetworkException.notFound(String message) {
    return NetworkException(
      message,
      code: 'NOT_FOUND',
    );
  }
}

// Authentication related exceptions
class AuthException extends AppException {
  AuthException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);

  factory AuthException.invalidCredentials() {
    return AuthException(
      AppConstants.invalidCredentialsMessage,
      code: 'INVALID_CREDENTIALS',
    );
  }

  factory AuthException.userNotFound() {
    return AuthException(
      AppConstants.userNotFoundMessage,
      code: 'USER_NOT_FOUND',
    );
  }

  factory AuthException.emailAlreadyExists() {
    return AuthException(
      AppConstants.emailAlreadyExistsMessage,
      code: 'EMAIL_ALREADY_EXISTS',
    );
  }

  factory AuthException.usernameAlreadyExists() {
    return AuthException(
      AppConstants.usernameAlreadyExistsMessage,
      code: 'USERNAME_ALREADY_EXISTS',
    );
  }

  factory AuthException.weakPassword() {
    return AuthException(
      AppConstants.weakPasswordMessage,
      code: 'WEAK_PASSWORD',
    );
  }

  factory AuthException.invalidEmail() {
    return AuthException(
      AppConstants.invalidEmailMessage,
      code: 'INVALID_EMAIL',
    );
  }

  factory AuthException.invalidUsername() {
    return AuthException(
      AppConstants.invalidUsernameMessage,
      code: 'INVALID_USERNAME',
    );
  }

  factory AuthException.invalidPassword() {
    return AuthException(
      AppConstants.invalidPasswordMessage,
      code: 'INVALID_PASSWORD',
    );
  }

  factory AuthException.passwordsDoNotMatch() {
    return AuthException(
      AppConstants.passwordsDoNotMatchMessage,
      code: 'PASSWORDS_DO_NOT_MATCH',
    );
  }

  factory AuthException.sessionExpired() {
    return AuthException(
      AppConstants.sessionExpiredMessage,
      code: 'SESSION_EXPIRED',
    );
  }

  factory AuthException.accountDisabled() {
    return AuthException(
      'Your account has been disabled. Please contact support.',
      code: 'ACCOUNT_DISABLED',
    );
  }

  factory AuthException.emailNotVerified() {
    return AuthException(
      'Please verify your email address before continuing.',
      code: 'EMAIL_NOT_VERIFIED',
    );
  }
}

// Validation related exceptions
class ValidationException extends AppException {
  ValidationException(String message, {String? field, dynamic originalError})
      : super(message, code: field, originalError: originalError);

  factory ValidationException.requiredField(String fieldName) {
    return ValidationException(
      '$fieldName is required.',
      field: fieldName,
    );
  }

  factory ValidationException.invalidFormat(String fieldName, String format) {
    return ValidationException(
      'Invalid $fieldName format. Expected: $format',
      field: fieldName,
    );
  }

  factory ValidationException.tooShort(String fieldName, int minLength) {
    return ValidationException(
      '$fieldName must be at least $minLength characters long.',
      field: fieldName,
    );
  }

  factory ValidationException.tooLong(String fieldName, int maxLength) {
    return ValidationException(
      '$fieldName must be no more than $maxLength characters long.',
      field: fieldName,
    );
  }

  factory ValidationException.invalidRange(String fieldName, num min, num max) {
    return ValidationException(
      '$fieldName must be between $min and $max.',
      field: fieldName,
    );
  }
}

// Storage related exceptions
class StorageException extends AppException {
  StorageException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);

  factory StorageException.fileTooBig(int maxSizeMB) {
    return StorageException(
      'File is too big. Maximum size is $maxSizeMB MB.',
      code: 'FILE_TOO_BIG',
    );
  }

  factory StorageException.invalidFileType(List<String> allowedTypes) {
    final types = allowedTypes.join(', ');
    return StorageException(
      'Invalid file type. Allowed types: $types',
      code: 'INVALID_FILE_TYPE',
    );
  }

  factory StorageException.uploadFailed({String? reason}) {
    return StorageException(
      reason ?? 'File upload failed. Please try again.',
      code: 'UPLOAD_FAILED',
    );
  }

  factory StorageException.downloadFailed({String? reason}) {
    return StorageException(
      reason ?? 'File download failed. Please try again.',
      code: 'DOWNLOAD_FAILED',
    );
  }

  factory StorageException.quotaExceeded() {
    return StorageException(
      'Storage quota exceeded. Please delete some files and try again.',
      code: 'QUOTA_EXCEEDED',
    );
  }
}

// Permission related exceptions
class PermissionException extends AppException {
  PermissionException(String message, {String? permission, dynamic originalError})
      : super(message, code: permission, originalError: originalError);

  factory PermissionException.camera() {
    return PermissionException(
      'Camera permission is required to take photos.',
      permission: 'CAMERA',
    );
  }

  factory PermissionException.microphone() {
    return PermissionException(
      'Microphone permission is required to record audio.',
      permission: 'MICROPHONE',
    );
  }

  factory PermissionException.photos() {
    return PermissionException(
      'Photos permission is required to access your photo library.',
      permission: 'PHOTOS',
    );
  }

  factory PermissionException.storage() {
    return PermissionException(
      'Storage permission is required to save files.',
      permission: 'STORAGE',
    );
  }

  factory PermissionException.denied(String permission) {
    return PermissionException(
      '$permission permission was denied. Please enable it in settings.',
      permission: permission,
    );
  }
}

// Business logic exceptions
class BusinessException extends AppException {
  BusinessException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);

  factory BusinessException.userAlreadyFollowed() {
    return BusinessException(
      'You are already following this user.',
      code: 'ALREADY_FOLLOWED',
    );
  }

  factory BusinessException.userNotFollowed() {
    return BusinessException(
      'You are not following this user.',
      code: 'NOT_FOLLOWED',
    );
  }

  factory BusinessException.postAlreadyLiked() {
    return BusinessException(
      'You have already liked this post.',
      code: 'ALREADY_LIKED',
    );
  }

  factory BusinessException.postNotLiked() {
    return BusinessException(
      'You have not liked this post.',
      code: 'NOT_LIKED',
    );
  }

  factory BusinessException.postAlreadySaved() {
    return BusinessException(
      'You have already saved this post.',
      code: 'ALREADY_SAVED',
    );
  }

  factory BusinessException.postNotSaved() {
    return BusinessException(
      'You have not saved this post.',
      code: 'NOT_SAVED',
    );
  }

  factory BusinessException.storyExpired() {
    return BusinessException(
      'This story has expired.',
      code: 'STORY_EXPIRED',
    );
  }

  factory BusinessException.rateLimit() {
    return BusinessException(
      'Too many requests. Please try again later.',
      code: 'RATE_LIMIT',
    );
  }
}

// Exception handler utility
class ExceptionHandler {
  static AppException handleException(dynamic exception) {
    if (exception is AppException) {
      return exception;
    }

    // Handle common exceptions
    if (exception is FormatException) {
      return ValidationException.invalidFormat('input', 'valid format');
    }

    if (exception is ArgumentError) {
      return ValidationException(exception.message ?? 'Invalid argument');
    }

    if (exception is TimeoutException) {
      return NetworkException.timeout();
    }

    // Handle generic exceptions
    return AppException(
      AppConstants.genericErrorMessage,
      originalError: exception,
    );
  }

  static String getErrorMessage(dynamic exception) {
    final appException = handleException(exception);
    return appException.message;
  }

  static String getErrorCode(dynamic exception) {
    final appException = handleException(exception);
    return appException.code ?? 'UNKNOWN_ERROR';
  }
}

// Import required types
import 'dart:async';