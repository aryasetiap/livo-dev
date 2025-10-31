import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';
import 'lottie_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  final double? size;
  final bool showBackground;
  final Color? color;

  const LoadingWidget({
    super.key,
    this.message,
    this.size,
    this.showBackground = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final loadingColor = color ?? AppTheme.primaryColor;

    Widget loadingContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Try to show Lottie animation first
        LoadingAnimation(size: size ?? 60),
        const SizedBox(height: 16),
        if (message != null) ...[
          Text(
            message!,
            style: AppTypography.withColor(AppTypography.body2, (
              showBackground ? AppTheme.textPrimary : AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );

    if (showBackground) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: loadingContent,
        ),
      );
    }

    return Center(
      child: loadingContent,
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final String? message;
  final Color? backgroundColor;

  const LoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.message,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: backgroundColor?.withValues(alpha: 0.8) ?? Colors.black.withValues(alpha: 0.5),
            child: Center(
              child: LoadingWidget(
                message: message,
                showBackground: false,
              ),
            ),
          ),
      ],
    );
  }
}

class LoadingButton extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final VoidCallback? onPressed;
  final bool disabled;

  const LoadingButton({
    super.key,
    required this.child,
    required this.isLoading,
    this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isLoading || disabled) ? null : onPressed,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : child,
    );
  }
}

class LoadingListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;

  const LoadingListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isLoading
          ? SizedBox(
              width: 40,
              height: 40,
              child: SpinKitCircle(
                color: AppTheme.primaryColor,
                size: 20,
              ),
            )
          : leading,
      title: isLoading
          ? Container(
              height: 16,
              decoration: BoxDecoration(
                color: AppTheme.shimmerBaseColor,
                borderRadius: BorderRadius.circular(4),
              ),
            )
          : Text(title),
      subtitle: isLoading
          ? Container(
              height: 12,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: AppTheme.shimmerBaseColor,
                borderRadius: BorderRadius.circular(4),
              ),
            )
          : subtitle != null
              ? Text(subtitle!)
              : null,
      trailing: isLoading
          ? Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppTheme.shimmerBaseColor,
                borderRadius: BorderRadius.circular(4),
              ),
            )
          : trailing,
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration? duration;

  const ShimmerLoading({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [
            baseColor ?? AppTheme.shimmerBaseColor,
            highlightColor ?? AppTheme.shimmerHighlightColor,
            baseColor ?? AppTheme.shimmerBaseColor,
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: AnimatedContainer(
        duration: duration ?? const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        child: child,
      ),
    );
  }
}

class LoadingCard extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsets? padding;

  const LoadingCard({
    super.key,
    this.height = 100,
    this.width = double.infinity,
    this.borderRadius = 8,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ShimmerLoading(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppTheme.shimmerBaseColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

class LoadingList extends StatelessWidget {
  final int itemCount;
  final double itemHeight;
  final EdgeInsets? padding;

  const LoadingList({
    super.key,
    required this.itemCount,
    this.itemHeight = 80,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        children: List.generate(
          itemCount,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: LoadingListItem(
              title: '',
              isLoading: true,
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingGrid extends StatelessWidget {
  final int itemCount;
  final double itemSize;
  final int crossAxisCount;
  final EdgeInsets? padding;

  const LoadingGrid({
    super.key,
    required this.itemCount,
    this.itemSize = 120,
    this.crossAxisCount = 3,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 1,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ShimmerLoading(
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.shimmerBaseColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}

class InlineLoadingIndicator extends StatelessWidget {
  final String? message;
  final Color? color;
  final double size;

  const InlineLoadingIndicator({
    super.key,
    this.message,
    this.color,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    final indicatorColor = color ?? AppTheme.primaryColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpinKitCircle(
          color: indicatorColor,
          size: size,
        ),
        if (message != null) ...[
          const SizedBox(width: 12),
          Text(
            message!,
            style: AppTypography.body2.copyWith(
              color: indicatorColor,
            ),
          ),
        ],
      ],
    );
  }
}

class PageLoadingIndicator extends StatelessWidget {
  final String? message;
  final Color? color;

  const PageLoadingIndicator({
    super.key,
    this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimation(size: 80),
          const SizedBox(height: 24),
          if (message != null)
            Text(
              message!,
              style: AppTypography.body1.copyWith(
                color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}

// Loading widget for pull-to-refresh
class RefreshLoadingWidget extends StatelessWidget {
  final String? message;
  final Color? color;

  const RefreshLoadingWidget({
    super.key,
    this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitCircle(
              color: color ?? AppTheme.primaryColor,
              size: 24,
            ),
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(
                message!,
                style: AppTypography.body2.copyWith(
                  color: color ?? AppTheme.primaryColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}