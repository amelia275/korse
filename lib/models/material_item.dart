import 'package:flutter/foundation.dart';
import 'progress_status.dart';

enum CalloutType { definisi, contoh, tips }

@immutable
class ContentBlock {
  final ContentBlockType type;
  final String text;
  final CalloutType? calloutType; // dipakai kalau type == callout

  const ContentBlock.paragraph(this.text)
      : type = ContentBlockType.paragraph,
        calloutType = null;

  const ContentBlock.illustration(this.text)
      : type = ContentBlockType.illustration,
        calloutType = null;

  const ContentBlock.callout(this.calloutType, this.text)
      : type = ContentBlockType.callout;
}

enum ContentBlockType { paragraph, illustration, callout }

@immutable
class MaterialItem {
  final String id;
  final String title;
  final String readingTime;
  final ProgressStatus status;
  final List<ContentBlock> content;

  const MaterialItem({
    required this.id,
    required this.title,
    required this.status,
    this.readingTime = '',
    this.content = const [],
  });
}
