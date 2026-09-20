import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppProgressBar extends StatelessWidget {
  final int percent; // 0-100
  final double height;

  const AppProgressBar({super.key, required this.percent, this.height = 6});

  @override
  Widget build(BuildContext context) {
    final clamped = percent.clamp(0, 100);
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(height: height, color: AppColors.border),
              FractionallySizedBox(
                widthFactor: clamped / 100,
                child: Container(height: height, color: AppColors.blue),
              ),
            ],
          );
        },
      ),
    );
  }
}
