import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/models/story_model.dart';
import '../../../../shared/providers/story_provider.dart';
import '../../../../shared/providers/auth_provider.dart';
import '../../../../shared/widgets/avatar_widget.dart';
import 'story_reply_bottom_sheet.dart';

class StoryViewerPage extends ConsumerStatefulWidget {
  final List<StoryBundle> storyBundles;
  final int initialBundleIndex;
  final int initialStoryIndex;

  const StoryViewerPage({
    super.key,
    required this.storyBundles,
    this.initialBundleIndex = 0,
    this.initialStoryIndex = 0,
  });

  @override
  ConsumerState<StoryViewerPage> createState() => _StoryViewerPageState();
}

class _StoryViewerPageState extends ConsumerState<StoryViewerPage>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _fadeController;
  late Animation<double> _progressAnimation;
  late Animation<double> _fadeAnimation;
  late PageController _pageController;
  Timer? _progressTimer;
  bool _showUI = true;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _progressController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.linear,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    // Start with the initial bundle
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.storyBundles.isNotEmpty) {
        final initialBundle = widget.storyBundles[widget.initialBundleIndex];
        ref.read(storyViewerProvider.notifier).openStoryBundle(
          initialBundle,
          widget.initialStoryIndex,
        );
      }
    });

    _fadeController.forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    _fadeController.dispose();
    _pageController.dispose();
    _progressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storyViewerState = ref.watch(storyViewerProvider);
    final storyBundle = storyViewerState.currentBundle;
    final currentStory = storyViewerState.currentStory;

    if (storyBundle == null || currentStory == null) {
      return _buildEmptyState();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _toggleUI,
        onLongPressStart: (_) => _pauseStory(),
        onLongPressEnd: (_) => _resumeStory(),
        child: Stack(
          children: [
            // Story content
            _buildStoryContent(currentStory),

            // UI overlay
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _showUI ? _fadeAnimation.value : 0.0,
                  child: child,
                );
              },
              child: Stack(
                children: [
                  // Header
                  _buildHeader(storyBundle, currentStory),

                  // Progress indicators
                  _buildProgressIndicators(storyBundle),

                  // Reply button
                  _buildReplyButton(),

                  // Story navigation
                  _buildStoryNavigation(storyBundle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.photo_library_outlined,
              color: Colors.white,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'No stories available',
              style: AppTypography.h1.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryContent(Story story) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) {
        ref.read(storyViewerProvider.notifier).goToStory(index);
        _resetProgress();
      },
      itemCount: storyBundle!.stories.length,
      itemBuilder: (context, index) {
        if (index != storyViewerState.currentStoryIndex) {
          return const SizedBox.shrink();
        }
        return story.media.isVideo
            ? _buildVideoPlayer(story)
            : _buildImage(story);
      },
    );
  }

  Widget _buildImage(Story story) {
    return CachedNetworkImage(
      imageUrl: story.media.url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      placeholder: (context, url) => Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.black,
        child: const Center(
          child: Icon(
            Icons.broken_image,
            color: Colors.white,
            size: 64,
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(Story story) {
    return VideoPlayerWidget(
      videoUrl: story.media.url,
      thumbnailUrl: story.media.thumbnailUrl,
      duration: story.media.duration,
      onProgressUpdate: (progress) {
        if (!_isPaused) {
          _progressController.value = progress;
        }
      },
      onVideoEnded: () {
        _nextStory();
      },
    );
  }

  Widget _buildHeader(StoryBundle bundle, Story story) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // User avatar
            GestureDetector(
              onTap: () {
                // TODO: Navigate to user profile
                Navigator.of(context).pop();
              },
              child: AvatarWidget(
                imageUrl: bundle.user.avatarUrl,
                username: bundle.user.displayNameOrUsername,
                size: 40,
                showBorder: true,
                borderColor: Colors.white,
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
                        bundle.user.displayNameOrUsername,
                        style: AppTypography.title1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (bundle.user.isVerified) ...[
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ],
                  ),
                  Text(
                    story.timeAgo,
                    style: AppTypography.caption2.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            // Close button
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicators(StoryBundle bundle) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: List.generate(
            bundle.stories.length,
            (index) => Expanded(
              child: Container(
                height: 3,
                margin: EdgeInsets.only(
                  right: index < bundle.stories.length - 1 ? 2 : 0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    if (index <= storyViewerState.currentStoryIndex)
                      AnimatedBuilder(
                        animation: _progressAnimation,
                        builder: (context, child) {
                          double progress = 1.0;
                          if (index == storyViewerState.currentStoryIndex) {
                            progress = _progressAnimation.value;
                          } else if (index < storyViewerState.currentStoryIndex) {
                            progress = 1.0;
                          }

                          return FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: progress,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReplyButton() {
    return Positioned(
      bottom: 50,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          backdropFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.dstIn,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.send,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Send message',
                style: AppTypography.body2.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
            const Icon(
              Icons.emoji_emotions_outlined,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryNavigation(StoryBundle bundle) {
    return Row(
      children: [
        // Previous story area
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: _previousStory,
            behavior: HitTestBehavior.opaque,
          ),
        ),
        // Next story area
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: _nextStory,
            behavior: HitTestBehavior.opaque,
          ),
        ),
      ],
    );
  }

  void _toggleUI() {
    setState(() {
      _showUI = !_showUI;
    });

    if (_showUI) {
      _fadeController.forward();
    } else {
      _fadeController.reverse();
    }
  }

  void _pauseStory() {
    if (!_isPaused) {
      setState(() {
        _isPaused = true;
      });
      _progressController.stop();
      _progressTimer?.cancel();
    }
  }

  void _resumeStory() {
    if (_isPaused) {
      setState(() {
        _isPaused = false;
      });
      _startProgressTimer();
    }
  }

  void _nextStory() {
    if (storyViewerState.hasNextStory) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (storyViewerState.hasNextBundle) {
      _navigateToNextBundle();
    } else {
      Navigator.of(context).pop();
    }
  }

  void _previousStory() {
    if (storyViewerState.hasPreviousStory) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToPreviousBundle();
    }
  }

  void _navigateToNextBundle() {
    final currentIndex = widget.storyBundles.indexWhere(
      (bundle) => bundle.user.id == storyViewerState.currentBundle!.user.id,
    );

    if (currentIndex != -1 && currentIndex < widget.storyBundles.length - 1) {
      final nextBundle = widget.storyBundles[currentIndex + 1];
      ref.read(storyViewerProvider.notifier).openStoryBundle(nextBundle, 0);
      _pageController.animateToPage(
        0,
        duration: Duration.zero,
        curve: Curves.linear,
      );
      _resetProgress();
    } else {
      Navigator.of(context).pop();
    }
  }

  void _navigateToPreviousBundle() {
    final currentIndex = widget.storyBundles.indexWhere(
      (bundle) => bundle.user.id == storyViewerState.currentBundle!.user.id,
    );

    if (currentIndex > 0) {
      final previousBundle = widget.storyBundles[currentIndex - 1];
      ref.read(storyViewerProvider.notifier).openStoryBundle(
        previousBundle,
        previousBundle.stories.length - 1,
      );
      _pageController.animateToPage(
        previousBundle.stories.length - 1,
        duration: Duration.zero,
        curve: Curves.linear,
      );
      _resetProgress();
    }
  }

  void _resetProgress() {
    _progressController.reset();
    _progressController.forward();
    _startProgressTimer();
  }

  void _startProgressTimer() {
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!_isPaused && _progressController.isCompleted) {
        timer.cancel();
        _nextStory();
      }
    });
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl;
  final int duration;
  final Function(double)? onProgressUpdate;
  final VoidCallback? onVideoEnded;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.duration,
    this.onProgressUpdate,
    this.onVideoEnded,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      await _controller!.initialize();
      _controller!.play();

      _controller!.addListener(_onVideoUpdate);

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
      });
    }
  }

  void _onVideoUpdate() {
    if (_controller != null && _controller!.value.isInitialized) {
      final position = _controller!.value.position;
      final duration = _controller!.value.duration;

      if (duration.inMilliseconds > 0) {
        final progress = position.inMilliseconds / duration.inMilliseconds;
        widget.onProgressUpdate?.call(progress);

        if (_controller!.value.isCompleted) {
          widget.onVideoEnded?.call();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 64,
          ),
        ),
      );
    }

    if (!_isInitialized || _controller == null) {
      return Container(
        color: Colors.black,
        child: CachedNetworkImage(
          imageUrl: widget.thumbnailUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller!.value.size.width,
          height: _controller!.value.size.height,
          child: VideoPlayer(_controller!),
        ),
      ),
    );
  }
}