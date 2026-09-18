import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/app_button.dart';
import '../../data/dummy_data.dart';
import '../../models/achievement.dart';
import '../forum/forum_landing_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Achievement')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: DummyData.achievements.map((a) => _AchievementCard(achievement: a)).toList(),
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 2,
        onTap: (i) => _handleNavTap(context, i),
      ),
    );
  }

  void _handleNavTap(BuildContext context, int index) {
    if (index == 2) return;
    late final Widget target;
    switch (index) {
      case 0:
        target = const HomeScreen();
        break;
      case 1:
        target = const ForumLandingScreen();
        break;
      default:
        target = const ProfileScreen();
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => target));
  }
}

class _AchievementCard extends StatelessWidget {
  final Achievement achievement;

  const _AchievementCard({required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: achievement.isCompleted ? 1 : 0.55,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: achievement.isCompleted ? AppColors.mint : AppColors.lockedBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.emoji_events_rounded,
                    color: achievement.isCompleted ? AppColors.navy : AppColors.locked,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(achievement.courseTitle, style: AppTextStyles.h3),
                      const SizedBox(height: 2),
                      Text(achievement.subtitle, style: AppTextStyles.caption),
                    ],
                  ),
                ),
              ],
            ),
            if (achievement.isCompleted) ...[
              const SizedBox(height: 12),
              SecondaryButton(label: 'Lihat Sertifikat', onPressed: () {}),
            ],
          ],
        ),
      ),
    );
  }
}
