import 'package:flutter/material.dart';
import '../../models/material_item.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CalloutBox extends StatelessWidget {
  final CalloutType type;
  final String text;

  const CalloutBox({super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    late final Color bg;
    late final Color fg;
    late final String label;
    late final IconData icon;

    switch (type) {
      case CalloutType.definisi:
        bg = AppColors.calloutDefinisiBg;
        fg = AppColors.calloutDefinisiFg;
        label = 'Definisi';
        icon = Icons.lightbulb_rounded;
        break;
      case CalloutType.contoh:
        bg = AppColors.calloutContohBg;
        fg = AppColors.calloutContohFg;
        label = 'Contoh';
        icon = Icons.article_rounded;
        break;
      case CalloutType.tips:
        bg = AppColors.calloutTipsBg;
        fg = AppColors.calloutTipsFg;
        label = 'Contoh Kasus';
        icon = Icons.wb_sunny_rounded;
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: fg),
              const SizedBox(width: 6),
              Text(
                label.toUpperCase(),
                style: AppTextStyles.overline.copyWith(color: fg),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            text,
            style: AppTextStyles.body.copyWith(color: fg, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class InfoNoteCard extends StatelessWidget {
  final String title;
  final String body;
  final IconData icon;

  const InfoNoteCard({
    super.key,
    required this.title,
    required this.body,
    this.icon = Icons.tips_and_updates_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: AppColors.mint,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 15, color: AppColors.navy),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.h3.copyWith(fontSize: 13)),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: AppTextStyles.bodySecondary.copyWith(fontSize: 12.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}