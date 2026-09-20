import 'package:flutter/material.dart';
import 'chapter.dart';

@immutable
class Course {
  final String id;
  final String title;
  final String certificationLabel; // mis. "Sertifikasi Analisis Data"
  final String category;
  final IconData icon;
  final Color tintColor;
  final Color iconColor;
  final String coverAsset;
  final String description;

  final String structureLabel; // "8 Bab · 45 artikel teks"
  final String levelLabel; // "Pemula" / "Menengah"
  final String ratingLabel; // "4.8"
  final String modulePositionLabel; // "Modul 2 dari 6"
  final String readingTimeLabel; // "45 Menit Bacaan"
  final String continueModuleLabel; // "Modul 4 · 12 mnt"

  // Silabus modul aktif
  final String syllabusTitle;
  final String syllabusDescription;
  final String chapterCountLabel; // "3 Bab Pembelajaran"
  final int moduleProgressPercent;
  final String activeMaterialTitle;
  final String activeMaterialEstimate;
  final String nextModuleNote;

  final int progressPercent;
  final int activeDiscussionCount;
  final bool hasNewDiscussion;
  final List<String> participantAvatars;
  final List<Chapter> chapters;

  const Course({
    required this.id,
    required this.title,
    required this.category,
    required this.icon,
    required this.tintColor,
    required this.iconColor,
    required this.coverAsset,
    required this.description,
    required this.chapters,
    this.certificationLabel = '',
    this.structureLabel = '',
    this.levelLabel = 'Pemula',
    this.ratingLabel = '4.8',
    this.modulePositionLabel = '',
    this.readingTimeLabel = '',
    this.continueModuleLabel = '',
    this.syllabusTitle = '',
    this.syllabusDescription = '',
    this.chapterCountLabel = '',
    this.moduleProgressPercent = 0,
    this.activeMaterialTitle = '',
    this.activeMaterialEstimate = '',
    this.nextModuleNote = '',
    this.progressPercent = 0,
    this.activeDiscussionCount = 0,
    this.hasNewDiscussion = false,
    this.participantAvatars = const [],
  });

  bool get isStarted => progressPercent > 0;
  bool get isCompleted => progressPercent >= 100;
}