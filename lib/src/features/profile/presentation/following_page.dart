import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/models/user_model.dart';
import '../../../../shared/providers/profile_provider.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/avatar_widget.dart';

class FollowingPage extends ConsumerWidget {
  final String userId;

  const FollowingPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followingState = ref.watch(followingProviderFamily(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Following'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshFollowing(ref),
        child: _buildFollowingList(context, ref, followingState),
      ),
    );
  }

  Widget _buildFollowingList(BuildContext context, WidgetRef ref, followingState) {
    if (followingState.isLoading && followingState.following.isEmpty) {
      return const LoadingWidget();
    }

    if (followingState.hasError) {
      return CustomErrorWidget(
        message: followingState.error!,
        onRetry: () => ref.read(followingProviderFamily(userId).notifier).refreshFollowing(userId),
      );
    }

    if (followingState.isEmpty) {
      return EmptyStateWidget(
        message: 'Not following anyone yet',
        icon: Icons.person_add_outlined,
        actionLabel: 'Discover People',
        onAction: () {
          // TODO: Navigate to discover page
        },
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo is ScrollEndNotification &&
            scrollInfo.metrics.extentAfter == 0) {
          // Load more when reaching the end
          ref.read(followingProviderFamily(userId).notifier).loadMoreFollowing(userId);
        }
        return false;
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: followingState.following.length + (followingState.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == followingState.following.length && followingState.hasMore) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final user = followingState.following[index];
          return _buildUserTile(user);
        },
      ),
    );
  }

  Widget _buildUserTile(User user) {
    return ListTile(
      leading: AvatarWidget(
        imageUrl: user.avatarUrl,
        username: user.displayNameOrUsername,
        size: 48,
        showBorder: true,
      ),
      title: Text(
        user.displayNameOrUsername,
        style: AppTypography.title1,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@${user.usernameOrEmail}',
            style: AppTypography.body2,
          ),
          if (user.hasBio) ...[
            const SizedBox(height: 2),
            Text(
              user.bio!,
              style: AppTypography.caption2.copyWith(
                color: AppTheme.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (user.isVerified)
            const Icon(
              Icons.verified,
              color: AppTheme.primaryColor,
              size: 16,
            ),
          if (user.followersCount > 0) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                user.formattedFollowersCount,
                style: AppTypography.caption2.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
      onTap: () {
        // TODO: Navigate to user profile
      },
    );
  }

  Future<void> _refreshFollowing(WidgetRef ref) async {
    await ref.read(followingProviderFamily(userId).notifier).refreshFollowing(userId);
  }
}