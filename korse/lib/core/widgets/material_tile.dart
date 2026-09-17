import 'package:flutter/material.dart';
import '../../models/chapter.dart';
import '../../models/material_item.dart';
import '../../models/progress_status.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'status_indicator.dart';

/// Item card untuk satu Materi di dalam Struktur Materi (Chapter detail).
class MaterialTile extends StatelessWidget {
  final MaterialItem material;
  final VoidCallback? onTap;

  const MaterialTile({super.key, required this.material, this.onTap});

  bool get _locked => material.status == ProgressStatus.locked;
  bool get _active => material.status == ProgressStatus.inProgress;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _locked ? 0.55 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _locked ? null : onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _active ? AppColors.blue : AppColors.border,
              width: _active ? 1.4 : 1,
            ),
          ),
          child: Row(
            children: [
              StatusIndicator(status: material.status),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      material.title,
                      style: AppTextStyles.h3.copyWith(
                        color: _locked ? AppColors.textMuted : AppColors.textPrimary,
                      ),
                    ),
                    if (material.readingTime.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(material.readingTime, style: AppTextStyles.caption),
                    ],
                  ],
                ),
              ),
              if (_active)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: AppColors.navy, borderRadius: BorderRadius.circular(8)),
                  child: const Text('Buka', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Item card untuk satu Bab/Chapter di dalam Course detail.
class ChapterTile extends StatelessWidget {
  final Chapter chapter;
  final VoidCallback? onTap;

  const ChapterTile({super.key, required this.chapter, this.onTap});

  bool get _locked => chapter.status == ProgressStatus.locked;
  bool get _active => chapter.status == ProgressStatus.inProgress;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _locked ? 0.55 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _locked ? null : onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _active ? AppColors.blue : AppColors.border,
              width: _active ? 1.4 : 1,
            ),
          ),
          child: Row(
            children: [
              StatusIndicator(status: chapter.status),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapter.title,
                      style: AppTextStyles.h3.copyWith(
                        color: _locked ? AppColors.textMuted : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _locked
                          ? '${chapter.totalMaterialCount} materi'
                          : '${chapter.completedMaterialCount} dari ${chapter.totalMaterialCount} materi selesai',
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ),
              if (!_locked) const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
