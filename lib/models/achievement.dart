import 'package:flutter/foundation.dart';

@immutable
class Achievement {
  final String courseTitle;
  final bool isCompleted;
  final String subtitle;

  const Achievement({
    required this.courseTitle,
    required this.isCompleted,
    required this.subtitle,
  });
}
