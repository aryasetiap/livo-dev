import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';
import 'lottie_animation_widget.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final String? details;
  final VoidCallback? onRetry;
  final Widget? customIcon;
  final bool showRetryButton;

  const CustomErrorWidget({
    super.key,
    required this.message,
    this.details,
    this.onRetry,
    this.customIcon,
    this.showRetryButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error icon or animation
            if (customIcon != null)
              customIcon!
            else
              ErrorAnimation(size: 120),

            const SizedBox(height: 24),

            // Error message
            Text(
              message,
              style: AppTypography.h2,
              textAlign: TextAlign.center,
            ),

            if (details != null) ...[
              const SizedBox(height: 12),
              Text(
              details!,
              style: AppTypography.body2.copyWith(
              color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
              ),
            ],

            if (showRetryButton && onRetry != null) ...[
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],

            // Additional action buttons
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: _contactSupport,
                  icon: const Icon(Icons.help_outline),
                  label: const Text('Get Help'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _contactSupport() {
    // TODO: Implement contact support
  }
}

class NetworkErrorWidget extends StatelessWidget {
  final VoidCallback? onRetry;
  final String? customMessage;

  const NetworkErrorWidget({
    super.key,
    this.onRetry,
    this.customMessage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomErrorWidget(
      message: customMessage ?? 'No Internet Connection',
      details: 'Please check your internet connection and try again.',
      onRetry: onRetry,
      customIcon: const Icon(
        Icons.wifi_off,
        size: 80,
        color: AppTheme.errorColor,
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final IconData? icon;
  final Widget? customIllustration;

  const EmptyStateWidget({
    super.key,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.icon,
    this.customIllustration,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration or icon
            if (customIllustration != null)
              customIllustration!
            else if (icon != null)
              Icon(
                icon,
                size: 80,
                color: AppTheme.textSecondary,
              )
            else
              EmptyStateAnimation(
                message: message,
                size: 120,
              ),

            const SizedBox(height: 24),

            // Message
            Text(
              message,
              style: AppTypography.h2,
              textAlign: TextAlign.center,
            ),

            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback? onDismiss;
  final ErrorType type;

  const ErrorBanner({
    super.key,
    required this.message,
    this.onDismiss,
    this.type = ErrorType.error,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBackgroundColor();
    final icon = _getIcon();
    final iconColor = _getIconColor();

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: AppTypography.body2.copyWith(
                color: iconColor,
              ),
            ),
          ),
          if (onDismiss != null)
            IconButton(
              onPressed: onDismiss,
              icon: Icon(
                Icons.close,
                color: iconColor,
                size: 18,
              ),
              constraints: const BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ),
              padding: EdgeInsets.zero,
            ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case ErrorType.error:
        return AppTheme.errorColor.withValues(alpha: 0.1);
      case ErrorType.warning:
        return AppTheme.warningColor.withValues(alpha: 0.1);
      case ErrorType.info:
        return AppTheme.infoColor.withValues(alpha: 0.1);
      case ErrorType.success:
        return AppTheme.successColor.withValues(alpha: 0.1);
    }
  }

  IconData _getIcon() {
    switch (type) {
      case ErrorType.error:
        return Icons.error_outline;
      case ErrorType.warning:
        return Icons.warning_outlined;
      case ErrorType.info:
        return Icons.info_outline;
      case ErrorType.success:
        return Icons.check_circle_outline;
    }
  }

  Color _getIconColor() {
    switch (type) {
      case ErrorType.error:
        return AppTheme.errorColor;
      case ErrorType.warning:
        return AppTheme.warningColor;
      case ErrorType.info:
        return AppTheme.infoColor;
      case ErrorType.success:
        return AppTheme.successColor;
    }
  }
}

class InlineErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final bool showIcon;

  const InlineErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (showIcon) ...[
            Icon(
              Icons.error_outline,
              color: AppTheme.errorColor,
              size: 20,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              message,
              style: AppTypography.body2.copyWith(
                color: AppTheme.errorColor,
              ),
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(width: 8),
            TextButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}

class FormErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onDismiss;

  const FormErrorWidget({
    super.key,
    required this.message,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.errorColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppTheme.errorColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: AppTheme.errorColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: AppTypography.caption2.copyWith(
                color: AppTheme.errorColor,
              ),
            ),
          ),
          if (onDismiss != null)
            IconButton(
              onPressed: onDismiss,
              icon: Icon(
                Icons.close,
                color: AppTheme.errorColor,
                size: 16,
              ),
              constraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
              padding: EdgeInsets.zero,
            ),
        ],
      ),
    );
  }
}

enum ErrorType {
  error,
  warning,
  info,
  success,
}

// Error boundary widget for catching and displaying errors
class ErrorBoundary extends StatefulWidget {
  final Widget child;
  final Widget Function(dynamic error, StackTrace? stackTrace)? errorBuilder;
  final void Function(dynamic error, StackTrace? stackTrace)? onError;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.errorBuilder,
    this.onError,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  dynamic _error;
  StackTrace? _stackTrace;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null && widget.errorBuilder != null) {
      return widget.errorBuilder!(_error, _stackTrace);
    }

    return widget.child;
  }

  void _handleError(dynamic error, StackTrace? stackTrace) {
    setState(() {
      _error = error;
      _stackTrace = stackTrace;
    });

    widget.onError?.call(error, stackTrace);
  }
}

// Utility function to show error dialog
void showErrorDialog(
  BuildContext context, {
  required String title,
  required String message,
  String? details,
  VoidCallback? onRetry,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          if (details != null) ...[
            const SizedBox(height: 16),
            Text(
              'Details:',
              style: AppTypography.caption1.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              details!,
              style: AppTypography.caption2.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
        if (onRetry != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onRetry!();
            },
            child: const Text('Retry'),
          ),
      ],
    ),
  );
}

// Utility function to show error snackbar
void showErrorSnackBar(
  BuildContext context, {
  required String message,
  VoidCallback? onRetry,
  Duration duration = const Duration(seconds: 4),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppTheme.errorColor,
      duration: duration,
      action: onRetry != null
          ? SnackBarAction(
              label: 'Retry',
              onPressed: onRetry,
              textColor: Colors.white,
            )
          : null,
    ),
  );
}