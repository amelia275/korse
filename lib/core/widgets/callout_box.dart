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
        icon = Icons.menu_book_rounded;
        break;
      case CalloutType.contoh:
        bg = AppColors.calloutContohBg;
        fg = AppColors.calloutContohFg;
        label = 'Contoh';
        icon = Icons.lightbulb_rounded;
        break;
      case CalloutType.tips:
        bg = AppColors.calloutTipsBg;
        fg = AppColors.calloutTipsFg;
        label = 'Tips';
        icon = Icons.star_rounded;
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 15, color: fg),
              const SizedBox(width: 6),
              Text(
                label.toUpperCase(),
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: fg, letterSpacing: 0.3),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(text, style: AppTextStyles.body.copyWith(color: fg, fontSize: 13)),
        ],
      ),
    );
  }
}
