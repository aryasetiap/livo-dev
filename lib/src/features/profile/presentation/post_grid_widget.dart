import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_typography.dart';

class PostGridWidget extends ConsumerStatefulWidget {
  final String userId;
  final String? isEmptyMessage;

  const PostGridWidget({
    super.key,
    required this.userId,
    this.isEmptyMessage,
  });

  @override
  ConsumerState<PostGridWidget> createState() => _PostGridWidgetState();
}

class _PostGridWidgetState extends ConsumerState<PostGridWidget> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  List<PostItem> _posts = [];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadPosts() async {
    setState(() {
      _isLoading = true;
    });

    // TODO: Implement actual post loading from API
    // For now, create mock posts
    await Future.delayed(const Duration(seconds: 1));

    final mockPosts = List.generate(12, (index) => PostItem(
      id: 'post_$index',
      imageUrl: null,
      mediaCount: index % 3 + 1,
      isVideo: index % 4 == 0,
      likesCount: (index + 1) * 12,
      commentsCount: (index + 1) * 5,
    ));

    setState(() {
      _posts = mockPosts;
      _isLoading = false;
    });
  }

  Future<void> _loadMorePosts() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // TODO: Implement pagination
    await Future.delayed(const Duration(seconds: 1));

    final morePosts = List.generate(6, (index) => PostItem(
      id: 'post_${_posts.length + index}',
      imageUrl: null,
      mediaCount: (index % 3) + 1,
      isVideo: index % 4 == 0,
      likesCount: (_posts.length + index + 1) * 8,
      commentsCount: (_posts.length + index + 1) * 3,
    ));

    setState(() {
      _posts.addAll(morePosts);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_posts.isEmpty && !_isLoading) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        await _loadPosts();
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo is ScrollEndNotification &&
              scrollInfo.metrics.extentAfter < 500) {
            _loadMorePosts();
          }
          return false;
        },
        child: GridView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(1),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemCount: _posts.length + (_isLoading ? 3 : 0),
          itemBuilder: (context, index) {
            if (index >= _posts.length) {
              return _buildLoadingItem();
            }
            return _buildPostItem(_posts[index]);
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: 64,
            color: AppTheme.textSecondary,
          ),
          const SizedBox(height: 16),
          Text(
            widget.isEmptyMessage ?? 'No posts yet',
            style: AppTypography.h1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Start sharing your moments with the world!',
            style: AppTypography.body1.copyWith(
              color: AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Navigate to post creation
            },
            icon: const Icon(Icons.add_photo_alternate),
            label: const Text('Create Post'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingItem() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.shimmerBaseColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
        ),
      ),
    );
  }

  Widget _buildPostItem(PostItem post) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to post detail
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: [
              // Post image
              if (post.imageUrl != null)
                CachedNetworkImage(
                  imageUrl: post.imageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) => _buildShimmerPlaceholder(),
                  errorWidget: (context, url, error) => _buildErrorPlaceholder(),
                  memCacheWidth: 300,
                  memCacheHeight: 300,
                )
              else
                _buildPlaceholder(),

              // Media type indicator
              if (post.mediaCount > 1)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.photo_library_outlined,
                          color: Colors.white,
                          size: 12,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${post.mediaCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              // Video indicator
              if (post.isVideo)
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 10,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Video',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              // Stats overlay
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatCount(post.likesCount),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatCount(post.commentsCount),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppTheme.shimmerBaseColor,
      child: const Center(
        child: Icon(
          Icons.image,
          color: AppTheme.textSecondary,
          size: 32,
        ),
      ),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Container(
      color: AppTheme.shimmerBaseColor,
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      color: AppTheme.errorColor.withValues(alpha: 0.1),
      child: const Center(
        child: Icon(
          Icons.broken_image,
          color: AppTheme.errorColor,
          size: 32,
        ),
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}

// Post item model
class PostItem {
  final String id;
  final String? imageUrl;
  final int mediaCount;
  final bool isVideo;
  final int likesCount;
  final int commentsCount;

  PostItem({
    required this.id,
    this.imageUrl,
    required this.mediaCount,
    this.isVideo = false,
    required this.likesCount,
    required this.commentsCount,
  });
}

class PostGridItem extends StatelessWidget {
  final String postId;
  final String? imageUrl;
  final VoidCallback? onTap;
  final int mediaCount;
  final bool isVideo;
  final int likesCount;
  final int commentsCount;

  const PostGridItem({
    super.key,
    required this.postId,
    this.imageUrl,
    this.onTap,
    this.mediaCount = 1,
    this.isVideo = false,
    this.likesCount = 0,
    this.commentsCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: [
              // Post image
              if (imageUrl != null)
                CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) => _buildShimmerPlaceholder(),
                  errorWidget: (context, url, error) => _buildErrorPlaceholder(),
                  memCacheWidth: 300,
                  memCacheHeight: 300,
                )
              else
                _buildPlaceholder(),

              // Media indicators overlay
              if (mediaCount > 1 || isVideo)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (mediaCount > 1)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.photo_library_outlined,
                                color: Colors.white,
                                size: 12,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '$mediaCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (isVideo) ...[
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 10,
                              ),
                              SizedBox(width: 2),
                              Text(
                                'Video',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppTheme.shimmerBaseColor,
      child: const Center(
        child: Icon(
          Icons.image,
          color: AppTheme.textSecondary,
          size: 32,
        ),
      ),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Container(
      color: AppTheme.shimmerBaseColor,
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      color: AppTheme.errorColor.withValues(alpha: 0.1),
      child: const Center(
        child: Icon(
          Icons.broken_image,
          color: AppTheme.errorColor,
          size: 32,
        ),
      ),
    );
  }
}