import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/avatar.dart';
import '../../core/widgets/pills.dart';
import '../../data/dummy_data.dart';
import '../achievement/achievement_screen.dart';
import '../forum/forum_landing_screen.dart';
import '../home/home_screen.dart';
import 'profile_edited.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _handleNavTap(BuildContext context, int index) {
    if (index == 3) return;

    Widget page;

    switch (index) {
      case 0:
        page = const HomeScreen();
        break;
      case 1:
        page = const ForumLandingScreen();
        break;
      case 2:
        page = const AchievementScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Profil',
          style: AppTextStyles.h2,
        ),
      ),
      body: SafeArea(
          child: ListView(padding: const EdgeInsets.all(20), children: [
        const SizedBox(height: 12),
        const Center(child: InitialsAvatar(initials: 'K', size: 72)),
        const SizedBox(height: 12),
        Center(
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileEdited()));
                },
                icon: const Icon(Icons.edit, size: 25),
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white))),
        const SizedBox(height: 24),
        const Row(
          children: [
            Expanded(
              child: _StatCard(
                value: '${DummyData.coursesCompletedCount}',
                label: 'Course selesai',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                value: '${DummyData.materialsLearnedCount}',
                label: 'Materi dipelajari',
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'USER INFORMATION',
                style: AppTextStyles.h2,
              ),
              const _MenuRow(icon: Icons.person, label: "Karina Aespa"),
              const Divider(),
              const _MenuRow(icon: Icons.email, label: "karina.aespa@gmail"),
              const Divider(),
              const _MenuRow(icon: Icons.phone, label: "08******"),
              const SizedBox(height: 24),
              Text(
                'SUPPORT & ABOUT',
                style: AppTextStyles.h2,
              ),
              const _MenuRow(
                icon: Icons.description_outlined,
                title: 'Term & Policies',
              ),

              const SizedBox(height: 24),

              // ================= ACTION =================
              const _SectionTitle(title: 'ACTION'),

              const SizedBox(height: 10),

              const _MenuRow(
                icon: Icons.flag_outlined,
                title: 'Report a problem',
              ),
              const _MenuRow(
                  icon: Icons.question_mark_outlined, label: 'Help & Support'),
              const Divider(),
              const _MenuRow(
                  icon: Icons.policy_sharp, label: 'Term & Policies'),
              const SizedBox(height: 24),
              Text(
                'ACTION',
                style: AppTextStyles.h2,
              ),
              const SizedBox(height: 2),
              const _MenuRow(
                  icon: Icons.flag_outlined, label: 'Report a problem'),
              const Divider(),
              const _MenuRow(
                  icon: Icons.settings_outlined, label: 'Pengaturan'),
              const Divider(),
              const _MenuRow(icon: Icons.logout_rounded, label: 'Keluar'),
            ],
          ),
        ),
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: AppBottomNav(
        currentIndex: 3,
        onTap: (index) => _handleNavTap(context, index),
      ),
    );
  }
}

// ================================================================
// STAT CARD
// ================================================================

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final String note;
  final IconData icon;

  const _StatCard({
    required this.value,
    required this.label,
    required this.note,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.navy,
            size: 22,
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppTextStyles.statNumber,
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: AppTextStyles.bodySecondary.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            note,
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}

// ================================================================
// STREAK CARD
// ================================================================

class _StreakCard extends StatelessWidget {
  const _StreakCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.navy.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_fire_department_outlined,
              color: AppColors.navy,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Learning Streak',
                  style: AppTextStyles.h3,
                ),
                SizedBox(height: 2),
                Text(
                  'Keep learning every day!',
                  style: AppTextStyles.bodySecondary,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${DummyData.learningStreak} days',
            style: AppTextStyles.h3,
          ),
        ],
      ),
    );
  }
}

// ================================================================
// SECTION TITLE
// ================================================================

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.bodySecondary.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
      ),
    );
  }
}

// ================================================================
// MENU ROW
// ================================================================

class _MenuRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool emphasized;

  const _MenuRow({
    required this.icon,
    required this.title,
    this.emphasized = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          Icon(
            icon,
            size: 21,
            color: emphasized ? Colors.red : AppColors.textSecondary,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.body.copyWith(
                color: emphasized ? Colors.red : null,
              ),
            ),
          ),
          if (!emphasized)
            const Icon(
              Icons.chevron_right,
              size: 20,
            ),
        ],
      ),
    );
  }
}