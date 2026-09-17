import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/material_tile.dart';
import '../../core/widgets/progress_bar.dart';
import '../../models/course.dart';
import '../chapter/chapter_detail_screen.dart';
import '../forum/thread_list_screen.dart';

/// Halaman Course — nested screen (tanpa bottom nav).
/// Cover, deskripsi, progress keseluruhan, dan daftar Bab.
class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 120,
              decoration: BoxDecoration(
                color: course.tintColor,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Icon(course.icon, size: 44, color: course.iconColor),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.title, style: AppTextStyles.h1),
                  const SizedBox(height: 6),
                  Text(course.description, style: AppTextStyles.bodySecondary),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Progress', style: AppTextStyles.caption),
                      Text(
                        '${course.progressPercent}%',
                        style: AppTextStyles.caption.copyWith(color: AppColors.navy, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  AppProgressBar(percent: course.progressPercent),
                  const SizedBox(height: 24),
                  const Text('Bab', style: AppTextStyles.h2),
                  const SizedBox(height: 12),
                  ...course.chapters.map(
                    (chapter) => ChapterTile(
                      chapter: chapter,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChapterDetailScreen(course: course, chapter: chapter),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    label: 'Diskusi',
                    icon: Icons.forum_rounded,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ThreadListScreen(course: course)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
