import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/models/story_model.dart';
import '../../../../shared/providers/story_provider.dart';
import '../../../../shared/providers/auth_provider.dart';
import '../../../../shared/widgets/avatar_widget.dart';

class StoryReplyBottomSheet extends ConsumerStatefulWidget {
  final String storyId;
  final String? initialMessage;

  const StoryReplyBottomSheet({
    super.key,
    required this.storyId,
    this.initialMessage,
  });

  @override
  ConsumerState<StoryReplyBottomSheet> createState() => _StoryReplyBottomSheetState();
}

class _StoryReplyBottomSheetState extends ConsumerState<StoryReplyBottomSheet> {
  final TextEditingController _messageController = TextEditingController();
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage != null) {
      _messageController.text = widget.initialMessage!;
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storyViewerState = ref.watch(storyViewerProvider);
    final story = storyViewerState.currentStory;
    final user = story?.user;

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
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
                if (user != null) ...[
                  AvatarWidget(
                    imageUrl: user.avatarUrl,
                    username: user.displayNameOrUsername,
                    size: 32,
                    showBorder: true,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.displayNameOrUsername,
                          style: AppTypography.title2.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Reply to story',
                          style: AppTypography.caption2.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  const Text(
                    'Reply to Story',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                ],
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Message input
          Expanded(
            child: Column(
              children: [
                // Quick reactions
                _buildQuickReactions(),

                const SizedBox(height: 16),

                // Message field
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Send a message...',
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
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.photo_library_outlined),
                          onPressed: () {
                            // TODO: Add photo to reply
                          },
                        ),
                      ),
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ),

                // Send button
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                          label: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _isSending ? null : _sendReply,
                          icon: _isSending
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : const Icon(Icons.send),
                          label: const Text('Send'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickReactions() {
    final reactions = [
      {'emoji': '❤️', 'type': StoryReactionType.love},
      {'emoji': '😂', 'type': StoryReactionType.laugh},
      {'emoji': '😮', 'type': StoryReactionType.wow},
      {'emoji': '😢', 'type': StoryReactionType.sad},
      {'emoji': '😡', 'type': StoryReactionType.angry},
      {'emoji': '👍', 'type': StoryReactionType.like},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Quick Reactions',
              style: AppTypography.caption2.copyWith(
                color: AppTheme.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: reactions.map((reaction) {
              return GestureDetector(
                onTap: () => _sendQuickReaction(
                  reaction['type'] as StoryReactionType,
                  reaction['emoji'] as String,
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                  ),
                  child: Center(
                    child: Text(
                      reaction['emoji'] as String,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Future<void> _sendReply() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    setState(() {
      _isSending = true;
    });

    try {
      final reply = await ref.read(storyViewerProvider.notifier).addReply(message);

      if (reply != null) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Reply sent!'),
            backgroundColor: AppTheme.successColor,
          ),
        );

        // Close bottom sheet
        Navigator.of(context).pop();

        // Navigate to chat if needed
        // TODO: Navigate to chat with story owner
      }
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send reply: ${e.toString()}'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  Future<void> _sendQuickReaction(StoryReactionType type, String emoji) async {
    // Add emoji to message
    _messageController.text = emoji;

    // Send as reply
    await _sendReply();
  }
}

class StoryReactionBottomSheet extends ConsumerWidget {
  final String storyId;

  const StoryReactionBottomSheet({
    super.key,
    required this.storyId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyViewerState = ref.watch(storyViewerProvider);
    final reactions = storyViewerState.reactions[storyId] ?? [];

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
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
                  'Reactions',
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

          const Divider(height: 1),

          // Reactions list
          Expanded(
            child: reactions.isEmpty
                ? const Center(
                    child: Text(
                      'No reactions yet',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: reactions.length,
                    itemBuilder: (context, index) {
                      final reaction = reactions[index];
                      return _buildReactionItem(reaction);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildReactionItem(StoryReaction reaction) {
    String emoji = '👍';
    switch (reaction.type) {
      case StoryReactionType.love:
        emoji = '❤️';
        break;
      case StoryReactionType.laugh:
        emoji = '😂';
        break;
      case StoryReactionType.wow:
        emoji = '😮';
        break;
      case StoryReactionType.sad:
        emoji = '😢';
        break;
      case StoryReactionType.angry:
        emoji = '😡';
        break;
      case StoryReactionType.like:
        emoji = '👍';
        break;
    }

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppTheme.shimmerBaseColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      title: Text(
        'User ${reaction.userId.substring(0, 8)}',
        style: AppTypography.body1,
      ),
      subtitle: Text(
        reaction.timeAgo,
        style: AppTypography.caption2.copyWith(
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }
}