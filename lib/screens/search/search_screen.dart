import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/dummy_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceMuted,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.blue, width: 1.3),
                      ),
                      child: TextField(
                        // Statis — tidak ada onChanged/controller, murni visual.
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Cari course...',
                          prefixIcon: const Icon(Icons.search_rounded, size: 18, color: AppColors.textMuted),
                        ),
                        style: AppTextStyles.body,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Pencarian Populer', style: AppTextStyles.h3),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: DummyData.popularSearches
                    .map(
                      (label) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceMuted,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Text(label, style: AppTextStyles.bodySecondary),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),
              Text('Riwayat Pencarian', style: AppTextStyles.h3),
              const SizedBox(height: 8),
              ...DummyData.recentSearches.map(
                (label) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      const Icon(Icons.history_rounded, size: 17, color: AppColors.textMuted),
                      const SizedBox(width: 10),
                      Text(label, style: AppTextStyles.bodySecondary),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
