import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/pills.dart';
import '../../data/dummy_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Cari Course')),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            const SearchBox(hint: 'Cari course...', trailingIcon: Icons.tune_rounded),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Pencarian Populer'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: DummyData.popularSearches
                  .map((label) => Pill(
                        label: label,
                        bg: AppColors.background,
                        fg: AppColors.textSecondary,
                        borderColor: AppColors.border,
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 26),
            const SectionHeader(title: 'Riwayat Pencarian'),
            ...DummyData.recentSearches.map(
              (label) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    const Icon(Icons.history_rounded, size: 17, color: AppColors.textMuted),
                    const SizedBox(width: 10),
                    Expanded(child: Text(label, style: AppTextStyles.bodySecondary)),
                    const Icon(Icons.north_west_rounded, size: 15, color: AppColors.textMuted),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}