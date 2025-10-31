import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../providers/profile_provider.dart';
import 'avatar_widget.dart';
import 'follow_button.dart';

class FollowSuggestionWidget extends StatelessWidget {
  final User user;
  final VoidCallback? onDismiss;
  final bool showBio;
  final bool showMutualFollowers;

  const FollowSuggestionWidget({
    super.key,
    required this.user,
    this.onDismiss,
    this.showBio = true,
    this.showMutualFollowers = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // User avatar
            AvatarWidget(
              imageUrl: user.avatarUrl,
              username: user.displayNameOrUsername,
              size: 60,
              showBorder: true,
            ),

            const SizedBox(width: 16),

            // User info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username and verified badge
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          user.displayNameOrUsername,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      if (user.isVerified)
                        const Icon(
                          Icons.verified,
                          color: AppTheme.primaryColor,
                          size: 16,
                        ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Username with @
                  Text(
                    '@${user.usernameOrEmail}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  if (showBio && user.hasBio) ...[
                    const SizedBox(height: 4),
                    Text(
                      user.bio!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  if (showMutualFollowers) ...[
                    const SizedBox(height: 8),
                    // TODO: Show mutual followers
                    Text(
                      'Followed by you, John Doe, and 3 others',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],

                  // Stats
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '${user.formattedFollowersCount} followers',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '${user.formattedPostsCount} posts',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // Follow button
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallFollowButton(
                  user: user,
                ),
                if (onDismiss != null) ...[
                  const SizedBox(height: 8),
                  IconButton(
                    onPressed: onDismiss,
                    icon: const Icon(
                      Icons.close,
                      size: 16,
                    ),
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(32, 32),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FollowSuggestionsList extends ConsumerWidget {
  final List<User> users;
  final String title;
  final bool showBio;
  final bool showMutualFollowers;
  final Function(User)? onUserTap;
  final Function(User)? onDismiss;

  const FollowSuggestionsList({
    super.key,
    required this.users,
    required this.title,
    this.showBio = true,
    this.showMutualFollowers = false,
    this.onUserTap,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (users.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              if (users.length > 3)
                TextButton(
                  onPressed: () {
                    // TODO: Show all suggestions
                  },
                  child: const Text('See All'),
                ),
            ],
          ),
        ),
        ...users.take(3).map((user) => Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: FollowSuggestionWidget(
            user: user,
            showBio: showBio,
            showMutualFollowers: showMutualFollowers,
            onDismiss: onDismiss != null ? () => onDismiss!(user) : null,
          ),
        )),
      ],
    );
  }
}

// Horizontal scrollable follow suggestions
class HorizontalFollowSuggestions extends StatelessWidget {
  final List<User> users;
  final String title;
  final Function(User)? onUserTap;

  const HorizontalFollowSuggestions({
    super.key,
    required this.users,
    required this.title,
    this.onUserTap,
  });

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _buildSuggestionCard(user),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionCard(User user) {
    return Card(
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Avatar
            AvatarWidget(
              imageUrl: user.avatarUrl,
              username: user.displayNameOrUsername,
              size: 50,
            ),

            const SizedBox(height: 8),

            // Username
            Text(
              user.displayNameOrUsername,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 4),

            // Follow button
            SmallFollowButton(
              user: user,
            ),
          ],
        ),
      ),
    );
  }
}

// People you may know widget
class PeopleYouMayKnow extends ConsumerWidget {
  final String userId;
  final int maxSuggestions;

  const PeopleYouMayKnow({
    super.key,
    required this.userId,
    this.maxSuggestions = 5,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement actual "people you may know" logic
    // For now, return a placeholder
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            'People You May Know',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // TODO: Replace with actual suggestions
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'No suggestions available at the moment.',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

// Trending users widget
class TrendingUsers extends StatelessWidget {
  final List<User> users;
  final Function(User)? onUserTap;

  const TrendingUsers({
    super.key,
    required this.users,
    this.onUserTap,
  });

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(
                Icons.trending_up,
                color: AppTheme.primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Trending Users',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // TODO: Show all trending users
                },
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _buildTrendingUserCard(user, index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingUserCard(User user, int index) {
    final colors = [
      AppTheme.primaryColor,
      AppTheme.secondaryColor,
      AppTheme.warningColor,
      AppTheme.successColor,
    ];

    final cardColor = colors[index % colors.length];

    return Card(
      elevation: 4,
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              cardColor.withValues(alpha: 0.8),
              cardColor.withValues(alpha: 0.6),
            ],
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Rank badge
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Avatar
            AvatarWidget(
              imageUrl: user.avatarUrl,
              username: user.displayNameOrUsername,
              size: 40,
              showBorder: true,
              borderColor: Colors.white,
            ),

            const SizedBox(height: 8),

            // Username
            Text(
              user.displayNameOrUsername,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 4),

            // Followers count
            Text(
              user.formattedFollowersCount,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            // Follow button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Follow',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}