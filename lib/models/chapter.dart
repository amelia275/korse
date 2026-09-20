import 'package:flutter/foundation.dart';
import 'progress_status.dart';
import 'material_item.dart';

@immutable
class Chapter {
  final String id;
  final String title;
  final String levelLabel;
  final String description;
  final ProgressStatus status;
  final int completedMaterialCount;
  final List<MaterialItem> materials;

  const Chapter({
    required this.id,
    required this.title,
    required this.status,
    required this.materials,
    this.levelLabel = '',
    this.description = '',
    this.completedMaterialCount = 0,
  });

  int get totalMaterialCount => materials.length;
}
