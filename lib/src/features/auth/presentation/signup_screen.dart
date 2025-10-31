import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/providers/auth_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

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
    _usernameController.dispose();
    _displayNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_agreeToTerms) {
      _showErrorSnackBar('Please agree to the terms and conditions');
      return;
    }

    final success = await ref.read(authProvider.notifier).signUpWithEmail(
          email: _emailController.text.trim(),
          username: _usernameController.text.trim(),
          displayName: _displayNameController.text.trim(),
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
        );

    if (success && mounted) {
      _showSuccessSnackBar('Account created successfully!');
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    }
  }

  Future<void> _handleGoogleSignup() async {
    final success = await ref.read(authProvider.notifier).signInWithGoogle();

    if (success && mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    }
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _showTermsAndConditions() {
    // TODO: Show terms and conditions
    _showInfoSnackBar('Terms and conditions will be shown here');
  }

  void _showPrivacyPolicy() {
    // TODO: Show privacy policy
    _showInfoSnackBar('Privacy policy will be shown here');
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.errorColor,
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  void _showInfoSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.infoColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.white,
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

                  // Header
                  _buildHeader(),

                  const SizedBox(height: 24),

                  // Email field
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
                    child: _buildEmailField(),
                  ),

                  const SizedBox(height: 16),

                  // Username field
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
                    child: _buildUsernameField(),
                  ),

                  const SizedBox(height: 16),

                  // Display name field
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
                    child: _buildDisplayNameField(),
                  ),

                  const SizedBox(height: 16),

                  // Password field
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
                    child: _buildPasswordField(),
                  ),

                  const SizedBox(height: 16),

                  // Confirm password field
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
                    child: _buildConfirmPasswordField(),
                  ),

                  const SizedBox(height: 24),

                  // Terms and conditions
                  AnimatedBuilder(
                    animation: _slideAnimation,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: child,
                      );
                    },
                    child: _buildTermsAndConditions(),
                  ),

                  const SizedBox(height: 24),

                  // Sign up button
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
                    child: _buildSignupButton(authState),
                  ),

                  const SizedBox(height: 24),

                  // Divider
                  _buildDivider(),

                  const SizedBox(height: 24),

                  // Google signup button
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
                    child: _buildGoogleButton(authState),
                  ),

                  const SizedBox(height: 32),

                  // Login link
                  AnimatedBuilder(
                    animation: _slideAnimation,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: child,
                      );
                    },
                    child: _buildLoginLink(),
                  ),

                  const SizedBox(height: 20),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: AppTypography.display3,
        ),
        const SizedBox(height: 8),
        Text(
          'Join ${AppConstants.appName} and start sharing your moments',
          style: AppTypography.body1.withColor(AppTheme.textSecondary),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'Enter your email',
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
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.text,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      decoration: const InputDecoration(
        labelText: 'Username',
        hintText: 'Choose a username',
        prefixIcon: Icon(Icons.alternate_email),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter a username';
        }
        if (value.trim().length < 3) {
          return 'Username must be at least 3 characters long';
        }
        if (!RegExp(AppConstants.usernamePattern).hasMatch(value.trim())) {
          return AppConstants.invalidUsernameMessage;
        }
        return null;
      },
    );
  }

  Widget _buildDisplayNameField() {
    return TextFormField(
      controller: _displayNameController,
      keyboardType: TextInputType.text,
      autocorrect: true,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        labelText: 'Display Name',
        hintText: 'Your display name',
        prefixIcon: Icon(Icons.person_outline),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your display name';
        }
        if (value.trim().length > 50) {
          return 'Display name must be 50 characters or less';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Create a password',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          icon: Icon(
            _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        if (value.length < 8) {
          return AppConstants.invalidPasswordMessage;
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: _obscureConfirmPassword,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Confirm your password',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
          icon: Icon(
            _obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != _passwordController.text) {
          return AppConstants.passwordsDoNotMatchMessage;
        }
        return null;
      },
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      children: [
        Checkbox(
          value: _agreeToTerms,
          onChanged: (value) {
            setState(() {
              _agreeToTerms = value ?? false;
            });
          },
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'I agree to the ',
              style: AppTypography.body2,
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: _showTermsAndConditions,
                    child: Text(
                      'Terms and Conditions',
                      style: AppTypography.body2.withColor(AppTheme.primaryColor),
                    ),
                  ),
                ),
                const TextSpan(text: ' and '),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: _showPrivacyPolicy,
                    child: Text(
                      'Privacy Policy',
                      style: AppTypography.body2.withColor(AppTheme.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupButton(AuthState authState) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: authState.isLoading ? null : _handleSignup,
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
                'Sign Up',
                style: AppTypography.buttonLarge,
              ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR',
            style: AppTypography.caption1.withColor(AppTheme.textSecondary),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildGoogleButton(AuthState authState) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: authState.isLoading ? null : _handleGoogleSignup,
        icon: SizedBox(
          width: 20,
          height: 20,
          child: Image.asset(
            'assets/images/google_logo.png',
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.g_translate, size: 20);
            },
          ),
        ),
        label: authState.isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : Text(
                'Sign up with Google',
                style: AppTypography.buttonLarge,
              ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTypography.body2.withColor(AppTheme.textSecondary),
        ),
        TextButton(
          onPressed: _navigateToLogin,
          child: Text(
            'Sign In',
            style: AppTypography.buttonMedium,
          ),
        ),
      ],
    );
  }
}