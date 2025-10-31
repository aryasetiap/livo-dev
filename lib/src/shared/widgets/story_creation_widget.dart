import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import '../models/story_model.dart';
import '../providers/story_provider.dart';
import '../providers/auth_provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';
import '../widgets/avatar_widget.dart';

class StoryCreationWidget extends ConsumerStatefulWidget {
  const StoryCreationWidget({super.key});

  @override
  ConsumerState<StoryCreationWidget> createState() => _StoryCreationWidgetState();
}

class _StoryCreationWidgetState extends ConsumerState<StoryCreationWidget> {
  FileStoryMedia? _selectedMedia;
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool _isCreating = false;

  @override
  void dispose() {
    _captionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    final storyCreationState = ref.watch(storyCreationProvider);

    if (currentUser == null) {
      return _buildLoginRequired();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Create Story'),
        actions: [
          // Create button
          TextButton(
            onPressed: _canCreateStory() && !_isCreating
                ? () => _createStory()
                : null,
            child: _isCreating
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Media preview
          Expanded(
            flex: 3,
            child: _buildMediaPreview(),
          ),

          // Content and options
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User info
                    _buildUserInfo(currentUser),

                    const SizedBox(height: 16),

                    // Caption input
                    _buildCaptionInput(),

                    const SizedBox(height: 16),

                    // Location input
                    _buildLocationInput(),

                    const SizedBox(height: 16),

                    // Media options
                    _buildMediaOptions(),

                    const SizedBox(height: 24),

                    // Error message
                    if (storyCreationState.hasError) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.errorColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.errorColor.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: AppTheme.errorColor,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                storyCreationState.error ?? 'An error occurred',
                                style: AppTypography.caption2.copyWith(
                                  color: AppTheme.errorColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginRequired() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Story'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.login_outlined,
                size: 64,
                color: AppTheme.textSecondary,
              ),
              const SizedBox(height: 16),
              Text(
                'Sign in to create stories',
                style: AppTypography.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Create an account or sign in to share your moments with the world.',
                style: AppTypography.body1.copyWith(
                  color: AppTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                  context.push('/auth');
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMediaPreview() {
    if (_selectedMedia == null) {
      return _buildMediaPicker();
    }

    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          // Media display
          if (_selectedMedia!.isImage)
            Image.file(
              _selectedMedia!.file,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )
          else
            Container(
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Video thumbnail (placeholder)
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black,
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ),
                  // Video duration indicator
                  if (_selectedMedia!.duration > 0)
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${_selectedMedia!.duration}s',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

          // Remove media button
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedMedia = null;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),

          // Add media button overlay
          if (_selectedMedia == null)
            Positioned.fill(
              child: GestureDetector(
                onTap: _showMediaPicker,
                child: Container(
                  color: Colors.black.withValues(alpha: 0.3),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 48,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add Photo or Video',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMediaPicker() {
    return GestureDetector(
      onTap: _showMediaPicker,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate,
              color: Colors.white,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              'Tap to add photo or video',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Stories disappear after 24 hours',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(currentUser) {
    return Row(
      children: [
        AvatarWidget(
          imageUrl: currentUser.avatarUrl,
          username: currentUser.displayNameOrUsername,
          size: 40,
          showBorder: true,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    currentUser.displayNameOrUsername,
                    style: AppTypography.title1.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (currentUser.isVerified) ...[
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.verified,
                      color: AppTheme.primaryColor,
                      size: 16,
                    ),
                  ],
                ],
              ),
              Text(
                'Your story',
                style: AppTypography.body2.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCaptionInput() {
    return TextField(
      controller: _captionController,
      decoration: InputDecoration(
        hintText: 'Add a caption...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      maxLines: 3,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget _buildLocationInput() {
    return TextField(
      controller: _locationController,
      decoration: InputDecoration(
        labelText: 'Add location (optional)',
        hintText: 'Where are you?',
        prefixIcon: const Icon(Icons.location_on_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }

  Widget _buildMediaOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Options',
          style: AppTypography.title2.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Add text overlay
                },
                icon: const Icon(Icons.text_fields),
                label: const Text('Add Text'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Add stickers/filters
                },
                icon: const Icon(Icons.face),
                label: const Text('Stickers'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Draw on story
                },
                icon: const Icon(Icons.brush),
                label: const Text('Draw'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Add music
                },
                icon: const Icon(Icons.music_note),
                label: const Text('Music'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _canCreateStory() {
    return _selectedMedia != null;
  }

  void _showMediaPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.borderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Text(
                      'Create Story',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

              // Options
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Camera option
                    ListTile(
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      title: const Text('Take Photo'),
                      subtitle: const Text('Capture a new moment'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _pickMedia(ImageSource.camera);
                      },
                    ),

                    // Gallery option
                    ListTile(
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.photo_library,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      title: const Text('Choose from Gallery'),
                      subtitle: const Text('Select existing photo or video'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _pickMedia(ImageSource.gallery);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickMedia(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 1080,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final media = FileStoryMedia(
          file: file,
          type: MediaType.image,
          duration: 15, // Default story duration
        );

        setState(() {
          _selectedMedia = media;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick media: ${e.toString()}'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  Future<void> _createStory() async {
    if (_selectedMedia == null) return;

    setState(() {
      _isCreating = true;
    });

    try {
      final request = CreateStoryRequest(
        media: _selectedMedia!.file,
        mediaType: _selectedMedia!.type,
        caption: _captionController.text.trim().isEmpty
            ? null
            : _captionController.text.trim(),
        location: _locationController.text.trim().isEmpty
            ? null
            : _locationController.text.trim(),
      );

      final story = await ref.read(storyCreationProvider.notifier).createStory(request);

      if (story != null) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Story created successfully!'),
            backgroundColor: AppTheme.successColor,
          ),
        );

        // Navigate back
        context.pop();
      }
    } catch (e) {
      // Error is handled by the provider state
    } finally {
      setState(() {
        _isCreating = false;
      });
    }
  }
}