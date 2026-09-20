import 'package:flutter/material.dart';
import '../../models/progress_status.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

// Kotak ikon status
class StatusIndicator extends StatelessWidget {
  final ProgressStatus status;
  final double size;
  final IconData? customIcon;

  const StatusIndicator({
    super.key,
    required this.status,
    this.size = 38,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    late final Color bg;
    late final Color fg;
    late final IconData icon;

    switch (status) {
      case ProgressStatus.completed:
        bg = AppColors.successBg;
        fg = AppColors.success;
        icon = Icons.check_circle_rounded;
        break;
      case ProgressStatus.inProgress:
        bg = AppColors.mint;
        fg = AppColors.navy;
        icon = Icons.show_chart_rounded;
        break;
      case ProgressStatus.locked:
        bg = AppColors.lockedBg;
        fg = AppColors.locked;
        icon = Icons.lock_rounded;
        break;
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(size * 0.3),
      ),
      alignment: Alignment.center,
      child: Icon(customIcon ?? icon, size: size * 0.46, color: fg),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final ProgressStatus status;
  final String? overrideLabel;

  const StatusBadge({super.key, required this.status, this.overrideLabel});

  @override
  Widget build(BuildContext context) {
    late final String label;
    late final Color bg;
    late final Color fg;
    var showDot = false;

    switch (status) {
      case ProgressStatus.completed:
        label = 'Selesai';
        bg = AppColors.successBg;
        fg = AppColors.success;
        break;
      case ProgressStatus.inProgress:
        label = 'Sedang Belajar';
        bg = AppColors.mint;
        showDot = true;
        fg = AppColors.navy;
        break;
      case ProgressStatus.locked:
        label = 'Terkunci';
        bg = AppColors.lockedBg;
        fg = AppColors.locked;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
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
          Text(
            overrideLabel ?? label,
            style: AppTextStyles.badge.copyWith(color: fg),
          ),
        ],
      ),
    );
  }
}
