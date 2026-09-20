import 'package:flutter/foundation.dart';

enum AuthorRole { mentee, mentor }

@immutable
class Reply {
  final String authorName;
  final String authorInitials;
  final String authorAvatar;
  final AuthorRole role;
  final bool isBestAnswer;
  final String timeAgo;
  final String body;
  final int likeCount;
  final String attachmentName;

  const Reply({
    required this.authorName,
    required this.authorInitials,
    required this.timeAgo,
    required this.body,
    this.authorAvatar = '',
    this.role = AuthorRole.mentee,
    this.isBestAnswer = false,
    this.likeCount = 0,
    this.attachmentName = '',
  });
}

@immutable
class Thread {
  final String id;
  final String courseId;
  final String authorName;
  final String authorInitials;
  final String authorAvatar;
  final AuthorRole authorRole;
  final String timeAgo;
  final String moduleLabel; // "Modul 2", "Latihan Soal", "Catatan Belajar"
  final String categoryLabel; // "Tanya Jawab" / "Catatan & Tips"
  final String statusLabel; // "Terjawab" / "Populer" / "Dosen menjawab"
  final String title;
  final String preview;
  final int likeCount;
  final String attachmentName;
  final String attachmentSize;
  final int downloadCount;
  final String footerNote; // "Balasan terakhir 10m lalu" / "Solusi disetujui"
  final List<String> participantAvatars;
  final List<Reply> replies;
  final bool isSolved;

  const Thread({
    required this.id,
    required this.courseId,
    required this.authorName,
    required this.authorInitials,
    required this.timeAgo,
    required this.title,
    this.authorAvatar = '',
    this.authorRole = AuthorRole.mentee,
    this.moduleLabel = '',
    this.categoryLabel = '',
    this.statusLabel = '',
    this.preview = '',
    this.likeCount = 0,
    this.attachmentName = '',
    this.attachmentSize = '',
    this.downloadCount = 0,
    this.footerNote = '',
    this.participantAvatars = const [],
    this.replies = const [],
    this.isSolved = false,
  });

  int get replyCount => replies.length;
}