import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/avatar.dart';
import '../../core/widgets/course_card.dart';
import '../../core/widgets/pills.dart';
import '../../data/dummy_data.dart';
import '../achievement/achievement_screen.dart';
import '../course/all_courses_screen.dart';
import '../course/course_detail_screen.dart';
import '../forum/forum_landing_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final started = DummyData.courses.where((c) => c.isStarted).toList();
    final popular = DummyData.courses.take(3).toList();

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
              child: const AppAvatar(asset: DummyData.avatarUser, size: 34),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DummyData.greeting, style: AppTextStyles.bodySecondary),
                SizedBox(height: 2),
                Text(DummyData.userName, style: AppTextStyles.display),
              ],
            ),
            const SizedBox(height: 16),
            const PromoBannerCard(),
            const SizedBox(height: 16),
            SearchBox(
              hint: 'Cari course...',
              trailingIcon: Icons.tune_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
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
            const ProgressWeeklyCard(),
            SectionHeader(
              title: 'Course Populer',
              trailing: 'Lihat semua',
              trailingIsAction: true,
              onTrailingTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AllCoursesScreen()),
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: popular.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 196,
              ),
              itemBuilder: (context, i) {
                final course = popular[i];
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

class PromoBannerCard extends StatelessWidget {
  const PromoBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.navy, AppColors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Diskon 50% Kursus Flutter!',
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.onPrimary,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Tingkatkan skill-mu dan mulai belajar hari ini.',
                      style: AppTextStyles.bodySecondary.copyWith(
                        color: AppColors.onPrimary.withValues(alpha: 0.82),
                        fontSize: 11.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.onPrimary,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Text(
                        'Klaim Sekarang',
                        style: AppTextStyles.badge,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 68),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.onPrimary.withValues(alpha: 0.16),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_fire_department_rounded,
                color: AppColors.onPrimary,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressWeeklyCard extends StatelessWidget {
  const ProgressWeeklyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.blue.withValues(alpha: 0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progress Minggu Ini',
                style: AppTextStyles.h2.copyWith(fontSize: 17),
              ),
              Text(
                '60%',
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.blue,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Target Belajar',
            style: AppTextStyles.bodySecondary,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3 dari 5 hari',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '60%',
                style: AppTextStyles.bodySecondary,
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: 0.6,
              minHeight: 8,
              backgroundColor: AppColors.skyBlue.withValues(alpha: 0.25),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.blue,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _ProgressItem(
                  icon: Icons.local_fire_department_rounded,
                  value: '4 Hari',
                  label: 'Streak',
                ),
              ),
              Expanded(
                child: _ProgressItem(
                  icon: Icons.menu_book_rounded,
                  value: '3 Modul',
                  label: 'Selesai',
                ),
              ),
              Expanded(
                child: _ProgressItem(
                  icon: Icons.schedule_rounded,
                  value: '2j 45m',
                  label: 'Belajar',
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Tetap konsisten! Tinggal 2 hari lagi untuk mencapai target.',
            style: AppTextStyles.bodySecondary.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _ProgressItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.mint,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppColors.navy,
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: AppTextStyles.body.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Text(
              label,
              style: AppTextStyles.bodySecondary.copyWith(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
