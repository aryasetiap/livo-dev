import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class LottieAnimationWidget extends StatefulWidget {
  final String animationPath;
  final double? width;
  final double? height;
  final bool repeat;
  final bool animate;
  final Duration? duration;
  final VoidCallback? onComplete;

  const LottieAnimationWidget({
    super.key,
    required this.animationPath,
    this.width,
    this.height,
    this.repeat = true,
    this.animate = true,
    this.duration,
    this.onComplete,
  });

  @override
  State<LottieAnimationWidget> createState() => _LottieAnimationWidgetState();
}

class _LottieAnimationWidgetState extends State<LottieAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(seconds: 1),
      vsync: this,
    );

    if (widget.animate) {
      _loadAnimation();
    }
  }

  @override
  void didUpdateWidget(LottieAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animationPath != widget.animationPath) {
      _loadAnimation();
    }
    if (oldWidget.animate != widget.animate) {
      if (widget.animate) {
        _controller.forward();
      } else {
        _controller.stop();
      }
    }
  }

  void _loadAnimation() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      // Preload the animation
      await _loadLottieAsset();

      if (widget.animate) {
        _controller.reset();
        _controller.forward();
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  Future<void> _loadLottieAsset() async {
    // Try to load the Lottie asset
    // This is a placeholder for actual Lottie loading
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildLoadingWidget();
    }

    if (_hasError) {
      return _buildErrorWidget();
    }

    return _buildLottieWidget();
  }

  Widget _buildLoadingWidget() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppTheme.shimmerBaseColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppTheme.errorColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(
          Icons.error_outline,
          size: (widget.width ?? 100) * 0.3,
          color: AppTheme.errorColor,
        ),
      ),
    );
  }

  Widget _buildLottieWidget() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: FutureBuilder(
        future: _checkLottieFile(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return Lottie.asset(
              widget.animationPath,
              width: widget.width,
              height: widget.height,
              controller: _controller,
              repeat: widget.repeat,
              animate: widget.animate,
              onLoaded: (composition) {
                if (widget.duration != null) {
                  _controller.duration = widget.duration;
                } else {
                  _controller.duration = composition.duration;
                }
                if (widget.animate) {
                  _controller.forward();
                }
              },
              onComplete: widget.onComplete,
            );
          } else {
            return _buildFallbackWidget();
          }
        },
      ),
    );
  }

  Future<bool> _checkLottieFile() async {
    try {
      // Check if the Lottie file exists
      await DefaultAssetBundle.of(context).loadString(widget.animationPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  Widget _buildFallbackWidget() {
    final animationType = _getAnimationType();

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: _buildFallbackIcon(animationType),
      ),
    );
  }

  Widget _buildFallbackIcon(LottieAnimationType type) {
    switch (type) {
      case LottieAnimationType.splash:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: (widget.width ?? 100) * 0.4,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              AppConstants.appName,
              style: AppTypography.title2.withColor(AppTheme.primaryColor),
            ),
          ],
        );

      case LottieAnimationType.onboarding:
        return Icon(
          Icons.auto_awesome,
          size: (widget.width ?? 100) * 0.5,
          color: AppTheme.primaryColor,
        );

      case LottieAnimationType.loading:
        return SizedBox(
          width: (widget.width ?? 100) * 0.4,
          height: (widget.width ?? 100) * 0.4,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
          ),
        );

      case LottieAnimationType.success:
        return Icon(
          Icons.check_circle,
          size: (widget.width ?? 100) * 0.6,
          color: AppTheme.successColor,
        );

      case LottieAnimationType.error:
        return Icon(
          Icons.error,
          size: (widget.width ?? 100) * 0.6,
          color: AppTheme.errorColor,
        );

      case LottieAnimationType.empty:
        return Icon(
          Icons.inbox_outlined,
          size: (widget.width ?? 100) * 0.5,
          color: AppTheme.textSecondary,
        );

      case LottieAnimationType.noInternet:
        return Icon(
          Icons.wifi_off,
          size: (widget.width ?? 100) * 0.5,
          color: AppTheme.errorColor,
        );
    }
  }

  LottieAnimationType _getAnimationType() {
    if (widget.animationPath.contains('splash')) {
      return LottieAnimationType.splash;
    } else if (widget.animationPath.contains('onboarding')) {
      return LottieAnimationType.onboarding;
    } else if (widget.animationPath.contains('loading')) {
      return LottieAnimationType.loading;
    } else if (widget.animationPath.contains('success')) {
      return LottieAnimationType.success;
    } else if (widget.animationPath.contains('error')) {
      return LottieAnimationType.error;
    } else if (widget.animationPath.contains('empty')) {
      return LottieAnimationType.empty;
    } else if (widget.animationPath.contains('no_internet')) {
      return LottieAnimationType.noInternet;
    }
    return LottieAnimationType.onboarding;
  }
}

enum LottieAnimationType {
  splash,
  onboarding,
  loading,
  success,
  error,
  empty,
  noInternet,
}

// Pre-built animation widgets for common use cases
class SplashAnimation extends StatelessWidget {
  final double? size;
  final VoidCallback? onComplete;

  const SplashAnimation({
    super.key,
    this.size,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return LottieAnimationWidget(
      animationPath: AppConstants.splashAnimation,
      width: size ?? 200,
      height: size ?? 200,
      repeat: false,
      animate: true,
      onComplete: onComplete,
    );
  }
}

class OnboardingAnimation extends StatelessWidget {
  final int index;
  final double? size;

  const OnboardingAnimation({
    super.key,
    required this.index,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    String animationPath;
    switch (index) {
      case 0:
        animationPath = AppConstants.onboardingAnimation1;
        break;
      case 1:
        animationPath = AppConstants.onboardingAnimation2;
        break;
      case 2:
      default:
        animationPath = AppConstants.onboardingAnimation3;
        break;
    }

    return LottieAnimationWidget(
      animationPath: animationPath,
      width: size ?? 280,
      height: size ?? 280,
      repeat: true,
      animate: true,
    );
  }
}

class LoadingAnimation extends StatelessWidget {
  final double? size;

  const LoadingAnimation({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return LottieAnimationWidget(
      animationPath: AppConstants.loadingAnimation,
      width: size ?? 60,
      height: size ?? 60,
      repeat: true,
      animate: true,
    );
  }
}

class SuccessAnimation extends StatelessWidget {
  final double? size;
  final VoidCallback? onComplete;

  const SuccessAnimation({
    super.key,
    this.size,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return LottieAnimationWidget(
      animationPath: AppConstants.successAnimation,
      width: size ?? 150,
      height: size ?? 150,
      repeat: false,
      animate: true,
      onComplete: onComplete,
    );
  }
}

class ErrorAnimation extends StatelessWidget {
  final double? size;

  const ErrorAnimation({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return LottieAnimationWidget(
      animationPath: AppConstants.errorAnimation,
      width: size ?? 150,
      height: size ?? 150,
      repeat: false,
      animate: true,
    );
  }
}

class EmptyStateAnimation extends StatelessWidget {
  final double? size;
  final String? message;

  const EmptyStateAnimation({
    super.key,
    this.size,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LottieAnimationWidget(
          animationPath: AppConstants.emptyAnimation,
          width: size ?? 200,
          height: size ?? 200,
          repeat: false,
          animate: true,
        ),
        if (message != null) ...[
          const SizedBox(height: 16),
          Text(
            message!,
            style: AppTypography.body1.withColor(AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}