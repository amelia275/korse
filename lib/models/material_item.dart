import 'package:flutter/foundation.dart';
import 'progress_status.dart';

enum CalloutType { definisi, contoh, tips }

@immutable
class ContentBlock {
  final ContentBlockType type;
  final String text;
  final String assetPath; // dipakai kalau type == illustration
  final CalloutType? calloutType; // dipakai kalau type == callout

  const ContentBlock.paragraph(this.text)
      : type = ContentBlockType.paragraph,
        assetPath = '',
        calloutType = null;

  /// [text] menjadi caption gambar, mis. "Gambar 2.1: Kurva Lonceng Gauss".
  const ContentBlock.illustration(this.assetPath, this.text)
      : type = ContentBlockType.illustration,
        calloutType = null;

  const ContentBlock.callout(this.calloutType, this.text)
      : type = ContentBlockType.callout,
        assetPath = '';
}

enum ContentBlockType { paragraph, illustration, callout }

@immutable
class MaterialItem {
  final String id;
  final String title;
  final String readingTime; // "3 menit baca"
  final String kindLabel; // "Konsep Dasar", "Probabilitas Diskrit", "Kuis Formatif"
  final String extraBadge; // "5 Soal"
  final String breadcrumbLabel; // "MODUL 2 · STATISTIKA DASAR"
  final String coreConceptNote; // teks baris "Konsep Dipahami?"
  final ProgressStatus status;
  final List<ContentBlock> content;

  const MaterialItem({
    required this.id,
    required this.title,
    required this.status,
    this.readingTime = '',
    this.kindLabel = '',
    this.extraBadge = '',
    this.breadcrumbLabel = '',
    this.coreConceptNote = '',
    this.content = const [],
  });
}