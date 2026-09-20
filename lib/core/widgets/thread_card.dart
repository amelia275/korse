import 'package:flutter/material.dart';
import '../../models/thread.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class InitialsAvatar extends StatelessWidget {
  final String initials;
  final double size;
  final Color bg;
  final Color fg;

  const InitialsAvatar({
    super.key,
    required this.initials,
    this.size = 30,
    this.bg = AppColors.mint,
    this.fg = AppColors.navy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(fontSize: size * 0.36, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }
}

class ThreadCard extends StatelessWidget {
  final Thread thread;
  final VoidCallback onTap;

  const ThreadCard({super.key, required this.thread, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InitialsAvatar(initials: thread.authorInitials, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${thread.authorName} · ${thread.timeAgo}',
                    style: AppTextStyles.caption,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (thread.isSolved)
                  const Icon(Icons.check_circle_rounded, size: 15, color: AppColors.success),
              ],
            ),
            const SizedBox(height: 6),
            Text(thread.title, style: AppTextStyles.h3, maxLines: 2, overflow: TextOverflow.ellipsis),
            if (thread.preview.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(thread.preview, style: AppTextStyles.bodySecondary, maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.chat_bubble_outline_rounded, size: 13, color: AppColors.textMuted),
                const SizedBox(width: 4),
                Text('${thread.replyCount} balasan', style: AppTextStyles.caption),
                const SizedBox(width: 14),
                const Icon(Icons.favorite_border_rounded, size: 13, color: AppColors.textMuted),
                const SizedBox(width: 4),
                Text('${thread.likeCount}', style: AppTextStyles.caption),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
