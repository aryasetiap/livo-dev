import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/providers/feed_provider.dart';
import '../../../../shared/providers/auth_provider.dart';
import '../../../../shared/widgets/post_card.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/follow_suggestion_widget.dart';

class FeedPage extends ConsumerStatefulWidget {
  const FeedPage({super.key});

  @override
  ConsumerState<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(_onScroll);

    // Load initial feed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(feedProvider.notifier).loadFeed();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500) {
      // Load more posts when near the bottom
      ref.read(feedProvider.notifier).loadMoreFeed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedProvider);
    final currentUser = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Livo',
              style: AppTypography.h1.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.camera_alt_outlined,
              color: AppTheme.primaryColor,
              size: 24,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Navigate to notifications
            },
            icon: const Badge(
              label: Text('3'),
              child: Icon(Icons.notifications_outlined),
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO: Navigate to messages
            },
            icon: const Badge(
              label: Text('5'),
              child: Icon(Icons.message_outlined),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.primaryColor,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: AppTheme.textSecondary,
          labelStyle: AppTypography.title2.copyWith(fontWeight: FontWeight.w600),
          unselectedLabelStyle: AppTypography.title2,
          tabs: const [
            Tab(text: 'Following'),
            Tab(text: 'For You'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFollowingFeed(currentUser),
          _buildForYouFeed(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/create-post');
        },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildFollowingFeed(User? currentUser) {
    if (currentUser == null) {
      return _buildLoginPrompt();
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(feedProvider.notifier).refreshFeed();
      },
      child: _buildFeedContent(),
    );
  }

  Widget _buildForYouFeed() {
    // TODO: Implement "For You" algorithm-based feed
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(feedProvider.notifier).refreshFeed();
      },
      child: _buildFeedContent(),
    );
  }

  Widget _buildFeedContent() {
    final feedState = ref.watch(feedProvider);

    if (feedState.isLoading && feedState.posts.isEmpty) {
      return const LoadingWidget();
    }

    if (feedState.hasError && feedState.posts.isEmpty) {
      return CustomErrorWidget(
        message: feedState.error ?? 'Failed to load feed',
        onRetry: () {
          ref.read(feedProvider.notifier).refreshFeed();
        },
      );
    }

    if (feedState.isEmpty) {
      return _buildEmptyFeed();
    }

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        // Stories section (placeholder)
        SliverToBoxAdapter(
          child: _buildStoriesSection(),
        ),

        // Suggestions section (only show in Following tab)
        if (_tabController.index == 0) ...[
          SliverToBoxAdapter(
            child: _buildSuggestionsSection(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 8),
          ),
        ],

        // Posts list
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index >= feedState.posts.length) {
                // Loading indicator at the end
                return feedState.isLoadingMore
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : const SizedBox.shrink();
              }

              final feedPost = feedState.posts[index];
              return PostCard(
                feedPost: feedPost,
                onCommentAdded: (comment) {
                  // Handle new comment
                  ref.read(feedProvider.notifier).updatePostInteraction(
                    feedPost.post.id,
                    isLiked: feedPost.isLiked,
                    isBookmarked: feedPost.isBookmarked,
                  );
                },
              );
            },
            childCount: feedState.posts.length + (feedState.hasMore ? 1 : 0),
          ),
        ),

        // End of feed indicator
        if (!feedState.hasMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: AppTheme.textSecondary,
                      size: 48,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "You're all caught up!",
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Check back later for new posts",
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildLoginPrompt() {
    return Center(
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
              'Sign in to see your feed',
              style: AppTypography.h1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Connect with friends and see what\'s happening in the world.',
              style: AppTypography.body1.copyWith(
                color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.push('/auth');
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyFeed() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.photo_library_outlined,
              size: 64,
              color: AppTheme.textSecondary,
            ),
            const SizedBox(height: 16),
            Text(
              'No posts yet',
              style: AppTypography.h1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Follow some people or create your first post to get started!',
              style: AppTypography.body1.copyWith(
                color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                context.push('/discover');
              },
              icon: const Icon(Icons.explore_outlined),
              label: const Text('Discover People'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {
                context.push('/create-post');
              },
              icon: const Icon(Icons.add_photo_alternate),
              label: const Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoriesSection() {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 8, // Placeholder count
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _buildStoryItem(index == 0), // First item is "Your Story"
          );
        },
      ),
    );
  }

  Widget _buildStoryItem(bool isOwnStory) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            gradient: isOwnStory
                ? LinearGradient(
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.secondaryColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            shape: BoxShape.circle,
            border: isOwnStory
                ? null
                : Border.all(color: AppTheme.borderColor, width: 2),
          ),
          child: Padding(
            padding: EdgeInsets.all(isOwnStory ? 2 : 3),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: isOwnStory
                  ? const Icon(
                      Icons.add,
                      color: AppTheme.primaryColor,
                      size: 28,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: AppTheme.shimmerBaseColor,
                        shape: BoxShape.circle,
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          isOwnStory ? 'Your Story' : 'User ${DateTime.now().millisecondsSinceEpoch % 100}',
          style: AppTypography.caption2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildSuggestionsSection() {
    // TODO: Replace with actual follow suggestions
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person_add_outlined,
                color: AppTheme.primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Suggested for you',
                style: AppTypography.title1.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to discover page
                },
                child: const Text('See All'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Placeholder suggestions
          Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index < 2 ? 8 : 0,
                  ),
                  child: _buildSuggestionPlaceholder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.shimmerBaseColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 12,
            decoration: BoxDecoration(
              color: AppTheme.shimmerBaseColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 40,
            height: 10,
            decoration: BoxDecoration(
              color: AppTheme.shimmerBaseColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 24,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}