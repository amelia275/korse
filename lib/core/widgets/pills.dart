import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Badge kecil (status, kategori, modul, level).
class Pill extends StatelessWidget {
  final String label;
  final Color bg;
  final Color fg;
  final IconData? icon;
  final bool showDot;
  final EdgeInsets padding;
  final Color? borderColor;

  const Pill({
    super.key,
    required this.label,
    this.bg = AppColors.surfaceMuted,
    this.fg = AppColors.textSecondary,
    this.icon,
    this.showDot = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    this.borderColor,
  });

  const Pill.mint(this.label, {super.key, this.icon, this.showDot = false})
      : bg = AppColors.mint,
        fg = AppColors.navy,
        borderColor = null,
        padding = const EdgeInsets.symmetric(horizontal: 9, vertical: 5);

  const Pill.success(this.label, {super.key, this.icon, this.showDot = false})
      : bg = AppColors.successBg,
        fg = AppColors.success,
        borderColor = null,
        padding = const EdgeInsets.symmetric(horizontal: 9, vertical: 5);

  const Pill.navy(this.label, {super.key, this.icon, this.showDot = false})
      : bg = AppColors.navy,
        fg = AppColors.onPrimary,
        borderColor = null,
        padding = const EdgeInsets.symmetric(horizontal: 9, vertical: 5);

  const Pill.locked(this.label, {super.key, this.icon, this.showDot = false})
      : bg = AppColors.lockedBg,
        fg = AppColors.locked,
        borderColor = null,
        padding = const EdgeInsets.symmetric(horizontal: 9, vertical: 5);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: borderColor == null ? null : Border.all(color: borderColor!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: fg, shape: BoxShape.circle),
            ),
            const SizedBox(width: 5),
          ],
          if (icon != null) ...[
            Icon(icon, size: 12, color: fg),
            const SizedBox(width: 4),
          ],
          Text(label, style: AppTextStyles.badge.copyWith(color: fg)),
        ],
      ),
    );
  }
}

/// Judul section + teks kecil di kanan
class SectionHeader extends StatelessWidget {
  final String title;
  final String trailing;
  final Widget? leadingBadge;
  final bool trailingIsAction;

  const SectionHeader({
    super.key,
    required this.title,
    this.trailing = '',
    this.leadingBadge,
    this.trailingIsAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Flexible(
            child: Text(
              title,
              style: AppTextStyles.h2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (leadingBadge != null) ...[
            const SizedBox(width: 8),
            leadingBadge!,
          ],
          const Spacer(),
          if (trailing.isNotEmpty)
            Text(
              trailing,
              style: AppTextStyles.caption.copyWith(
                color: trailingIsAction ? AppColors.blue : AppColors.textMuted,
                fontWeight: trailingIsAction ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}

class FilterChipsRow extends StatelessWidget {
  final List<String> labels;
  final int activeIndex;
  final EdgeInsets padding;

  const FilterChipsRow({
    super.key,
    required this.labels,
    this.activeIndex = 0,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: labels.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final active = i == activeIndex;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: active ? AppColors.navy : AppColors.background,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: active ? AppColors.navy : AppColors.border,
              ),
            ),
            child: Text(
              labels[i],
              style: AppTextStyles.badge.copyWith(
                fontSize: 12,
                color: active ? AppColors.onPrimary : AppColors.textSecondary,
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final String hint;
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  const SearchBox({
    super.key,
    required this.hint,
    this.trailingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surfaceMuted,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            const Icon(Icons.search_rounded, size: 18, color: AppColors.textMuted),
            const SizedBox(width: 10),
            Expanded(child: Text(hint, style: AppTextStyles.bodySecondary)),
            if (trailingIcon != null)
              Icon(trailingIcon, size: 18, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

class MetaItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const MetaItem({
    super.key,
    required this.icon,
    required this.label,
    this.color = AppColors.textMuted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 5),
        Text(label, style: AppTextStyles.caption.copyWith(color: color)),
      ],
    );
  }
}

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final Color? borderColor;
  final double radius;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.margin = EdgeInsets.zero,
    this.color = AppColors.background,
    this.borderColor,
    this.radius = 16,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor ?? AppColors.border),
      ),
      child: child,
    );

    return Padding(
      padding: margin,
      child: onTap == null
          ? content
          : InkWell(
              borderRadius: BorderRadius.circular(radius),
              onTap: onTap,
              child: content,
            ),
    );
  }
}

class AttachmentChip extends StatelessWidget {
  final String name;
  final String size;

  const AttachmentChip({super.key, required this.name, this.size = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.description_rounded, size: 15, color: AppColors.blue),
          const SizedBox(width: 7),
          Flexible(
            child: Text(
              name,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (size.isNotEmpty) ...[
            const SizedBox(width: 8),
            Text(size, style: AppTextStyles.caption),
          ],
        ],
      ),
    );
  }
}