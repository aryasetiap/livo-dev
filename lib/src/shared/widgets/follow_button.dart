import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../providers/profile_provider.dart';
import '../providers/auth_provider.dart';

class FollowButton extends ConsumerWidget {
  final User user;
  final bool showText;
  final bool showBorder;
  final bool isLoading;
  final VoidCallback? onFollowComplete;
  final VoidCallback? onUnfollowComplete;

  const FollowButton({
    super.key,
    required this.user,
    this.showText = true,
    this.showBorder = false,
    this.isLoading = false,
    this.onFollowComplete,
    this.onUnfollowComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProfileProvider).user;
    final isFollowing = user.isFollowing;

    // Don't show follow button for current user
    if (currentUser?.id == user.id) {
      return const SizedBox.shrink();
    }

    if (isLoading) {
      return _buildLoadingButton();
    }

    return isFollowing ? _buildUnfollowButton(context, ref) : _buildFollowButton(context, ref);
  }

  Widget _buildFollowButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => _handleFollow(ref),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        side: showBorder ? BorderSide(color: AppTheme.primaryColor) : null,
        padding: EdgeInsets.symmetric(
          horizontal: showText ? 24 : 16,
          vertical: 12,
        ),
      ),
      child: showText
          ? const Text(
              'Follow',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          : const Icon(
              Icons.add,
              size: 18,
            ),
    );
  }

  Widget _buildUnfollowButton(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: () => _handleUnfollow(ref),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.textSecondary,
        side: const BorderSide(color: AppTheme.borderColor),
        padding: EdgeInsets.symmetric(
          horizontal: showText ? 24 : 16,
          vertical: 12,
        ),
      ),
      child: showText
          ? const Text(
              'Following',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          : const Icon(
              Icons.check,
              size: 18,
            ),
    );
  }

  Widget _buildLoadingButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }

  Future<void> _handleFollow(WidgetRef ref) async {
    try {
      final success = await ref.read(profileProviderFamily(user.id).notifier).followUser(user.id);

      if (success) {
        onFollowComplete?.call();
        _showSuccessSnackBar('Following ${user.displayNameOrUsername}');
      }
    } catch (e) {
      _showErrorSnackBar('Failed to follow user');
    }
  }

  Future<void> _handleUnfollow(WidgetRef ref) async {
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: ref.context,
      builder: (context) => AlertDialog(
        title: Text('Unfollow ${user.displayNameOrUsername}?'),
        content: Text('Are you sure you want to unfollow ${user.displayNameOrUsername}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.errorColor,
            ),
            child: const Text('Unfollow'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final success = await ref.read(profileProviderFamily(user.id).notifier).unfollowUser(user.id);

        if (success) {
          onUnfollowComplete?.call();
          _showSuccessSnackBar('Unfollowed ${user.displayNameOrUsername}');
        }
      } catch (e) {
        _showErrorSnackBar('Failed to unfollow user');
      }
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(ref.context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.successColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(ref.context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.errorColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

// Small follow button for compact layouts
class SmallFollowButton extends ConsumerWidget {
  final User user;
  final VoidCallback? onFollowComplete;
  final VoidCallback? onUnfollowComplete;

  const SmallFollowButton({
    super.key,
    required this.user,
    this.onFollowComplete,
    this.onUnfollowComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProfileProvider).user;
    final isFollowing = user.isFollowing;

    // Don't show follow button for current user
    if (currentUser?.id == user.id) {
      return const SizedBox.shrink();
    }

    return isFollowing ? _buildSmallUnfollowButton(ref) : _buildSmallFollowButton(ref);
  }

  Widget _buildSmallFollowButton(WidgetRef ref) {
    return InkWell(
      onTap: () => _handleFollow(ref),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          'Follow',
          style: AppTypography.caption2.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSmallUnfollowButton(WidgetRef ref) {
    return InkWell(
      onTap: () => _handleUnfollow(ref),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppTheme.borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          'Following',
          style: AppTypography.caption2.copyWith(
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Future<void> _handleFollow(WidgetRef ref) async {
    try {
      final success = await ref.read(profileProviderFamily(user.id).notifier).followUser(user.id);
      if (success) {
        onFollowComplete?.call();
      }
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _handleUnfollow(WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: ref.context,
      builder: (context) => AlertDialog(
        title: Text('Unfollow ${user.displayNameOrUsername}?'),
        content: Text('Are you sure you want to unfollow ${user.displayNameOrUsername}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.errorColor,
            ),
            child: const Text('Unfollow'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final success = await ref.read(profileProviderFamily(user.id).notifier).unfollowUser(user.id);
        if (success) {
          onUnfollowComplete?.call();
        }
      } catch (e) {
        // Handle error silently
      }
    }
  }
}

// Follow button with animation
class AnimatedFollowButton extends StatefulWidget {
  final User user;
  final bool showText;
  final VoidCallback? onFollowComplete;
  final VoidCallback? onUnfollowComplete;

  const AnimatedFollowButton({
    super.key,
    required this.user,
    this.showText = true,
    this.onFollowComplete,
    this.onUnfollowComplete,
  });

  @override
  State<AnimatedFollowButton> createState() => _AnimatedFollowButtonState();
}

class _AnimatedFollowButtonState extends State<AnimatedFollowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: child,
          ),
        );
      },
      child: FollowButton(
        user: widget.user,
        showText: widget.showText,
        isLoading: _isAnimating,
        onFollowComplete: () {
          _animateButton();
          widget.onFollowComplete?.call();
        },
        onUnfollowComplete: () {
          _animateButton();
          widget.onUnfollowComplete?.call();
        },
      ),
    );
  }

  void _animateButton() {
    setState(() {
      _isAnimating = true;
    });

    _animationController.forward().then((_) {
      _animationController.reverse().then((_) {
        setState(() {
          _isAnimating = false;
        });
      });
    });
  }
}

// Follow status chip
class FollowStatusChip extends ConsumerWidget {
  final User user;

  const FollowStatusChip({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProfileProvider).user;
    final isFollowing = user.isFollowing;

    // Don't show status for current user
    if (currentUser?.id == user.id) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isFollowing ? AppTheme.successColor.withValues(alpha: 0.1) : AppTheme.borderColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isFollowing ? AppTheme.successColor : AppTheme.borderColor,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isFollowing ? Icons.check_circle : Icons.add_circle_outline,
            size: 16,
            color: isFollowing ? AppTheme.successColor : AppTheme.textSecondary,
          ),
          const SizedBox(width: 4),
          Text(
            isFollowing ? 'Following' : 'Follow',
            style: AppTypography.caption2.copyWith(
              color: isFollowing ? AppTheme.successColor : AppTheme.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}