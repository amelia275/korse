import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/course_card.dart';
import '../../core/widgets/thread_card.dart';
import '../../data/dummy_data.dart';
import '../achievement/achievement_screen.dart';
import '../course/course_detail_screen.dart';
import '../forum/forum_landing_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';

/// Home — top-level screen #1 (punya bottom nav).
/// Isinya daftar Course dikelompokkan berdasarkan status belajar:
/// "Lanjutkan Belajar" (yang sudah punya progress) dan "Semua Course".
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final started = DummyData.courses.where((c) => c.isStarted).toList();
    final all = DummyData.courses;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selamat pagi,', style: AppTextStyles.bodySecondary),
                    Text(DummyData.userName, style: AppTextStyles.h1),
                  ],
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  ),
                  child: const InitialsAvatar(initials: 'A', size: 40),
                ),
              ],
            ),
            const SizedBox(height: 16),
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceMuted,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search_rounded, size: 18, color: AppColors.textMuted),
                    SizedBox(width: 8),
                    Text('Cari course...', style: AppTextStyles.bodySecondary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (started.isNotEmpty) ...[
              const Text('Lanjutkan Belajar', style: AppTextStyles.h2),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: started.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, i) {
                    final course = started[i];
                    return ContinueCourseCard(
                      course: course,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CourseDetailScreen(course: course)),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
            const Text('Semua Course', style: AppTextStyles.h2),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: all.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, i) {
                final course = all[i];
                return GridCourseCard(
                  course: course,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CourseDetailScreen(course: course)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 0,
        onTap: (i) => _handleNavTap(context, i),
      ),
    );
  }

  void _handleNavTap(BuildContext context, int index) {
    if (index == 0) return;
    late final Widget target;
    switch (index) {
      case 1:
        target = const ForumLandingScreen();
        break;
      case 2:
        target = const AchievementScreen();
        break;
      default:
        target = const ProfileScreen();
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => target));
  }
}
