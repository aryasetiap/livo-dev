import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/post_model.dart';
import '../providers/feed_provider.dart';
import '../providers/profile_provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';
import 'avatar_widget.dart';
import 'loading_widget.dart';
import 'media_viewer_widget.dart';
import 'comment_bottom_sheet.dart';

class PostCard extends ConsumerStatefulWidget {
  final FeedPost feedPost;
  final bool showFullContent;
  final VoidCallback? onUserTap;
  final VoidCallback? onPostTap;
  final Function(PostInteraction)? onCommentAdded;

  const PostCard({
    super.key,
    required this.feedPost,
    this.showFullContent = false,
    this.onUserTap,
    this.onPostTap,
    this.onCommentAdded,
  });

  @override
  ConsumerState<PostCard> createState() => _PostCardState();
}

class _PostCardState extends ConsumerState<PostCard> {
  bool _isLiked = false;
  bool _isBookmarked = false;
  bool _showMoreText = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.feedPost.isLiked ?? false;
    _isBookmarked = widget.feedPost.isBookmarked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.feedPost.post;
    final user = widget.feedPost.user;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildHeader(user, post),
          const Divider(height: 1),

          // Content
          if (post.content.isNotEmpty) ...[
            _buildContent(post.content),
          ],

          // Media
          if (post.hasMedia) ...[
            _buildMedia(post.media),
          ],

