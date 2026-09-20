import 'package:flutter/material.dart';
import '../../models/chapter.dart';
import '../../models/material_item.dart';
import '../../models/progress_status.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'pills.dart';
import 'status_indicator.dart';

class MaterialTile extends StatelessWidget {
  final MaterialItem material;
  final VoidCallback? onTap;

  const MaterialTile({super.key, required this.material, this.onTap});

  bool get _locked => material.status == ProgressStatus.locked;
  bool get _active => material.status == ProgressStatus.inProgress;

  @override
  Widget build(BuildContext context) {
    final subtitle = material.kindLabel.isEmpty
        ? material.readingTime
        : '${material.readingTime} · ${material.kindLabel}';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: _active ? AppColors.mint.withValues(alpha: 0.35) : AppColors.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _active ? AppColors.mint : AppColors.border,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Aksen kiri untuk materi yang sedang dipelajari.
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: _active ? AppColors.navy : Colors.transparent,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(14),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: _locked ? null : onTap,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      StatusIndicator(status: material.status),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    material.title,
                                    style: AppTextStyles.h3.copyWith(
                                      color: _locked
                                          ? AppColors.textMuted
                                          : AppColors.textPrimary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                if (material.status ==
                                    ProgressStatus.completed)
                                  const Pill.success('Selesai'),
                                if (_active) const StatusBadge(
                                  status: ProgressStatus.inProgress,
                                ),
                                if (_locked && material.extraBadge.isNotEmpty)
                                  Pill.locked(material.extraBadge),
                              ],
                            ),
                            if (subtitle.isNotEmpty) ...[
                              const SizedBox(height: 3),
                              Text(
                                subtitle,
                                style: AppTextStyles.caption,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (_active)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.navy,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Buka',
                                style: AppTextStyles.badge.copyWith(
                                  color: AppColors.onPrimary,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 12,
                                color: AppColors.onPrimary,
                              ),
                            ],
                          ),
                        )
                      else if (_locked)
                        const Icon(
                          Icons.lock_rounded,
                          size: 16,
                          color: AppColors.locked,
                        )
                      else
                        const Icon(
                          Icons.chevron_right_rounded,
                          size: 20,
                          color: AppColors.textMuted,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Daftar Bab
class ChapterTile extends StatelessWidget {
  final Chapter chapter;
  final VoidCallback? onTap;

  const ChapterTile({super.key, required this.chapter, this.onTap});

  bool get _locked => chapter.status == ProgressStatus.locked;
  bool get _active => chapter.status == ProgressStatus.inProgress;

  @override
  Widget build(BuildContext context) {
    final subtitle = _locked
        ? '${chapter.totalMaterialCount} materi · Terkunci'
        : _active
            ? '${chapter.completedMaterialCount} dari '
                '${chapter.totalMaterialCount} materi selesai'
            : '${chapter.completedMaterialCount} materi · Selesai';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: _active ? AppColors.mint.withValues(alpha: 0.35) : AppColors.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _active ? AppColors.mint : AppColors.border),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: _active ? AppColors.navy : Colors.transparent,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(14),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: _locked ? null : onTap,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      StatusIndicator(status: chapter.status),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    chapter.title,
                                    style: AppTextStyles.h3.copyWith(
                                      color: _locked
                                          ? AppColors.textMuted
                                          : AppColors.textPrimary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (_active) ...[
                                  const SizedBox(width: 6),
                                  const Pill.mint('Sedang Belajar'),
                                ],
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(subtitle, style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (_active)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.navy,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Buka',
                                style: AppTextStyles.badge.copyWith(
                                  color: AppColors.onPrimary,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.chevron_right_rounded,
                                size: 13,
                                color: AppColors.onPrimary,
                              ),
                            ],
                          ),
                        )
                      else if (_locked)
                        const Icon(
                          Icons.lock_rounded,
                          size: 16,
                          color: AppColors.locked,
                        )
                      else
                        const Icon(
                          Icons.check_circle_outline_rounded,
                          size: 18,
                          color: AppColors.success,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}