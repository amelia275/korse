import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppAvatar extends StatelessWidget {
  final String asset;
  final String initials;
  final double size;
  final Color bg;
  final Color fg;
  final bool showRing;

  const AppAvatar({
    super.key,
    this.asset = '',
    this.initials = '',
    this.size = 32,
    this.bg = AppColors.mint,
    this.fg = AppColors.navy,
    this.showRing = false,
  });

  @override
  Widget build(BuildContext context) {
    final child = asset.isNotEmpty
        ? Image.asset(asset, width: size, height: size, fit: BoxFit.cover)
        : Container(
            width: size,
            height: size,
            color: bg,
            alignment: Alignment.center,
            child: Text(
              initials,
              style: AppTextStyles.h3.copyWith(
                fontSize: size * 0.36,
                color: fg,
              ),
            ),
          );

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bg,
        border: showRing
            ? Border.all(color: AppColors.background, width: 2)
            : null,
      ),
      child: ClipOval(child: child),
    );
  }
}

class AvatarStack extends StatelessWidget {
  final List<String> assets;
  final int extraCount;
  final double size;

  const AvatarStack({
    super.key,
    required this.assets,
    this.extraCount = 0,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    final overlap = size * 0.32;
    final width = assets.isEmpty
        ? 0.0
        : size + (assets.length - 1) * (size - overlap);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width,
          height: size,
          child: Stack(
            children: [
              for (var i = 0; i < assets.length; i++)
                Positioned(
                  left: i * (size - overlap),
                  child: AppAvatar(
                    asset: assets[i],
                    size: size,
                    showRing: true,
                  ),
                ),
            ],
          ),
        ),
        if (extraCount > 0) ...[
          const SizedBox(width: 4),
          Container(
            height: size,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surfaceMuted,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(size),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              '+$extraCount',
              style: AppTextStyles.badge.copyWith(color: AppColors.textSecondary),
            ),
          ),
        ],
      ],
    );
  }
}