          // Footer with interactions
          Padding(
            padding: const EdgeInsets.all(16),
            child: _buildInteractions(post),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(UserPostInfo user, Post post) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Avatar
          GestureDetector(
            onTap: () {
              // TODO: Navigate to user profile
              widget.onUserTap?.call();
            },
            child: AvatarWidget(
              imageUrl: user.avatarUrl,
              username: user.displayNameOrUsername,
              size: 40,
              showBorder: true,
            ),
          ),

          const SizedBox(width: 12),

          // User info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.displayNameOrUsername,
                      style: AppTypography.title1.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (user.isVerified) ...[
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
                Row(
                  children: [
                    Text(
                      '@${user.username}',
                      style: AppTypography.body2.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: AppTypography.body2.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      post.timeAgo,
                      style: AppTypography.body2.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (post.location != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: AppTheme.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        post.location!,
                        style: AppTypography.caption2.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // More options
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz),
            onSelected: (value) {
              switch (value) {
                case 'report':
                  // TODO: Report post
                  break;
                case 'share':
                  _handleShare(post);
                  break;
                case 'bookmark':
                  _handleBookmark(post);
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'share',
                child: Row(
                  children: [
                    Icon(Icons.share_outlined),
                    SizedBox(width: 8),
                    Text('Share'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'bookmark',
                child: Row(
                  children: [
                    Icon(Icons.bookmark_outline),
                    SizedBox(width: 8),
                    Text('Bookmark'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'report',
                child: Row(
                  children: [
                    Icon(Icons.flag_outlined),
                    SizedBox(width: 8),
                    Text('Report'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(String content) {
    final maxLines = widget.showFullContent ? null : (_showMoreText ? null : 3);
    final shouldShowMoreButton = !widget.showFullContent && content.length > 150;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: AppTypography.body1,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          if (shouldShowMoreButton && !_showMoreText) ...[
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showMoreText = true;
                });
              },
              child: Text(
                'See more',
                style: AppTypography.body2.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMedia(List<Media> media) {
    if (media.length == 1) {
      return _buildSingleMedia(media.first);
    } else if (media.length == 2) {
      return _buildTwoMedia(media);
    } else if (media.length <= 4) {
      return _buildFourMedia(media);
    } else {
      return _buildMultipleMedia(media);
    }
  }

  Widget _buildSingleMedia(Media media) {
    return GestureDetector(
      onTap: () => _viewMedia([media], 0),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 400,
        ),
        child: media.isVideo
            ? _buildVideoThumbnail(media)
            : _buildImage(media),
      ),
    );
  }

  Widget _buildTwoMedia(List<Media> media) {
    return SizedBox(
      height: 200,
      child: Row(
        children: media.asMap().entries.map((entry) {
          final index = entry.key;
          final mediaItem = entry.value;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: index == 0 ? 2 : 0,
                left: index == 1 ? 2 : 0,
              ),
              child: GestureDetector(
                onTap: () => _viewMedia(media, index),
                child: mediaItem.isVideo
                    ? _buildVideoThumbnail(mediaItem)
                    : _buildImage(mediaItem),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFourMedia(List<Media> media) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          // Top row
          SizedBox(
            height: 148,
            child: Row(
              children: media.take(2).asMap().entries.map((entry) {
                final index = entry.key;
                final mediaItem = entry.value;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == 0 ? 2 : 0,
                      bottom: 4,
                    ),
                    child: GestureDetector(
                      onTap: () => _viewMedia(media, index),
                      child: mediaItem.isVideo
                          ? _buildVideoThumbnail(mediaItem)
                          : _buildImage(mediaItem),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Bottom row
          SizedBox(
            height: 148,
            child: Row(
              children: media.skip(2).take(2).asMap().entries.map((entry) {
                final index = entry.key + 2;
                final mediaItem = entry.value;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == 2 ? 2 : 0,
                      top: 4,
                    ),
                    child: GestureDetector(
                      onTap: () => _viewMedia(media, index),
                      child: mediaItem.isVideo
                          ? _buildVideoThumbnail(mediaItem)
                          : _buildImage(mediaItem),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMultipleMedia(List<Media> media) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          // First 4 media items
          _buildFourMedia(media.take(4).toList()),
          // Overlay showing remaining count
          if (media.length > 4)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '+${media.length - 4}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImage(Media media) {
    return CachedNetworkImage(
      imageUrl: media.url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      placeholder: (context, url) => _buildMediaPlaceholder(),
      errorWidget: (context, url, error) => _buildMediaErrorPlaceholder(),
    );
  }

  Widget _buildVideoThumbnail(Media media) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: media.thumbnailUrl.isNotEmpty ? media.thumbnailUrl : media.url,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          placeholder: (context, url) => _buildMediaPlaceholder(),
          errorWidget: (context, url, error) => _buildMediaErrorPlaceholder(),
        ),
        const Center(
          child: Icon(
            Icons.play_circle_outline,
            color: Colors.white,
            size: 48,
          ),
        ),
        if (media.duration > 0)
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                media.formattedDuration,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMediaPlaceholder() {
    return Container(
      color: AppTheme.shimmerBaseColor,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
        ),
      ),
    );
  }

  Widget _buildMediaErrorPlaceholder() {
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

  Widget _buildInteractions(Post post) {
    return Column(
      children: [
        // Action buttons
        Row(
          children: [
            // Like button
            GestureDetector(
              onTap: () => _handleLike(post),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: _isLiked ? AppTheme.primaryColor.withValues(alpha: 0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: _isLiked ? AppTheme.primaryColor : AppTheme.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      post.formattedLikesCount,
                      style: AppTypography.caption2.copyWith(
                        color: _isLiked ? AppTheme.primaryColor : AppTheme.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Comment button
            GestureDetector(
              onTap: () => _handleComments(post),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.chat_bubble_outline,
                      color: AppTheme.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      post.formattedCommentsCount,
                      style: AppTypography.caption2.copyWith(
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Share button
            GestureDetector(
              onTap: () => _handleShare(post),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.share_outline,
                      color: AppTheme.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      post.formattedSharesCount,
                      style: AppTypography.caption2.copyWith(
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Bookmark button
            GestureDetector(
              onTap: () => _handleBookmark(post),
              child: Icon(
                _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: _isBookmarked ? AppTheme.primaryColor : AppTheme.textSecondary,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleLike(Post post) async {
    final currentState = ref.read(postInteractionProvider(post.id));
    if (currentState.isLoading) return;

    // Optimistic update
    setState(() {
      _isLiked = !_isLiked;
    });

    final success = await ref.read(postInteractionProvider(post.id).notifier).toggleLike(post.id);

    if (!success) {
      // Revert optimistic update
      setState(() {
        _isLiked = !_isLiked;
      });
    }
  }

  void _handleBookmark(Post post) async {
    final currentState = ref.read(postInteractionProvider(post.id));
    if (currentState.isLoading) return;

    // Optimistic update
    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    final success = await ref.read(postInteractionProvider(post.id).notifier).toggleBookmark(post.id);

    if (!success) {
      // Revert optimistic update
      setState(() {
        _isBookmarked = !_isBookmarked;
      });
    }
  }

  void _handleShare(Post post) async {
    try {
      await ref.read(postInteractionProvider(post.id).notifier).sharePost(post.id);
      // TODO: Show share dialog or navigate
    } catch (e) {
      // Handle error
    }
  }

  void _handleComments(Post post) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CommentBottomSheet(
        postId: post.id,
        onCommentAdded: widget.onCommentAdded,
      ),
    );
  }

  void _viewMedia(List<Media> media, int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MediaViewerPage(
          media: media,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

// Shimmer loading version
class PostCardShimmer extends StatelessWidget {
  const PostCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header shimmer
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildShimmerCircle(40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildShimmerBox(120, 16),
                      const SizedBox(height: 4),
                      _buildShimmerBox(80, 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Content shimmer
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShimmerBox(double.infinity, 14),
                const SizedBox(height: 4),
                _buildShimmerBox(200, 14),
                const SizedBox(height: 4),
                _buildShimmerBox(150, 14),
              ],
            ),
          ),

          // Media shimmer
          Container(
            height: 200,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.shimmerBaseColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          // Interactions shimmer
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildShimmerBox(60, 32),
                const SizedBox(width: 16),
                _buildShimmerBox(60, 32),
                const SizedBox(width: 16),
                _buildShimmerBox(60, 32),
                const Spacer(),
                _buildShimmerBox(24, 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.shimmerBaseColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildShimmerBox(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppTheme.shimmerBaseColor,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}