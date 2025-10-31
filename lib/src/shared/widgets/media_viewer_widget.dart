import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/post_model.dart';
import '../../core/theme/app_theme.dart';

class MediaViewerPage extends StatefulWidget {
  final List<Media> media;
  final int initialIndex;

  const MediaViewerPage({
    super.key,
    required this.media,
    this.initialIndex = 0,
  });

  @override
  State<MediaViewerPage> createState() => _MediaViewerPageState();
}

class _MediaViewerPageState extends State<MediaViewerPage> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('${_currentIndex + 1} / ${widget.media.length}'),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.media.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final media = widget.media[index];
          return _buildMediaItem(media);
        },
      ),
    );
  }

  Widget _buildMediaItem(Media media) {
    return Center(
      child: InteractiveViewer(
        panEnabled: false,
        boundaryMargin: const EdgeInsets.all(20),
        minScale: 0.5,
        maxScale: 4.0,
        child: media.isVideo
            ? _buildVideoPlayer(media)
            : _buildImage(media),
      ),
    );
  }

  Widget _buildImage(Media media) {
    return CachedNetworkImage(
      imageUrl: media.url,
      fit: BoxFit.contain,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.broken_image,
          color: Colors.white,
          size: 64,
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(Media media) {
    // TODO: Implement actual video player
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: media.thumbnailUrl.isNotEmpty ? media.thumbnailUrl : media.url,
          fit: BoxFit.contain,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 48,
          ),
        ),
      ],
    );
  }
}