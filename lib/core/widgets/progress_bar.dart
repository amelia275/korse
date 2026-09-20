import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppProgressBar extends StatelessWidget {
  final int percent; // 0-100
  final double height;
  final Color color;
  final Color trackColor;

  const AppProgressBar({
    super.key,
    required this.percent,
    this.height = 6,
    this.color = AppColors.blue,
    this.trackColor = AppColors.lockedBg,
  });

  @override
  Widget build(BuildContext context) {
    final clamped = percent.clamp(0, 100);
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: Stack(
        children: [
          Container(height: height, color: trackColor),
          FractionallySizedBox(
            widthFactor: clamped / 100,
            child: Container(height: height, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(height)
              ),
            ),
          ),
        ],
      ),
    );
  }
}