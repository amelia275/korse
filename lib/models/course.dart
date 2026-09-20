import 'package:flutter/material.dart';
import 'chapter.dart';

@immutable
class Course {
  final String id;
  final String title;
  final String category;
  final IconData icon;
  final Color tintColor;
  final Color iconColor;
  final String description;
  final int progressPercent;
  final int activeDiscussionCount;
  final List<Chapter> chapters;

  const Course({
    required this.id,
    required this.title,
    required this.category,
    required this.icon,
    required this.tintColor,
    required this.iconColor,
    required this.description,
    required this.chapters,
    this.progressPercent = 0,
    this.activeDiscussionCount = 0,
  });

  bool get isStarted => progressPercent > 0;
  bool get isCompleted => progressPercent >= 100;
}
