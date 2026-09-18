import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'progress_bar.dart';

/// Card course untuk section "Lanjutkan Belajar" (horizontal, dengan progress).
class ContinueCourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const ContinueCourseCard({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: 170,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                color: course.tintColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(course.icon, color: course.iconColor, size: 26),
              alignment: Alignment.center,
            ),
            const SizedBox(height: 10),
            Text(
              course.title,
              style: AppTextStyles.h3,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            AppProgressBar(percent: course.progressPercent),
          ],
        ),
      ),
    );
  }
}

class GridCourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const GridCourseCard({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: course.tintColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(course.icon, color: course.iconColor, size: 22),
            ),
            const SizedBox(height: 8),
            Text(
              course.title,
              style: AppTextStyles.h3.copyWith(fontSize: 13),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(course.category, style: AppTextStyles.caption),
          ],
        ),
      ),
    );
  }
}

/// Card course untuk Forum landing — menampilkan jumlah diskusi aktif.
class ForumCourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const ForumCourseCard({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: course.tintColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(course.icon, color: course.iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.title, style: AppTextStyles.h3),
                  const SizedBox(height: 2),
                  Text(
                    '${course.activeDiscussionCount} diskusi aktif',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}
