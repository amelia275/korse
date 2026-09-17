import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/material_tile.dart';
import '../../models/chapter.dart';
import '../../models/course.dart';
import '../../models/material_item.dart' as models;
import '../../models/progress_status.dart';
import '../material/material_detail_screen.dart';

/// Chapter (Bab) detail — di mockup disebut "Detail Lesson".
/// Menampilkan info Bab + "Struktur Materi" (daftar MaterialItem).
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (chapter.levelLabel.isNotEmpty) ...[
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surfaceMuted,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chapter.levelLabel, style: AppTextStyles.caption),
                    const SizedBox(height: 4),
                    Text(chapter.title, style: AppTextStyles.h2),
                    if (chapter.description.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(chapter.description, style: AppTextStyles.bodySecondary),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
            const Text('Struktur Materi', style: AppTextStyles.h2),
            const SizedBox(height: 12),
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
            if (active != null) ...[
              const SizedBox(height: 8),
              PrimaryButton(
                label: 'Lanjut Baca: ${active.title}',
                icon: Icons.menu_book_rounded,
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
          ],
        ),
      ),
    );
  }
}
