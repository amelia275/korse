import 'package:flutter/material.dart';
import '../../models/progress_status.dart';
import '../theme/app_colors.dart';

class StatusIndicator extends StatelessWidget {
  final ProgressStatus status;
  final double size;

  const StatusIndicator({super.key, required this.status, this.size = 26});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ProgressStatus.completed:
        return Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(color: AppColors.successBg, shape: BoxShape.circle),
          child: const Icon(Icons.check_rounded, size: 15, color: AppColors.success),
        );
      case ProgressStatus.inProgress:
        return Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(color: AppColors.mint, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Container(
            width: size * 0.3,
            height: size * 0.3,
            decoration: const BoxDecoration(color: AppColors.blue, shape: BoxShape.circle),
          ),
        );
      case ProgressStatus.locked:
        return Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(color: AppColors.lockedBg, shape: BoxShape.circle),
          child: Icon(Icons.lock_rounded, size: 13, color: AppColors.locked),
        );
    }
  }
}

class StatusBadge extends StatelessWidget {
  final ProgressStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    late final String label;
    late final Color bg;
    late final Color fg;
    switch (status) {
      case ProgressStatus.completed:
        label = 'Selesai';
        bg = AppColors.successBg;
        fg = AppColors.success;
        break;
      case ProgressStatus.inProgress:
        label = 'Sedang Belajar';
        bg = AppColors.mint;
        fg = AppColors.navy;
        break;
      case ProgressStatus.locked:
        label = 'Terkunci';
        bg = AppColors.lockedBg;
        fg = AppColors.locked;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }
}
