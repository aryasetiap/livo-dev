import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/providers/auth_provider.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _emailSent = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: AppConstants.mediumAnimation,
      vsync: this,
    );

    _slideController = AnimationController(
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

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Future<void> _handleResetPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final success = await ref.read(authProvider.notifier).resetPassword(
          _emailController.text.trim(),
        );

    if (success && mounted) {
      setState(() {
        _emailSent = true;
      });
    }
  }

  void _navigateToLogin() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/login',
      (route) => false,
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.errorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Header with illustration
                  _buildHeader(),

                  const SizedBox(height: 40),

                  // Form content or success message
                  if (!_emailSent) ...[
                    _buildFormContent(authState),
                  ] else ...[
                    _buildSuccessContent(),
                  ],

                  const SizedBox(height: 40),

                  // Action buttons
                  if (!_emailSent) ...[
                    _buildResetButton(authState),
                  ] else ...[
                    _buildSuccessButtons(),
                  ],

                  const SizedBox(height: 32),

                  // Back to login link
                  _buildBackToLoginLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Reset password illustration
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(60),
          ),
          child: Icon(
            Icons.lock_reset,
            size: 60,
            color: AppTheme.primaryColor,
          ),
        ),

        const SizedBox(height: 24),

        // Title and description
        AnimatedBuilder(
          animation: _slideAnimation,
          builder: (context, child) {
            return SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: child,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _emailSent ? 'Check Your Email' : 'Reset Password',
                style: AppTypography.display3,
              ),
              const SizedBox(height: 8),
              Text(
                _emailSent
                    ? 'We\'ve sent password reset instructions to your email'
                    : 'Enter your email address and we\'ll send you a link to reset your password',
                style: AppTypography.body1.withColor(AppTheme.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormContent(AuthState authState) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: child,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Address',
            style: AppTypography.label1,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            decoration: const InputDecoration(
              labelText: 'Enter your email',
              hintText: 'example@email.com',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email address';
              }
              if (!RegExp(AppConstants.emailPattern).hasMatch(value.trim())) {
                return AppConstants.invalidEmailMessage;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessContent() {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.successColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 40,
                  color: AppTheme.successColor,
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'Email Sent Successfully!',
                style: AppTypography.h2,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                'We\'ve sent a password reset link to\n${_emailController.text}',
                style: AppTypography.body1.withColor(AppTheme.textSecondary),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              Text(
                'Didn\'t receive the email? Check your spam folder or try again.',
                style: AppTypography.body2.withColor(AppTheme.textSecondary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildResetButton(AuthState authState) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: child,
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: authState.isLoading ? null : _handleResetPassword,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: authState.isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  'Send Reset Link',
                  style: AppTypography.buttonLarge,
                ),
        ),
      ),
    );
  }

  Widget _buildSuccessButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _navigateToLogin,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Back to Login',
              style: AppTypography.buttonLarge,
            ),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                _emailSent = false;
                _emailController.clear();
              });
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Try Different Email',
              style: AppTypography.buttonLarge,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackToLoginLink() {
    return Center(
      child: TextButton.icon(
        onPressed: _navigateToLogin,
        icon: const Icon(Icons.arrow_back, size: 16),
        label: Text(
          'Back to Login',
          style: AppTypography.buttonMedium,
        ),
      ),
    );
  }
}