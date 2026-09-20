import 'package:flutter/foundation.dart';
import 'progress_status.dart';
import 'material_item.dart';

@immutable
class Chapter {
  final String id;
  final String title;
  final String moduleLabel; // "MODUL 2 · DASAR STATISTIKA"
  final String levelLabel; // "Tingkat Pemula · Teori & Studi Kasus"
  final String headline; // "Kurva, Pola, dan Dispersi"
  final String description;
  final String thumbnailAsset;
  final ProgressStatus status;
  final int completedMaterialCount;
  final int progressPercent;
  final String estimateLabel; // "Estimasi total 18 menit bacaan interaktif"
  final String remainingLabel; // "Tersisa 15m"
  final String funFact; // isi kartu "Tahukah Anda?"
  final String unlockNote;
  final List<MaterialItem> materials;

  const Chapter({
    required this.id,
    required this.title,
    required this.status,
    required this.materials,
    this.moduleLabel = '',
    this.levelLabel = '',
    this.headline = '',
    this.description = '',
    this.thumbnailAsset = '',
    this.completedMaterialCount = 0,
    this.progressPercent = 0,
    this.estimateLabel = '',
    this.remainingLabel = '',
    this.funFact = '',
    this.unlockNote = '',
  });

  int get totalMaterialCount => materials.length;
}