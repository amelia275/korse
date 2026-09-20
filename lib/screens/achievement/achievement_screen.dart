import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/pills.dart';
import '../../core/widgets/progress_bar.dart';
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
      appBar: AppBar(title: const Text('Pencapaian Belajar')),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
          children: [
            const Row(
              children: [
                Icon(Icons.verified_rounded, size: 20, color: AppColors.navy),
                SizedBox(width: 8),
                Expanded(
                  child: Text('Pencapaian Belajar', style: AppTextStyles.h1),
                ),
                Pill.mint(DummyData.achievementLevelLabel),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                _SummaryDot(
                  label: DummyData.achievementSummaryDone,
                  color: AppColors.navy,
                ),
                SizedBox(width: 18),
                _SummaryDot(
                  label: DummyData.achievementSummaryProgress,
                  color: AppColors.skyBlue,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SectionHeader(
              title: 'Sertifikat Kursus',
              trailing: 'TERVERIFIKASI',
            ),
            ...DummyData.achievements.map(
              (a) => _AchievementCard(achievement: a),
            ),
            const SizedBox(height: 10),
            AppCard(
              color: AppColors.surfaceMuted,
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DummyData.achievementTargetTitle, style: AppTextStyles.h3),
                        SizedBox(height: 4),
                        Text(DummyData.achievementTargetBody, style: AppTextStyles.bodySecondary),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: AppColors.mint,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.emoji_events_rounded, size: 18, color: AppColors.navy),
                  ),
                ],
              ),
            ),
          ],
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => target),
    );
  }
}

class _SummaryDot extends StatelessWidget {
  final String label;
  final Color color;

  const _SummaryDot({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 7),
        Text(label, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
      ],
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final Achievement achievement;

  const _AchievementCard({required this.achievement});

  @override
  Widget build(BuildContext context) {
    final done = achievement.isCompleted;

    return AppCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: done ? AppColors.calloutTipsBg : AppColors.lockedBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Icon(
                  done ? Icons.workspace_premium_rounded : Icons.lock_rounded,
                  size: 19,
                  color: done ? AppColors.calloutTipsFg : AppColors.locked,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      achievement.courseTitle,
                      style: AppTextStyles.h3.copyWith(
                        color: done ? AppColors.textPrimary : AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(achievement.subtitle, style: AppTextStyles.caption),
                  ],
                ),
              ),
              done
                  ? Pill.success(achievement.statusLabel, icon: Icons.check_circle_rounded)
                  : Pill.locked(achievement.statusLabel),
            ],
          ),
          const SizedBox(height: 12),
          if (done)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.verified_outlined, size: 15, color: AppColors.navy),
                  const SizedBox(width: 6),
                  Text(
                    'Lihat sertifikat',
                    style: AppTextStyles.badge.copyWith(fontSize: 12, color: AppColors.navy),
                  ),
                ],
              ),
            )
          else
            AppProgressBar(percent: achievement.progressPercent, color: AppColors.locked),
        ],
      ),
    );
  }
}