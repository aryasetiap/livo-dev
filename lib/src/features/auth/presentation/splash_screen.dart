import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _navigateAfterDelay();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: AppConstants.mediumAnimation,
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: AppConstants.longAnimation,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    _fadeController.forward();
    _scaleController.forward();
  }

  void _navigateAfterDelay() {
    Future.delayed(AppConstants.splashAnimationDuration, () {
      if (mounted) {
        _checkAuthAndNavigate();
      }
    });
  }

  void _checkAuthAndNavigate() {
    final authState = ref.read(authProvider);

    if (authState.isInitial || authState.isLoading) {
      // Wait a bit more for auth to initialize
      ref.listen(authProvider, (previous, next) {
        if (next.isAuthenticated || next.isUnauthenticated || next.hasError) {
          _navigateToNextScreen(next);
        }
      });
    } else {
      _navigateToNextScreen(authState);
    }
  }

  void _navigateToNextScreen(authState) {
    if (authState.isAuthenticated) {
      // User is already logged in, navigate to home
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    } else if (authState.hasError) {
      // Show error and navigate to login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authState.error!),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (route) => false,
      );
    } else {
      // User is not logged in, check onboarding status
      _checkOnboardingStatus();
    }
  }

  void _checkOnboardingStatus() async {
    // TODO: Check if user has completed onboarding
    // For now, navigate to onboarding
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/onboarding',
      (route) => false,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppTheme.primaryGradient,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // Logo and Animation
                AnimatedBuilder(
                  animation: _fadeAnimation,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: AnimatedBuilder(
                        animation: _scaleAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _scaleAnimation.value,
                            child: child,
                          );
                        },
                        child: _buildLogoSection(),
                      ),
                    );
                  },
                ),

                const Spacer(flex: 1),

                // Loading indicator
                AnimatedBuilder(
                  animation: _fadeAnimation,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: child,
                    );
                  },
                  child: _buildLoadingSection(),
                ),

                const Spacer(flex: 1),

                // Version info
                AnimatedBuilder(
                  animation: _fadeAnimation,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: child,
                    );
                  },
                  child: _buildVersionSection(),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      children: [
        // App logo/icon
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.camera_alt,
            size: 60,
            color: AppTheme.primaryColor,
          ),
        ),

        const SizedBox(height: 24),

        // App name
        Text(
          AppConstants.appName,
          style: AppTypography.withColor(AppTypography.display3, Colors.white),
        ),

        const SizedBox(height: 8),

        // Tagline
        Text(
          'Share Your Moments',
          style: AppTypography.withColor(AppTypography.body1, Colors.white.withValues(alpha: 0.9)),
        ),
      ],
    );
  }

  Widget _buildLoadingSection() {
    return Column(
      children: [
        // Lottie animation or loading spinner
        SizedBox(
          width: 60,
          height: 60,
          child: _buildLottieAnimation(),
        ),

        const SizedBox(height: 16),

        // Loading text
        Text(
          'Loading amazing content...',
          style: AppTypography.withColor(AppTypography.body2, Colors.white.withValues(alpha: 0.8)),
        ),
      ],
    );
  }

  Widget _buildLottieAnimation() {
    // Try to load Lottie animation, fallback to CircularProgressIndicator if not available
    return FutureBuilder(
      future: _checkLottieFile(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return Lottie.asset(
            AppConstants.loadingAnimation,
            width: 60,
            height: 60,
            repeat: true,
            animate: true,
          );
        } else {
          return const CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          );
        }
      },
    );
  }

  Future<bool> _checkLottieFile() async {
    try {
      // Check if the Lottie file exists
      final composition = await AssetLottie(AppConstants.loadingAnimation).load();
      return true;
    } catch (e) {
      return false;
    }
  }

  Widget _buildVersionSection() {
    return Column(
      children: [
        Text(
          'Version ${AppConstants.appVersion}',
          style: AppTypography.withColor(AppTypography.caption2, Colors.white.withValues(alpha: 0.6)),
        ),
        const SizedBox(height: 4),
        Text(
          'Made with ❤️',
          style: AppTypography.withColor(AppTypography.caption2, Colors.white.withValues(alpha: 0.6)),
        ),
      ],
    );
  }
}

// Extension for Lottie asset preloading
extension LottieAssetExtension on Widget {
  static Future<void> precacheAsset(
    LottieBuilder widget,
    BuildContext context,
  ) async {
    try {
      // This is a placeholder for actual Lottie preloading
      // In a real implementation, you would use Lottie's composition API
      await Future.delayed(const Duration(milliseconds: 100));
    } catch (e) {
      // Ignore preloading errors
    }
  }
}