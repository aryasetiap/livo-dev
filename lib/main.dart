import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/core/theme/app_theme.dart';
import 'src/core/constants/app_constants.dart';
import 'src/services/supabase_service.dart';
import 'src/features/auth/presentation/splash_screen.dart';
import 'src/features/auth/presentation/onboarding_screen.dart';
import 'src/features/auth/presentation/login_screen.dart';
import 'src/features/auth/presentation/signup_screen.dart';
import 'src/features/auth/presentation/reset_password_screen.dart';
import 'src/features/feed/presentation/feed_page.dart';
import 'src/features/profile/presentation/profile_page.dart';
import 'src/shared/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await SupabaseService.initialize();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    const ProviderScope(
      child: LivoApp(),
    ),
  );
}

class LivoApp extends ConsumerWidget {
  const LivoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: _router,
    );
  }
}

// Router configuration
final _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    // Splash screen
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),

    // Onboarding
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),

    // Authentication routes
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),

    GoRoute(
      path: '/reset-password',
      name: 'reset-password',
      builder: (context, state) => const ResetPasswordScreen(),
    ),

    // Main app routes (authenticated)
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const FeedPage(),
      redirect: (context, state) {
        final authState = context.read(authProvider);
        if (!authState.isAuthenticated) {
          return '/login';
        }
        return null;
      },
    ),

    GoRoute(
      path: '/profile/:userId',
      name: 'profile',
      builder: (context, state) {
        final userId = state.pathParameters['userId']!;
        return ProfilePage(userId: userId);
      },
      redirect: (context, state) {
        final authState = context.read(authProvider);
        if (!authState.isAuthenticated) {
          return '/login';
        }
        return null;
      },
    ),
  ],
  redirect: (context, state) {
    final authState = context.read(authProvider);

    // If user is not authenticated and not on auth routes, redirect to splash
    if (!authState.isAuthenticated &&
        !['/splash', '/onboarding', '/login', '/signup', '/reset-password'].contains(state.location.path)) {
      return '/splash';
    }

    // If user is authenticated and on auth routes, redirect to home
    if (authState.isAuthenticated &&
        ['/login', '/signup', '/reset-password'].contains(state.location.path)) {
      return '/home';
    }

    return null;
  },
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppTheme.errorColor,
          ),
          const SizedBox(height: 16),
          Text(
            'Oops! Something went wrong.',
            style: AppTypography.h1,
          ),
          const SizedBox(height: 8),
          Text(
            state.error.toString(),
            style: AppTypography.body2.withColor(AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Try to go to splash screen
              context.go('/splash');
            },
            child: const Text('Go to Home'),
          ),
        ],
      ),
    ),
  ),
);

// Placeholder screens for routes that aren't implemented yet
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/profile/current');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              size: 64,
              color: AppTheme.primaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Livo!',
              style: AppTypography.h1,
            ),
            SizedBox(height: 8),
            Text(
              'Your feed is being built...',
              style: AppTypography.body1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // TODO: Implement navigation
          switch (index) {
            case 0: // Home
              break;
            case 1: // Search
              break;
            case 2: // Post
              break;
            case 3: // Notifications
              break;
            case 4: // Profile
              context.push('/profile/current');
              break;
          }
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String userId;

  const ProfilePage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement settings
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 64,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              'Profile Page',
              style: AppTypography.h1,
            ),
            const SizedBox(height: 8),
            Text(
              'User ID: $userId',
              style: AppTypography.body2,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement sign out
                context.read(authProvider.notifier).signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
