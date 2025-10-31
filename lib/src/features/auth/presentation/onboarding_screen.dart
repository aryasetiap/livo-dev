import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/constants/app_constants.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: 'Capture Moments',
      description: 'Share your life through beautiful photos and videos with friends and family.',
      animationPath: AppConstants.onboardingAnimation1,
      icon: Icons.camera_alt,
    ),
    OnboardingItem(
      title: 'Connect & Share',
      description: 'Follow friends, discover amazing content, and share your own stories.',
      animationPath: AppConstants.onboardingAnimation2,
      icon: Icons.share,
    ),
    OnboardingItem(
      title: 'Express Yourself',
      description: 'Show your creativity with filters, effects, and interactive stories.',
      animationPath: AppConstants.onboardingAnimation3,
      icon: Icons.palette,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      duration: AppConstants.longAnimation,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    _animationController.reset();
    _animationController.forward();
  }

  void _nextPage() {
    if (_currentPage < _onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: AppConstants.mediumAnimation,
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  void _completeOnboarding() async {
    // TODO: Save onboarding completion status
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/signup',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Column(
            children: [
              // Skip button
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: _skipOnboarding,
                    child: Text(
                      'Skip',
                      style: AppTypography.withColor(AppTypography.buttonMedium, AppTheme.textSecondary),
                    ),
                  ),
                ),
              ),

              // Page view
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _onboardingItems.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      item: _onboardingItems[index],
                      animationController: _animationController,
                    );
                  },
                ),
              ),

              // Bottom section with indicators and buttons
              _buildBottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Page indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingItems.length,
              (index) => _buildIndicator(index),
            ),
          ),

          const SizedBox(height: 32),

          // Action buttons
          Row(
            children: [
              // Previous button (only show after first page)
              if (_currentPage > 0)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: AppConstants.mediumAnimation,
                        curve: Curves.easeInOut,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Previous'),
                  ),
                ),

              if (_currentPage > 0) const SizedBox(width: 16),

              // Next/Get Started button
              Expanded(
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    _currentPage == _onboardingItems.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style: AppTypography.buttonLarge,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(int index) {
    final isActive = index == _currentPage;
    return AnimatedContainer(
      duration: AppConstants.shortAnimation,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primaryColor : AppTheme.borderColor,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;
  final AnimationController animationController;

  const OnboardingPage({
    super.key,
    required this.item,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),

          // Animation or Icon
          _buildAnimation(),

          const SizedBox(height: 40),

          // Title
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: animationController,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.3),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Curves.easeOut,
                  )),
                  child: child,
                ),
              );
            },
            child: Text(
              item.title,
              style: AppTypography.display2,
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 16),

          // Description
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: animationController,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.3),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Curves.easeOut,
                  )),
                  child: child,
                ),
              );
            },
            child: Text(
              item.description,
              style: AppTypography.withColor(AppTypography.body1, AppTheme.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildAnimation() {
    return SizedBox(
      width: 280,
      height: 280,
      child: FutureBuilder(
        future: _checkLottieFile(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return Lottie.asset(
              item.animationPath,
              width: 280,
              height: 280,
              repeat: true,
              animate: true,
            );
          } else {
            return _buildFallbackIcon();
          }
        },
      ),
    );
  }

  Future<bool> _checkLottieFile() async {
    try {
      final composition = await AssetLottie(item.animationPath).load();
      return true;
    } catch (e) {
      return false;
    }
  }

  Widget _buildFallbackIcon() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        item.icon,
        size: 80,
        color: AppTheme.primaryColor,
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String animationPath;
  final IconData icon;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.animationPath,
    required this.icon,
  });
}