import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post_model.dart';
import '../providers/feed_provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';
import 'loading_widget.dart';

class CommentBottomSheet extends ConsumerStatefulWidget {
  final String postId;
  final Function(PostInteraction)? onCommentAdded;

  const CommentBottomSheet({
    super.key,
    required this.postId,
    this.onCommentAdded,
  });

  @override
  ConsumerState<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends ConsumerState<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.borderColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text(
                  'Comments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          // Comments list
          Expanded(
            child: _buildCommentsList(),
          ),

          // Comment input
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    // TODO: Load actual comments using provider
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5, // Placeholder count
      itemBuilder: (context, index) {
        return _buildCommentPlaceholder();
      },
    );
  }

  Widget _buildCommentPlaceholder() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppTheme.shimmerBaseColor,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 12),

          // Comment content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username
                Container(
                  width: 80,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppTheme.shimmerBaseColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                const SizedBox(height: 4),

                // Comment text
                Container(
                  width: double.infinity,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppTheme.shimmerBaseColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                const SizedBox(height: 2),

                Container(
                  width: 120,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppTheme.shimmerBaseColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppTheme.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppTheme.borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppTheme.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: AppTheme.primaryColor),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (value) => _submitComment(),
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: _isSubmitting ? null : _submitComment,
            backgroundColor: AppTheme.primaryColor,
            mini: true,
            child: _isSubmitting
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitComment() async {
    final comment = _commentController.text.trim();
    if (comment.isEmpty) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      final commentInteraction = await ref
          .read(postInteractionProvider(widget.postId).notifier)
          .addComment(widget.postId, comment);

      if (commentInteraction != null) {
        widget.onCommentAdded?.call(commentInteraction);
        _commentController.clear();
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to post comment: ${e.toString()}'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }
}