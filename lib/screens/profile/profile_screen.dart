import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/thread_card.dart';
import '../../data/dummy_data.dart';
import '../achievement/achievement_screen.dart';
import '../forum/forum_landing_screen.dart';
import '../home/home_screen.dart';

/// Profile — top-level screen #4 (punya bottom nav).
/// Info dasar + statistik ringkas saja, tanpa pengaturan interaktif.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 12),
            const Center(child: InitialsAvatar(initials: 'A', size: 72)),
            const SizedBox(height: 12),
            const Center(child: Text(DummyData.userName, style: AppTextStyles.h1)),
            const SizedBox(height: 2),
            const Center(child: Text(DummyData.userEmail, style: AppTextStyles.bodySecondary)),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    value: '${DummyData.coursesCompletedCount}',
                    label: 'Course selesai',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    value: '${DummyData.materialsLearnedCount}',
                    label: 'Materi dipelajari',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _MenuRow(icon: Icons.settings_outlined, label: 'Pengaturan'),
            const Divider(),
            _MenuRow(icon: Icons.logout_rounded, label: 'Keluar'),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 3,
        onTap: (i) => _handleNavTap(context, i),
      ),
    );
  }

  void _handleNavTap(BuildContext context, int index) {
    if (index == 3) return;
    late final Widget target;
    switch (index) {
      case 0:
        target = const HomeScreen();
        break;
      case 1:
        target = const ForumLandingScreen();
        break;
      default:
        target = const AchievementScreen();
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => target));
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(value, style: AppTextStyles.statNumber),
          const SizedBox(height: 4),
          Text(label, style: AppTextStyles.caption, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 19, color: AppColors.textSecondary),
          const SizedBox(width: 12),
          Text(label, style: AppTextStyles.body),
        ],
      ),
    );
  }
}
