import 'package:flutter/foundation.dart';

@immutable
class Achievement {
  final String courseTitle;
  final bool isCompleted;
  final String subtitle; // "Selesai 3 Sept 2026" atau "60% selesai"

  const Achievement({
    required this.courseTitle,
    required this.isCompleted,
    required this.subtitle,
  });
}
