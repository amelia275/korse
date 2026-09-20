import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/callout_box.dart';
import '../../core/widgets/pills.dart';
import '../../core/widgets/progress_bar.dart';
import '../../models/chapter.dart';
import '../../models/course.dart';
import '../../models/material_item.dart';

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
              padding: const EdgeInsets.fromLTRB(8, 10, 16, 10),
              child: Row(
                children: [
                  InkResponse(
                    onTap: () => Navigator.pop(context),
                    radius: 22,
                    child: const SizedBox(
                      width: 38,
                      height: 38,
                      child: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: AppColors.textPrimary),
                    ),
                  ),
                  Expanded(child: AppProgressBar(percent: percent, height: 7, color: AppColors.navy)),
                  const SizedBox(width: 12),
                  Text(
                    '$currentPos/$total',
                    style: AppTextStyles.badge.copyWith(fontSize: 12, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 20),
                children: [
                  Row(
                    children: [
                      if (material.breadcrumbLabel.isNotEmpty)
                        Pill(label: material.breadcrumbLabel, bg: AppColors.mint, fg: AppColors.navy),
                      const SizedBox(width: 8),
                      if (material.readingTime.isNotEmpty)
                        Flexible(
                          child: Text(
                            '· ${material.readingTime}',
                            style: AppTextStyles.caption,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(material.title, style: AppTextStyles.display),
                  const SizedBox(height: 16),
                  ..._buildContentBlocks(material.content),
                  if (material.content.isEmpty)
                    const Text('Konten materi ini belum tersedia.', style: AppTextStyles.bodySecondary),
                  if (material.coreConceptNote.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    AppCard(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 26,
                            height: 26,
                            decoration: const BoxDecoration(color: AppColors.successBg, shape: BoxShape.circle),
                            alignment: Alignment.center,
                            child: const Icon(Icons.check_rounded, size: 15, color: AppColors.success),
                          ),
                          const SizedBox(width: 11),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Konsep Dipahami?', style: AppTextStyles.h3),
                                const SizedBox(height: 2),
                                Text(material.coreConceptNote, style: AppTextStyles.caption),
                              ],
                            ),
                          ),
                          const Pill(label: 'Materi Inti'),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: const BoxDecoration(
                color: AppColors.background,
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SecondaryButton(
                      label: 'Sebelumnya',
                      icon: Icons.chevron_left_rounded,
                      onPressed: hasPrev
                          ? () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MaterialDetailScreen(
                                    course: course,
                                    chapter: chapter,
                                    material: chapter.materials[index - 1],
                                  ),
                                ),
                              )
                          : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 6,
                    child: PrimaryButton(
                      label: 'Lanjut',
                      icon: Icons.chevron_right_rounded,
                      trailingIcon: true,
                      onPressed: hasNext
                          ? () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MaterialDetailScreen(
                                    course: course,
                                    chapter: chapter,
                                    material: chapter.materials[index + 1],
                                  ),
                                ),
                              )
                          : null,
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
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.asset(block.assetPath, width: double.infinity, fit: BoxFit.cover),
                ),
                const SizedBox(height: 9),
                Text(block.text, style: AppTextStyles.caption, textAlign: TextAlign.center),
              ],
            ),
          );
        case ContentBlockType.paragraph:
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(block.text, style: AppTextStyles.body),
          );
        case ContentBlockType.callout:
          return CalloutBox(type: block.calloutType!, text: block.text);
      }
    }).toList();
  }
}