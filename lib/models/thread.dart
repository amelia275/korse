import 'package:flutter/foundation.dart';

@immutable
class Reply {
  final String authorName;
  final String authorInitials;
  final String timeAgo;
  final String body;
  final int likeCount;

  const Reply({
    required this.authorName,
    required this.authorInitials,
    required this.timeAgo,
    required this.body,
    this.likeCount = 0,
  });
}

@immutable
class Thread {
  final String id;
  final String courseId;
  final String authorName;
  final String authorInitials;
  final String timeAgo;
  final String title;
  final String preview;
  final int likeCount;
  final List<Reply> replies;
  final bool isSolved;

  const Thread({
    required this.id,
    required this.courseId,
    required this.authorName,
    required this.authorInitials,
    required this.timeAgo,
    required this.title,
    this.preview = '',
    this.likeCount = 0,
    this.replies = const [],
    this.isSolved = false,
  });

  int get replyCount => replies.length;
}
