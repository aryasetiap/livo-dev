import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/providers/profile_provider.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/avatar_widget.dart';
import 'edit_profile_page.dart';
import 'followers_page.dart';
import 'following_page.dart';
import 'post_grid_widget.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final String userId;

  const ProfilePage({
    super.key,
    required this.userId,
  });

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Load profile data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProviderFamily(widget.userId).notifier).loadProfile(widget.userId);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final isScrolled = _scrollController.offset > 100;
    if (_isScrolled != isScrolled) {
      setState(() {
        _isScrolled = isScrolled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProviderFamily(widget.userId));
    final currentUser = ref.watch(currentUserProfileProvider);

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _buildSliverAppBar(profileState, currentUser),
            _buildSliverTabBar(),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildPostsGrid(profileState),
            _buildTaggedPostsGrid(profileState),
          ],
        ),
      ),
      floatingActionButton: _isCurrentUser(currentUser)
          ? FloatingActionButton(
              onPressed: _editProfile,
              child: const Icon(Icons.edit),
            )
          : null,
    );
  }

  bool _isCurrentUser(currentUser) {
    return currentUser.user?.id == widget.userId || widget.userId == 'current';
  }

  Widget _buildSliverAppBar(ProfileState profileState, currentUserState) {
    final isCurrentUser = _isCurrentUser(currentUserState);
    final user = profileState.user;

    return SliverAppBar(
      expandedHeight: 320,
      floating: false,
      pinned: true,
      snap: false,
      backgroundColor: _isScrolled ? Colors.white : Colors.transparent,
      elevation: _isScrolled ? 4 : 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back,
          color: _isScrolled ? AppTheme.textPrimary : Colors.white,
        ),
      ),
      actions: [
        if (!isCurrentUser && user != null) ...[
          IconButton(
            onPressed: _shareProfile,
            icon: Icon(
              Icons.share,
              color: _isScrolled ? AppTheme.textPrimary : Colors.white,
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: _isScrolled ? AppTheme.textPrimary : Colors.white,
            ),
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'block',
                child: Row(
                  children: [
                    Icon(Icons.block),
                    SizedBox(width: 8),
                    Text('Block User'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'report',
                child: Row(
                  children: [
                    Icon(Icons.flag),
                    SizedBox(width: 8),
                    Text('Report User'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: user != null ? _buildProfileHeader(user) : const SizedBox.shrink(),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildProfileInfo(user, profileState, isCurrentUser),
              _buildProfileActions(user, profileState, isCurrentUser),
              _buildStatsRow(user, profileState),
              const Divider(height: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(User user) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.primaryColor.withValues(alpha: 0.8),
            AppTheme.primaryColor,
          ],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 100),
          AvatarWidget(
            imageUrl: user.avatarUrl,
            username: user.displayNameOrUsername,
            size: 100,
            showBorder: true,
            borderColor: Colors.white,
            borderWidth: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(User? user, ProfileState profileState, bool isCurrentUser) {
    if (user == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Username
          Text(
            '@${user.usernameOrEmail}',
            style: AppTypography.withColor(AppTypography.body2, AppTheme.textSecondary),
          ),

          const SizedBox(height: 8),

          // Display name
          if (user.displayName != null) ...[
            Text(
              user.displayName!,
              style: AppTypography.h1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],

          // Bio
          if (user.hasBio) ...[
            Text(
              user.bio!,
              style: AppTypography.body1,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
          ],

          // Additional info
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (user.hasWebsite) ...[
                _buildInfoChip(
                  icon: Icons.link,
                  label: 'Website',
                  onTap: () => _openUrl(user.website!),
                ),
                const SizedBox(width: 8),
              ],
              if (user.hasLocation) ...[
                _buildInfoChip(
                  icon: Icons.location_on,
                  label: user.location!,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: AppTypography.withColor(AppTypography.caption2, AppTheme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileActions(User? user, ProfileState profileState, bool isCurrentUser) {
    if (user == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          // Follow/Unfollow button (for other users)
          if (!isCurrentUser) ...[
            Expanded(
              child: ElevatedButton(
                onPressed: profileState.isLoading ? null : () => _toggleFollow(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: profileState.isFollowing ? Colors.white : AppTheme.primaryColor,
                  foregroundColor: profileState.isFollowing ? AppTheme.primaryColor : Colors.white,
                  side: BorderSide(color: AppTheme.primaryColor),
                ),
                child: profileState.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        profileState.isFollowing ? 'Following' : 'Follow',
                        style: AppTypography.buttonMedium,
                      ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                onPressed: _sendMessage,
                child: Text(
                  'Message',
                  style: AppTypography.buttonMedium,
                ),
              ),
            ),
          ] else ...[
            // Edit profile button (for current user)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _editProfile,
                icon: const Icon(Icons.edit, size: 18),
                label: Text(
                  'Edit Profile',
                  style: AppTypography.buttonMedium,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatsRow(User? user, ProfileState profileState) {
    final stats = profileState.stats;
    if (user == null || stats == null) return const SizedBox.shrink();

    return Row(
      children: [
        _buildStatItem(
          count: user.formattedPostsCount,
          label: 'Posts',
          onTap: () => _scrollToPosts(),
        ),
        _buildStatItem(
          count: user.formattedFollowersCount,
          label: 'Followers',
          onTap: () => _navigateToFollowers(),
        ),
        _buildStatItem(
          count: user.formattedFollowingCount,
          label: 'Following',
          onTap: () => _navigateToFollowing(),
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required String count,
    required String label,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              count,
              style: AppTypography.h2,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTypography.withColor(AppTypography.body2, AppTheme.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverTabBar() {
    return SliverPersistentHeader(
      delegate: _SliverTabBarDelegate(
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.grid_on),
              text: 'Posts',
            ),
            Tab(
              icon: const Icon(Icons.tag),
              text: 'Tagged',
            ),
          ],
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: AppTheme.textSecondary,
          indicatorColor: AppTheme.primaryColor,
          indicatorWeight: 2,
        ),
      ),
      pinned: true,
    );
  }

  Widget _buildPostsGrid(ProfileState profileState) {
    if (profileState.isLoading && profileState.user == null) {
      return const LoadingWidget();
    }

    if (profileState.hasError) {
      return CustomErrorWidget(
        message: profileState.error!,
        onRetry: () => ref.read(profileProviderFamily(widget.userId).notifier).refreshProfile(widget.userId),
      );
    }

    if (profileState.user == null) {
      return const Center(
        child: Text('User not found'),
      );
    }

    return PostGridWidget(
      userId: widget.userId,
      isEmptyMessage: 'No posts yet',
    );
  }

  Widget _buildTaggedPostsGrid(ProfileState profileState) {
    if (profileState.user == null) {
      return const LoadingWidget();
    }

    // TODO: Implement tagged posts
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.tag,
            size: 64,
            color: AppTheme.textSecondary,
          ),
          const SizedBox(height: 16),
          Text(
            'Tagged posts',
            style: AppTypography.h1,
          ),
          const SizedBox(height: 8),
          Text(
            'Posts where this user is tagged',
            style: AppTypography.withColor(AppTypography.body1, AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }

  // Action handlers
  void _editProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EditProfilePage(),
      ),
    );
  }

  void _toggleFollow() async {
    final success = await ref.read(profileProviderFamily(widget.userId).notifier).followUser(widget.userId);
    if (!success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ref.read(profileProviderFamily(widget.userId)).error ?? 'Failed to follow user'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  void _sendMessage() {
    // TODO: Implement messaging
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Messaging feature coming soon!')),
    );
  }

  void _shareProfile() {
    // TODO: Implement profile sharing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share feature coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'block':
        _blockUser();
        break;
      case 'report':
        _reportUser();
        break;
    }
  }

  void _blockUser() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Block User'),
        content: const Text('Are you sure you want to block this user? You won\'t see their content anymore.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('User blocked successfully')),
              );
            },
            child: const Text('Block'),
          ),
        ],
      ),
    );
  }

  void _reportUser() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report User'),
        content: const Text('Why are you reporting this user?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Report submitted successfully')),
              );
            },
            child: const Text('Report'),
          ),
        ],
      ),
    );
  }

  void _openUrl(String url) {
    // TODO: Implement URL opening
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('URL opening coming soon!')),
    );
  }

  void _scrollToPosts() {
    _tabController.animateTo(0);
  }

  void _navigateToFollowers() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FollowersPage(userId: widget.userId),
      ),
    );
  }

  void _navigateToFollowing() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FollowingPage(userId: widget.userId),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}