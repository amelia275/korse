import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/course_card.dart';
import '../../data/dummy_data.dart';
import '../achievement/achievement_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import 'thread_list_screen.dart';

class ForumLandingScreen extends StatelessWidget {
  const ForumLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = DummyData.courses;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Forum')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Pilih course untuk lihat diskusinya',
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(height: 12),
            ...courses.map(
              (course) => ForumCourseCard(
                course: course,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ThreadListScreen(course: course)),
                ),
              ),
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => target));
  }
}
