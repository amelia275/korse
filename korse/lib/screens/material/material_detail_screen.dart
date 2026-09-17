import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/callout_box.dart';
import '../../core/widgets/progress_bar.dart';
import '../../models/chapter.dart';
import '../../models/course.dart';
import '../../models/material_item.dart';

/// Detail Materi — di mockup disebut "Lesson Content".
/// Ini screen inti belajar: progress "X dari Y" + ilustrasi + teks
/// diselingi callout berwarna + tombol Sebelumnya/Lanjut.
/// Posisi materi (index, total) dihitung dari data hardcoded chapter.materials,
/// bukan dari state runtime.
class MaterialDetailScreen extends StatelessWidget {
  final Course course;
  final Chapter chapter;
  final MaterialItem material;

  const MaterialDetailScreen({
    super.key,
    required this.course,
    required this.chapter,
    required this.material,
  });

  @override
  Widget build(BuildContext context) {
    final index = chapter.materials.indexWhere((m) => m.id == material.id);
    final total = chapter.materials.length;
    final currentPos = index >= 0 ? index + 1 : 1;
    final percent = total > 0 ? ((currentPos / total) * 100).round() : 0;

    final hasPrev = index > 0;
    final hasNext = index >= 0 && index < total - 1;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
                  ),
                  Expanded(child: AppProgressBar(percent: percent)),
                  const SizedBox(width: 10),
                  Text('$currentPos/$total', style: AppTextStyles.caption),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                children: [
                  Text(material.title, style: AppTextStyles.h1),
                  const SizedBox(height: 16),
                  ..._buildContentBlocks(material.content),
                  if (material.content.isEmpty)
                    Text(
                      'Konten materi ini belum tersedia.',
                      style: AppTextStyles.bodySecondary,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: [
                  if (hasPrev)
                    Expanded(
                      child: SecondaryButton(
                        label: 'Sebelumnya',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MaterialDetailScreen(
                                course: course,
                                chapter: chapter,
                                material: chapter.materials[index - 1],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  if (hasPrev && hasNext) const SizedBox(width: 10),
                  if (hasNext)
                    Expanded(
                      child: PrimaryButton(
                        label: 'Lanjut',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MaterialDetailScreen(
                                course: course,
                                chapter: chapter,
                                material: chapter.materials[index + 1],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContentBlocks(List<ContentBlock> blocks) {
    return blocks.map((block) {
      switch (block.type) {
        case ContentBlockType.illustration:
          return Container(
            width: double.infinity,
            height: 110,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColors.mint,
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.insights_rounded, size: 40, color: AppColors.navy),
          );
        case ContentBlockType.paragraph:
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(block.text, style: AppTextStyles.body),
          );
        case ContentBlockType.callout:
          return CalloutBox(type: block.calloutType!, text: block.text);
      }
    }).toList();
  }
}
