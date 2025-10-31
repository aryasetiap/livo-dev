import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/models/user_model.dart';
import '../../../../shared/providers/profile_provider.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/avatar_widget.dart';

class FollowersPage extends ConsumerWidget {
  final String userId;

  const FollowersPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followersState = ref.watch(followersProviderFamily(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Followers'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshFollowers(ref),
        child: _buildFollowersList(context, ref, followersState),
      ),
    );
  }

  Widget _buildFollowersList(BuildContext context, WidgetRef ref, followersState) {
    if (followersState.isLoading && followersState.followers.isEmpty) {
      return const LoadingWidget();
    }

    if (followersState.hasError) {
      return CustomErrorWidget(
        message: followersState.error!,
        onRetry: () => ref.read(followersProviderFamily(userId).notifier).refreshFollowers(userId),
      );
    }

    if (followersState.isEmpty) {
      return EmptyStateWidget(
        message: 'No followers yet',
        icon: Icons.people_outline,
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo is ScrollEndNotification &&
            scrollInfo.metrics.extentAfter == 0) {
          // Load more when reaching the end
          ref.read(followersProviderFamily(userId).notifier).loadMoreFollowers(userId);
        }
        return false;
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: followersState.followers.length + (followersState.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == followersState.followers.length && followersState.hasMore) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final user = followersState.followers[index];
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
      subtitle: Text(
        '@${user.usernameOrEmail}',
        style: AppTypography.body2,
      ),
      trailing: user.isVerified
          ? const Icon(
              Icons.verified,
              color: AppTheme.primaryColor,
              size: 20,
            )
          : null,
      onTap: () {
        // TODO: Navigate to user profile
      },
    );
  }

  Future<void> _refreshFollowers(WidgetRef ref) async {
    await ref.read(followersProviderFamily(userId).notifier).refreshFollowers(userId);
  }
}