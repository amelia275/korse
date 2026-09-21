import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/avatar.dart';
import '../../core/widgets/course_card.dart';
import '../../core/widgets/pills.dart';
import '../../data/dummy_data.dart';
import '../achievement/achievement_screen.dart';
import '../course/course_detail_screen.dart';
import '../forum/forum_landing_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final started = DummyData.courses.where((c) => c.isStarted).toList();
    final all = DummyData.courses;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Korse', style: AppTextStyles.h2),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              ),
              child: const AppAvatar(asset: DummyData.avatarUser, size: 50),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selamat pagi,', style: AppTextStyles.bodySecondary),
                    Text(DummyData.userName, style: AppTextStyles.h1),
                  ],
                ),
                InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchScreen()),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('Cari course...', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
            const SizedBox(height: 24),
            if (started.isNotEmpty) ...[
              SectionHeader(
                title: 'Lanjutkan belajar',
                leadingBadge: Pill.mint('${started.length} Aktif'),
                trailing: 'Lihat semua',
                trailingIsAction: true,
              ),
              SizedBox(
                height: 158,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: started.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final course = started[i];
                    return ContinueCourseCard(
                      course: course,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CourseDetailScreen(course: course),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 26),
            ],
            const SectionHeader(title: 'Semua course'),
            const FilterChipsRow(labels: DummyData.courseFilters),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: all.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 196,
              ),
              itemBuilder: (context, i) {
                final course = all[i];
                return GridCourseCard(
                  course: course,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourseDetailScreen(course: course),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
          ]
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => target),
    );
  }
}
