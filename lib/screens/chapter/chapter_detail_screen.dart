import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/callout_box.dart';
import '../../core/widgets/material_tile.dart';
import '../../core/widgets/pills.dart';
import '../../core/widgets/progress_bar.dart';
import '../../models/chapter.dart';
import '../../models/course.dart';
import '../../models/material_item.dart' as models;
import '../../models/progress_status.dart';
import '../material/material_detail_screen.dart';

class ChapterDetailScreen extends StatelessWidget {
  final Course course;
  final Chapter chapter;

  const ChapterDetailScreen({super.key, required this.course, required this.chapter});

  models.MaterialItem? get _activeMaterial {
    for (final m in chapter.materials) {
      if (m.status == ProgressStatus.inProgress) return m;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final active = _activeMaterial;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(chapter.title)),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
          children: [
            _ChapterHeroCard(chapter: chapter),
            const SizedBox(height: 14),
            _ProgressCard(chapter: chapter),
            const SizedBox(height: 24),
            SectionHeader(
              title: 'Struktur Materi',
              trailing: '${chapter.totalMaterialCount} Topik Bahasan',
            ),
            if (chapter.materials.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: Text('Materi bab ini masih terkunci.', style: AppTextStyles.bodySecondary),
                ),
              )
            else
              ...chapter.materials.map(
                (material) => MaterialTile(
                  material: material,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MaterialDetailScreen(
                        course: course,
                        chapter: chapter,
                        material: material,
                      ),
                    ),
                  ),
                ),
              ),
            if (chapter.funFact.isNotEmpty) ...[
              const SizedBox(height: 8),
              InfoNoteCard(title: 'Tahukah Anda?', body: chapter.funFact),
            ],
            if (active != null) ...[
              const SizedBox(height: 18),
              PrimaryButton(
                label: 'Lanjut Baca: ${active.title}',
                icon: Icons.arrow_forward_rounded,
                trailingIcon: true,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MaterialDetailScreen(
                      course: course,
                      chapter: chapter,
                      material: active,
                    ),
                  ),
                ),
              ),
            ],
            if (chapter.unlockNote.isNotEmpty) ...[
              const SizedBox(height: 12),
              Center(
                child: Text(chapter.unlockNote, style: AppTextStyles.caption, textAlign: TextAlign.center),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ChapterHeroCard extends StatelessWidget {
  final Chapter chapter;

  const _ChapterHeroCard({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (chapter.levelLabel.isNotEmpty)
                  Pill.mint(chapter.levelLabel, icon: Icons.school_rounded),
                const SizedBox(height: 10),
                Text(chapter.headline.isEmpty ? chapter.title : chapter.headline, style: AppTextStyles.h2),
                if (chapter.description.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(chapter.description, style: AppTextStyles.bodySecondary),
                ],
              ],
            ),
          ),
          if (chapter.thumbnailAsset.isNotEmpty) ...[
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(chapter.thumbnailAsset, width: 82, height: 82, fit: BoxFit.cover),
            ),
          ],
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final Chapter chapter;

  const _ProgressCard({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.surfaceMuted,
      padding: const EdgeInsets.all(13),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.trending_up_rounded, size: 14, color: AppColors.navy),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Kemajuan Bab: ${chapter.completedMaterialCount} dari ${chapter.totalMaterialCount} Selesai',
                  style: AppTextStyles.badge.copyWith(fontSize: 12, color: AppColors.textPrimary),
                ),
              ),
              Text(
                '${chapter.progressPercent}%',
                style: AppTextStyles.badge.copyWith(fontSize: 12, color: AppColors.navy),
              ),
            ],
          ),
          const SizedBox(height: 10),
          AppProgressBar(percent: chapter.progressPercent),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.schedule_rounded, size: 13, color: AppColors.textMuted),
              const SizedBox(width: 5),
              Expanded(
                child: Text(chapter.estimateLabel, style: AppTextStyles.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
              Text(chapter.remainingLabel, style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }
}