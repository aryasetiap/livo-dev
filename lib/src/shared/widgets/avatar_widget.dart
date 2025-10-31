import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';
import '../../shared/models/user_model.dart';

class AvatarWidget extends StatelessWidget {
  final String? imageUrl;
  final String username;
  final double size;
  final bool showBorder;
  final Color? borderColor;
  final double borderWidth;
  final VoidCallback? onTap;
  final bool showShadow;
  final bool showOnlineIndicator;
  final bool isOnline;

  const AvatarWidget({
    super.key,
    this.imageUrl,
    required this.username,
    this.size = 40,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth = 2,
    this.onTap,
    this.showShadow = false,
    this.showOnlineIndicator = false,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = size;
    final avatarColor = borderColor ?? AppTheme.primaryColor;

    Widget avatar = Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(UserExtensions(User.minimal(
          id: '',
          username: username,
        )).avatarColorCode).withOpacity(0.1),
        border: showBorder
            ? Border.all(
                color: avatarColor,
                width: borderWidth,
              )
            : null,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ClipOval(
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                width: avatarSize,
                height: avatarSize,
                fit: BoxFit.cover,
                placeholder: (context, url) => _buildPlaceholder(),
                errorWidget: (context, url, error) => _buildPlaceholder(),
                memCacheWidth: (avatarSize * 2).round(),
                memCacheHeight: (avatarSize * 2).round(),
              )
            : _buildPlaceholder(),
      ),
    );

    if (showOnlineIndicator) {
      avatar = Stack(
        children: [
          avatar,
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: avatarSize * 0.25,
              height: avatarSize * 0.25,
              decoration: BoxDecoration(
                color: isOnline ? AppTheme.successColor : AppTheme.textSecondary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (onTap != null) {
      avatar = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(avatarSize / 2),
        child: avatar,
      );
    }

    return avatar;
  }

  Widget _buildPlaceholder() {
    final user = User.minimal(
      id: '',
      username: username,
    );

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(user.avatarColorCode).withOpacity(0.2),
      ),
      child: Center(
        child: Text(
          user.initials,
          style: AppTypography.body1.copyWith(
            color: Color(user.avatarColorCode),
            fontSize: size * 0.4,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// Avatar sizes for common use cases
class AvatarSizes {
  static const double tiny = 24;
  static const double small = 32;
  static const double medium = 48;
  static const double large = 64;
  static const double extraLarge = 80;
  static const double huge = 120;
}

// Pre-built avatar widgets for common use cases
class SmallAvatar extends StatelessWidget {
  final String? imageUrl;
  final String username;
  final VoidCallback? onTap;
  final bool showOnlineIndicator;
  final bool isOnline;

  const SmallAvatar({
    super.key,
    this.imageUrl,
    required this.username,
    this.onTap,
    this.showOnlineIndicator = false,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return AvatarWidget(
      imageUrl: imageUrl,
      username: username,
      size: AvatarSizes.small,
      onTap: onTap,
      showOnlineIndicator: showOnlineIndicator,
      isOnline: isOnline,
    );
  }
}

class MediumAvatar extends StatelessWidget {
  final String? imageUrl;
  final String username;
  final VoidCallback? onTap;
  final bool showBorder;
  final bool showOnlineIndicator;
  final bool isOnline;

  const MediumAvatar({
    super.key,
    this.imageUrl,
    required this.username,
    this.onTap,
    this.showBorder = false,
    this.showOnlineIndicator = false,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return AvatarWidget(
      imageUrl: imageUrl,
      username: username,
      size: AvatarSizes.medium,
      onTap: onTap,
      showBorder: showBorder,
      showOnlineIndicator: showOnlineIndicator,
      isOnline: isOnline,
    );
  }
}

class LargeAvatar extends StatelessWidget {
  final String? imageUrl;
  final String username;
  final VoidCallback? onTap;
  final bool showBorder;
  final bool showShadow;
  final bool showOnlineIndicator;
  final bool isOnline;

  const LargeAvatar({
    super.key,
    this.imageUrl,
    required this.username,
    this.onTap,
    this.showBorder = false,
    this.showShadow = false,
    this.showOnlineIndicator = false,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return AvatarWidget(
      imageUrl: imageUrl,
      username: username,
      size: AvatarSizes.large,
      onTap: onTap,
      showBorder: showBorder,
      showShadow: showShadow,
      showOnlineIndicator: showOnlineIndicator,
      isOnline: isOnline,
    );
  }
}

class ExtraLargeAvatar extends StatelessWidget {
  final String? imageUrl;
  final String username;
  final VoidCallback? onTap;
  final bool showBorder;
  final bool showShadow;

  const ExtraLargeAvatar({
    super.key,
    this.imageUrl,
    required this.username,
    this.onTap,
    this.showBorder = false,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return AvatarWidget(
      imageUrl: imageUrl,
      username: username,
      size: AvatarSizes.extraLarge,
      onTap: onTap,
      showBorder: showBorder,
      showShadow: showShadow,
    );
  }
}

// Avatar list widget for displaying multiple avatars
class AvatarList extends StatelessWidget {
  final List<AvatarItem> avatars;
  final double avatarSize;
  final int maxVisible;
  final bool showBorder;
  final VoidCallback? onAvatarTap;

  const AvatarList({
    super.key,
    required this.avatars,
    this.avatarSize = AvatarSizes.small,
    this.maxVisible = 3,
    this.showBorder = false,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    if (avatars.isEmpty) {
      return const SizedBox.shrink();
    }

    final visibleAvatars = avatars.take(maxVisible).toList();
    final remainingCount = avatars.length - maxVisible;

    return Row(
      children: [
        ...visibleAvatars.asMap().entries.map((entry) {
          final index = entry.key;
          final avatar = entry.value;

          return Padding(
            padding: EdgeInsets.only(
              left: index > 0 ? -avatarSize * 0.3 : 0,
            ),
            child: AvatarWidget(
              imageUrl: avatar.imageUrl,
              username: avatar.username,
              size: avatarSize,
              showBorder: showBorder,
              onTap: () => onAvatarTap?.call(avatar),
            ),
          );
        }),
        if (remainingCount > 0) ...[
          Padding(
            padding: EdgeInsets.only(left: -avatarSize * 0.3),
            child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.borderColor,
                border: showBorder
                    ? Border.all(
                        color: AppTheme.borderColor,
                        width: 2,
                      )
                    : null,
              ),
              child: Center(
                child: Text(
                  '+$remainingCount',
                  style: AppTypography.caption2.copyWith(
                    color: AppTheme.textSecondary,
                    fontSize: avatarSize * 0.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// Avatar item class
class AvatarItem {
  final String? imageUrl;
  final String username;
  final String? userId;

  const AvatarItem({
    required this.username,
    this.imageUrl,
    this.userId,
  });

  AvatarItem.fromUser(User user)
      : username = user.displayNameOrUsername,
        imageUrl = user.avatarUrl,
        userId = user.id;
}