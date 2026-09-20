import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/course_card.dart';
import '../../core/widgets/pills.dart';
import '../../core/widgets/thread_card.dart';
import '../../data/dummy_data.dart';
import '../../models/course.dart';
import '../achievement/achievement_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import 'thread_list_screen.dart';

class ForumLandingScreen extends StatelessWidget {
  const ForumLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final channels = DummyData.courses
        .where((c) => c.activeDiscussionCount > 0)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Korse')),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('Forum Komunitas', style: AppTextStyles.display),
                ),
                SizedBox(width: 10),
                Pill.success(
                  DummyData.forumOnlineLabel,
                  showDot: true,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Diskusikan materi, tanyakan soal, dan belajar bersama komunitas pembelajar.',
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(height: 18),
            const SearchBox(hint: 'Cari forum atau topik diskusi...'),
            const SizedBox(height: 16),
            const FilterChipsRow(labels: DummyData.forumFilters),
            const SizedBox(height: 24),
            SectionHeader(
              title: 'Kanal Kursus',
              trailing: '${channels.length} Saluran Tersedia',
            ),
            ...channels.map(
              (course) => ForumChannelCard(
                course: course,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ThreadListScreen(course: course),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const SectionHeader(
              leadingBadge: Icon(
                Icons.local_fire_department,
                color: AppColors.navy,
                ),
              title: 'Diskusi Hangat Hari Ini',
              trailing: 'Lihat Semua',
              trailingIsAction: true,
            ),
            ...DummyData.hotThreads.map(
              (thread) => HotThreadTile(
                thread: thread,
                courseTitle: _courseTitle(thread.courseId),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ThreadListScreen(
                      course: _courseOf(thread.courseId),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            PillButton(
              label: 'Buat Diskusi',
              icon: Icons.add_rounded,
              onPressed: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 1,
        onTap: (i) => _handleNavTap(context, i),
      ),
    );
  }

  Course _courseOf(String id) =>
      DummyData.courses.firstWhere((c) => c.id == id);

  String _courseTitle(String id) => _courseOf(id).title;

  void _handleNavTap(BuildContext context, int index) {
    if (index == 1) return;
    late final Widget target;
    switch (index) {
      case 0:
        target = const HomeScreen();
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