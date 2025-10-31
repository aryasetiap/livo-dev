import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/providers/profile_provider.dart';
import '../../../shared/widgets/avatar_widget.dart';
import '../../../shared/widgets/loading_widget.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _bioController = TextEditingController();
  final _websiteController = TextEditingController();
  final _locationController = TextEditingController();

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  bool _hasChanges = false;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _loadCurrentProfile();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: AppConstants.mediumAnimation,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));

    _fadeController.forward();
  }

  void _loadCurrentProfile() {
    final currentUser = ref.read(currentUserProfileProvider).user;
    if (currentUser != null) {
      _usernameController.text = currentUser.username ?? '';
      _displayNameController.text = currentUser.displayName ?? '';
      _bioController.text = currentUser.bio ?? '';
      _websiteController.text = currentUser.website ?? '';
      _locationController.text = currentUser.location ?? '';
    }

    // Listen for changes
    _usernameController.addListener(_onFieldChanged);
    _displayNameController.addListener(_onFieldChanged);
    _bioController.addListener(_onFieldChanged);
    _websiteController.addListener(_onFieldChanged);
    _locationController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    final currentUser = ref.read(currentUserProfileProvider).user;
    if (currentUser == null) return;

    final hasChanges =
        _usernameController.text != (currentUser.username ?? '') ||
        _displayNameController.text != (currentUser.displayName ?? '') ||
        _bioController.text != (currentUser.bio ?? '') ||
        _websiteController.text != (currentUser.website ?? '') ||
        _locationController.text != (currentUser.location ?? '');

    if (_hasChanges != hasChanges) {
      setState(() {
        _hasChanges = hasChanges;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _displayNameController.dispose();
    _bioController.dispose();
    _websiteController.dispose();
    _locationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(currentUserProfileProvider);
    final user = profileState.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
        actions: [
          if (_hasChanges)
            TextButton(
              onPressed: profileState.isUpdating ? null : _saveProfile,
              child: profileState.isUpdating
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                      ),
                    )
                  : const Text(
                      'Save',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
        ],
      ),
      body: user != null
          ? _buildForm(user, profileState)
          : const LoadingWidget(),
    );
  }

  Widget _buildForm(User user, profileState) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: child,
        );
      },
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile photo section
              _buildProfilePhotoSection(user, profileState),

              const SizedBox(height: 32),

              // Form fields
              _buildFormFields(),

              const SizedBox(height: 32),

              // Action buttons
              if (!_hasChanges) _buildAdditionalActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePhotoSection(User user, profileState) {
    return Center(
      child: Column(
        children: [
          // Avatar with edit button
          Stack(
            children: [
              AvatarWidget(
                imageUrl: user.avatarUrl,
                username: user.displayNameOrUsername,
                size: 100,
                showBorder: true,
                borderColor: AppTheme.primaryColor,
                borderWidth: 3,
                showShadow: true,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _pickProfilePhoto,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: _isUploading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Change photo button
          TextButton.icon(
            onPressed: _pickProfilePhoto,
            icon: const Icon(Icons.camera_alt),
            label: const Text('Change Photo'),
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.primaryColor,
            ),
          ),

          if (user.hasAvatar) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: _removeProfilePhoto,
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.errorColor,
              ),
              child: const Text('Remove Current Photo'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        // Username
        TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: 'Username',
            hintText: 'Enter your username',
            prefixIcon: Icon(Icons.alternate_email),
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          maxLength: 30,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Username is required';
            }
            if (value.trim().length < 3) {
              return 'Username must be at least 3 characters';
            }
            if (!RegExp(r'^[a-zA-Z0-9_.]+$').hasMatch(value.trim())) {
              return 'Username can only contain letters, numbers, underscores, and dots';
            }
            return null;
          },
          onChanged: (value) {
            // Convert to lowercase and remove spaces
            final cleaned = value.toLowerCase().replaceAll(' ', '');
            if (cleaned != value) {
              _usernameController.value = TextEditingValue(
                text: cleaned,
                selection: TextSelection.collapsed(offset: cleaned.length),
              );
            }
          },
        ),

        const SizedBox(height: 16),

        // Display name
        TextFormField(
          controller: _displayNameController,
          decoration: const InputDecoration(
            labelText: 'Display Name',
            hintText: 'Enter your display name',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          maxLength: 50,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value != null && value.trim().length > 50) {
              return 'Display name must be 50 characters or less';
            }
            return null;
          },
        ),

        const SizedBox(height: 16),

        // Bio
        TextFormField(
          controller: _bioController,
          decoration: const InputDecoration(
            labelText: 'Bio',
            hintText: 'Tell us about yourself',
            prefixIcon: Icon(Icons.info_outline),
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          maxLines: 3,
          maxLength: AppConstants.maxBioLength,
          textInputAction: TextInputAction.next,
          buildCounter: (context, {required currentLength, required isFocused, maxLength}) {
            return Text(
              '$currentLength/$maxLength',
              style: AppTypography.caption2,
            );
          },
        ),

        const SizedBox(height: 16),

        // Website
        TextFormField(
          controller: _websiteController,
          decoration: const InputDecoration(
            labelText: 'Website',
            hintText: 'https://example.com',
            prefixIcon: Icon(Icons.link),
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          keyboardType: TextInputType.url,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value != null && value.trim().isNotEmpty) {
              final url = value.trim();
              if (!url.startsWith('http://') && !url.startsWith('https://')) {
                return 'Please enter a valid URL starting with http:// or https://';
              }
            }
            return null;
          },
        ),

        const SizedBox(height: 16),

        // Location
        TextFormField(
          controller: _locationController,
          decoration: const InputDecoration(
            labelText: 'Location',
            hintText: 'City, Country',
            prefixIcon: Icon(Icons.location_on),
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }

  Widget _buildAdditionalActions() {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 16),

        // Account actions
        ListTile(
          leading: const Icon(Icons.lock_outline),
          title: const Text('Change Password'),
          trailing: const Icon(Icons.chevron_right),
          onTap: _changePassword,
        ),

        ListTile(
          leading: const Icon(Icons.privacy_tip_outlined),
          title: const Text('Privacy Settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: _privacySettings,
        ),

        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notification Settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: _notificationSettings,
        ),

        const SizedBox(height: 16),

        // Danger zone
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.errorColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Danger Zone',
                style: AppTypography.h2.copyWith(
                  color: AppTheme.errorColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Once you delete your account, there is no going back. Please be certain.',
                style: AppTypography.body2.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _deleteAccount,
                icon: const Icon(Icons.delete_forever),
                label: const Text('Delete Account'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.errorColor,
                  side: BorderSide(color: AppTheme.errorColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Action handlers
  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final success = await ref.read(currentUserProfileProvider.notifier).updateProfile(
      username: _usernameController.text.trim(),
      displayName: _displayNameController.text.trim(),
      bio: _bioController.text.trim(),
      website: _websiteController.text.trim(),
      location: _locationController.text.trim(),
    );

    if (success && mounted) {
      setState(() {
        _hasChanges = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: AppTheme.successColor,
        ),
      );

      Navigator.of(context).pop();
    } else if (mounted) {
      final error = ref.read(currentUserProfileProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error ?? 'Failed to update profile'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  Future<void> _pickProfilePhoto() async {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildImagePickerBottomSheet(),
    );
  }

  Widget _buildImagePickerBottomSheet() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take Photo'),
            onTap: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from Gallery'),
            onTap: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      setState(() {
        _isUploading = true;
      });

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        final success = await ref.read(currentUserProfileProvider.notifier).uploadProfilePhoto(image);

        if (!success && mounted) {
          final error = ref.read(currentUserProfileProvider).error;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error ?? 'Failed to upload photo'),
              backgroundColor: AppTheme.errorColor,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to pick image: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  Future<void> _removeProfilePhoto() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Profile Photo'),
        content: const Text('Are you sure you want to remove your profile photo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await ref.read(currentUserProfileProvider.notifier).removeProfilePhoto();

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile photo removed'),
            backgroundColor: AppTheme.successColor,
          ),
        );
      } else if (mounted) {
        final error = ref.read(currentUserProfileProvider).error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error ?? 'Failed to remove photo'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  void _changePassword() {
    // TODO: Implement change password functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Change password feature coming soon!')),
    );
  }

  void _privacySettings() {
    // TODO: Implement privacy settings
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Privacy settings feature coming soon!')),
    );
  }

  void _notificationSettings() {
    // TODO: Implement notification settings
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Notification settings feature coming soon!')),
    );
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone and all your data will be permanently deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _confirmDeleteAccount();
            },
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.errorColor,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Account Deletion'),
        content: const Text(
          'Type "DELETE" to confirm you want to permanently delete your account.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Implement actual account deletion
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Account deletion feature coming soon!'),
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.errorColor,
            ),
            child: const Text('Delete Account'),
          ),
        ],
      ),
    );
  }
}