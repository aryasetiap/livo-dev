import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/models/post_model.dart';
import '../../../shared/providers/feed_provider.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../../shared/widgets/avatar_widget.dart';

class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({super.key});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final List<FileMedia> _selectedMedia = [];
  PostVisibility _visibility = PostVisibility.public;
  final List<String> _tags = [];
  bool _isCreating = false;

  @override
  void dispose() {
    _contentController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    final postCreationState = ref.watch(postCreationProvider);

    if (currentUser == null) {
      return _buildLoginRequired();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        actions: [
          // Post button
          TextButton(
            onPressed: _canCreatePost() && !_isCreating
                ? () => _createPost()
                : null,
            child: _isCreating
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : const Text('Post'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info
            _buildUserInfo(currentUser),

            const SizedBox(height: 16),

            // Content input
            _buildContentInput(),

            const SizedBox(height: 16),

            // Media section
            _buildMediaSection(),

            const SizedBox(height: 16),

            // Options
            _buildOptions(),

            const SizedBox(height: 24),

            // Tags
            _buildTagsSection(),

            const SizedBox(height: 32),

            // Error message
            if (postCreationState.hasError) ...[
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
                        postCreationState.error ?? 'An error occurred',
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
    );
  }

  Widget _buildLoginRequired() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
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
                'Sign in to create posts',
                style: AppTypography.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Create an account or sign in to share your thoughts with the world.',
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

  Widget _buildUserInfo(currentUser) {
    return Row(
      children: [
        AvatarWidget(
          imageUrl: currentUser.avatarUrl,
          username: currentUser.displayNameOrUsername,
          size: 48,
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
              const SizedBox(height: 2),
              Text(
                '@${currentUser.usernameOrEmail}',
                style: AppTypography.body2.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
        // Visibility selector
        DropdownButton<PostVisibility>(
          value: _visibility,
          onChanged: (value) {
            setState(() {
              _visibility = value!;
            });
          },
          items: PostVisibility.values.map((visibility) {
            return DropdownMenuItem(
              value: visibility,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getVisibilityIcon(visibility),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(_getVisibilityLabel(visibility)),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildContentInput() {
    return TextField(
      controller: _contentController,
      decoration: InputDecoration(
        hintText: 'What\'s on your mind?',
        border: InputBorder.none,
        hintStyle: AppTypography.body1.copyWith(
          color: AppTheme.textSecondary,
        ),
      ),
      style: AppTypography.body1,
      maxLines: null,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  Widget _buildMediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Media preview grid
        if (_selectedMedia.isNotEmpty) ...[
          Container(
            constraints: const BoxConstraints(
              maxHeight: 300,
            ),
            child: _buildMediaGrid(),
          ),
          const SizedBox(height: 12),
        ],

        // Media selection buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _pickMedia(ImageSource.gallery),
                icon: const Icon(Icons.photo_library_outlined),
                label: const Text('Gallery'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _pickMedia(ImageSource.camera),
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Camera'),
              ),
            ),
          ],
        ),

        // Media info
        if (_selectedMedia.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            '${_selectedMedia.length} file${_selectedMedia.length != 1 ? 's' : ''} selected',
            style: AppTypography.caption2.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMediaGrid() {
    final mediaCount = _selectedMedia.length;
    if (mediaCount == 1) {
      return _buildSingleMediaPreview(_selectedMedia.first);
    } else if (mediaCount == 2) {
      return SizedBox(
        height: 200,
        child: Row(
          children: _selectedMedia.asMap().entries.map((entry) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: entry.key == 0 ? 4 : 0,
                  left: entry.key == 1 ? 4 : 0,
                ),
                child: _buildMediaPreview(entry.value, entry.key),
              ),
            );
          }).toList(),
        ),
      );
    } else {
      return _buildMultipleMediaPreview();
    }
  }

  Widget _buildSingleMediaPreview(FileMedia media) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 300),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: media.isImage
                ? Image.file(
                    media.file,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Container(
                    color: Colors.black,
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ),
          ),
          // Remove button
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _removeMedia(0),
              child: Container(
                padding: const EdgeInsets.all(4),
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
        ],
      ),
    );
  }

  Widget _buildMediaPreview(FileMedia media, int index) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: media.isImage
                ? Image.file(
                    media.file,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Container(
                    color: Colors.black,
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
          ),
          // Remove button
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _removeMedia(index),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMultipleMediaPreview() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1,
      ),
      itemCount: _selectedMedia.length > 6 ? 6 : _selectedMedia.length,
      itemBuilder: (context, index) {
        if (index == 5 && _selectedMedia.length > 6) {
          // Show count overlay
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _selectedMedia[5].file,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '+${_selectedMedia.length - 6}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                _selectedMedia[index].file,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            if (index < 3) // Only show remove buttons for first 3
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () => _removeMedia(index),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        // Location
        TextField(
          controller: _locationController,
          decoration: InputDecoration(
            labelText: 'Location (optional)',
            hintText: 'Add location',
            prefixIcon: const Icon(Icons.location_on_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTagsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags',
          style: AppTypography.title2,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: _tags.map((tag) {
            return Chip(
              label: Text('#$tag'),
              onDeleted: () {
                setState(() {
                  _tags.remove(tag);
                });
              },
              deleteIcon: const Icon(Icons.close, size: 16),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _showAddTagDialog,
            icon: const Icon(Icons.add),
            label: const Text('Add Tag'),
          ),
        ),
      ],
    );
  }

  bool _canCreatePost() {
    return _contentController.text.trim().isNotEmpty || _selectedMedia.isNotEmpty;
  }

  Future<void> _pickMedia(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFiles = await picker.pickMultiImage();

      if (pickedFiles.isNotEmpty) {
        final remainingSlots = 10 - _selectedMedia.length;
        final filesToAdd = pickedFiles.take(remainingSlots);

        for (final pickedFile in filesToAdd) {
          final file = File(pickedFile.path);
          final fileMedia = FileMedia(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            file: file,
            type: MediaType.image,
            orderIndex: _selectedMedia.length,
          );
          _selectedMedia.add(fileMedia);
        }

        setState(() {});
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick media: ${e.toString()}'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  void _removeMedia(int index) {
    setState(() {
      _selectedMedia.removeAt(index);
      // Update order indices
      for (int i = 0; i < _selectedMedia.length; i++) {
        _selectedMedia[i] = _selectedMedia[i].copyWith(orderIndex: i);
      }
    });
  }

  void _showAddTagDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Tag'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Tag',
            hintText: 'Enter tag without #',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final tag = controller.text.trim().replaceAll('#', '');
              if (tag.isNotEmpty && !_tags.contains(tag)) {
                setState(() {
                  _tags.add(tag);
                });
              }
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _createPost() async {
    if (!_canCreatePost()) return;

    setState(() {
      _isCreating = true;
    });

    final request = CreatePostRequest(
      content: _contentController.text.trim(),
      media: _selectedMedia,
      visibility: _visibility,
      location: _locationController.text.trim().isEmpty ? null : _locationController.text.trim(),
      tags: _tags,
    );

    try {
      final post = await ref.read(postCreationProvider.notifier).createPost(request);

      if (post != null) {
        // Add to feed
        final feedPost = FeedPost(
          post: post,
          user: UserPostInfo(
            id: ref.read(currentUserProvider)!.id,
            username: ref.read(currentUserProvider)!.usernameOrEmail,
            displayName: ref.read(currentUserProvider)!.displayNameOrUsername,
            avatarUrl: ref.read(currentUserProvider)!.avatarUrl,
            isVerified: ref.read(currentUserProvider)!.isVerified,
          ),
        );
        ref.read(feedProvider.notifier).addPostToFeed(feedPost);

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Post created successfully!'),
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

  IconData _getVisibilityIcon(PostVisibility visibility) {
    switch (visibility) {
      case PostVisibility.public:
        return Icons.public;
      case PostVisibility.followers:
        return Icons.group;
      case PostVisibility.private:
        return Icons.lock;
    }
  }

  String _getVisibilityLabel(PostVisibility visibility) {
    switch (visibility) {
      case PostVisibility.public:
        return 'Public';
      case PostVisibility.followers:
        return 'Followers';
      case PostVisibility.private:
        return 'Private';
    }
  }
}