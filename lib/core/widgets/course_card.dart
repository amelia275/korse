import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'avatar.dart';
import 'pills.dart';
import 'progress_bar.dart';

class ContinueCourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const ContinueCourseCard({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: AppCard(
        onTap: onTap,
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: course.tintColor,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  alignment: Alignment.center,
                  child: Icon(course.icon, size: 17, color: course.iconColor),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Pill.mint(course.continueModuleLabel),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              course.title,
              style: AppTextStyles.h2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Kemajuan', style: AppTextStyles.caption),
                const Spacer(),
                Text(
                  '${course.progressPercent}%',
                  style: AppTextStyles.badge.copyWith(
                    fontSize: 12,
                    color: AppColors.navy,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            AppProgressBar(percent: course.progressPercent, height: 5),
          ],
        ),
      ),
    );
  }
}


class GridCourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const GridCourseCard({
    super.key,
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image.asset(
                  course.coverAsset,
                  height: 82,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Pill(
                  label: course.category,
                  bg: AppColors.background,
                  fg: AppColors.navy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            course.title,
            style: AppTextStyles.h3,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          Text(
            course.structureLabel,
            style: AppTextStyles.caption,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star_rounded, size: 14, color: AppColors.blue),
              const SizedBox(width: 3),
              Text(
                course.ratingLabel,
                style: AppTextStyles.badge.copyWith(
                  fontSize: 11.5,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '· ${course.levelLabel}',
                  style: AppTextStyles.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ForumChannelCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const ForumChannelCard({
    super.key,
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: course.tintColor,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Icon(course.icon, size: 20, color: course.iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        course.title,
                        style: AppTextStyles.h3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (course.hasNewDiscussion) ...[
                      const SizedBox(width: 6),
                      const Pill.mint('Baru'),
                    ],
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  '${course.activeDiscussionCount} diskusi aktif',
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          if (course.participantAvatars.isNotEmpty) ...[
            AvatarStack(assets: course.participantAvatars, size: 22),
            const SizedBox(width: 6),
          ],
          const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}