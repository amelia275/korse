import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Bottom navigation Korse.
/// PENTING: widget ini HANYA dipakai di 4 screen top-level —
/// Home, Forum Landing, Achievement, Profile. Jangan dipasang di screen
/// nested (Course, Chapter, Materi, Thread List/Detail, Search).
///
/// Karena aplikasi ini StatelessWidget murni, index aktif dikirim lewat
/// constructor (currentIndex), dan tap menavigasi via Navigator.pushReplacement
/// ke screen top-level lain — bukan mengubah state di dalam widget ini.
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    (icon: Icons.home_rounded, label: 'Home'),
    (icon: Icons.forum_rounded, label: 'Forum'),
    (icon: Icons.emoji_events_rounded, label: 'Achievement'),
    (icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (i) {
              final item = _items[i];
              final active = i == currentIndex;
              final color = active ? AppColors.navy : AppColors.textMuted;
              return Expanded(
                child: InkWell(
                  onTap: () => onTap(i),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, size: 22, color: color),
                      const SizedBox(height: 2),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
