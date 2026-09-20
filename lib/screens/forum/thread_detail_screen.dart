import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/avatar.dart';
import '../../core/widgets/pills.dart';
import '../../models/course.dart';
import '../../models/thread.dart';

class ThreadDetailScreen extends StatelessWidget {
  final Course course;
  final Thread thread;

  const ThreadDetailScreen({super.key, required this.course, required this.thread});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Diskusi Topik'),
            Text(
              '${course.title} · ${thread.moduleLabel}',
              style: AppTextStyles.caption,
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.bookmark_border_rounded), onPressed: () {}),
          IconButton(icon: const Icon(Icons.ios_share_rounded), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                children: [
                  _OriginalPost(thread: thread),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text('${thread.replyCount} Balasan', style: AppTextStyles.h2),
                      const SizedBox(width: 7),
                      Container(
                        width: 6, height: 6,
                        decoration: const BoxDecoration(color: AppColors.blue, shape: BoxShape.circle),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceMuted,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Terpopuler', style: AppTextStyles.badge.copyWith(color: AppColors.textSecondary)),
                            const SizedBox(width: 3),
                            const Icon(Icons.keyboard_arrow_down_rounded, size: 15, color: AppColors.textSecondary),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  ...thread.replies.map((reply) => _ReplyTile(reply: reply)),
                ],
              ),
            ),
            const _ReplyComposer(),
          ],
        ),
      ),
    );
  }
}

class _OriginalPost extends StatelessWidget {
  final Thread thread;

  const _OriginalPost({required this.thread});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppAvatar(asset: thread.authorAvatar, initials: thread.authorInitials, size: 38),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(thread.authorName, style: AppTextStyles.h3, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(width: 7),
                      const Pill(label: 'Mahasiswa'),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(thread.timeAgo, style: AppTextStyles.caption),
                ],
              ),
            ),
            if (thread.moduleLabel.isNotEmpty)
              Pill.mint(thread.moduleLabel, icon: Icons.menu_book_rounded),
          ],
        ),
        const SizedBox(height: 14),
        Text(thread.title, style: AppTextStyles.h1),
        if (thread.preview.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(thread.preview, style: AppTextStyles.body),
        ],
        const SizedBox(height: 14),
        Row(
          children: [
            _ActionChip(icon: Icons.favorite_border_rounded, label: '${thread.likeCount} suka'),
            const SizedBox(width: 8),
            _ActionChip(icon: Icons.chat_bubble_outline_rounded, label: '${thread.replyCount} balasan'),
            const Spacer(),
            const Icon(Icons.outlined_flag_rounded, size: 17, color: AppColors.textMuted),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: MetaItem(icon: icon, label: label),
    );
  }
}

class _ReplyTile extends StatelessWidget {
  final Reply reply;

  const _ReplyTile({required this.reply});

  @override
  Widget build(BuildContext context) {
    final isDosen = reply.role == AuthorRole.mentor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppAvatar(asset: reply.authorAvatar, initials: reply.authorInitials, size: 32),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(reply.authorName, style: AppTextStyles.h3.copyWith(fontSize: 13.5)),
                    if (isDosen) const Pill.mint('Dosen', icon: Icons.school_rounded),
                    if (reply.isBestAnswer) const Pill.success('Jawaban Terbaik'),
                  ],
                ),
                const SizedBox(height: 2),
                Text(reply.timeAgo, style: AppTextStyles.caption),
                const SizedBox(height: 7),
                Text(reply.body, style: AppTextStyles.body.copyWith(fontSize: 13.5)),
                if (reply.attachmentName.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  AttachmentChip(name: reply.attachmentName),
                ],
                const SizedBox(height: 10),
                Row(
                  children: [
                    MetaItem(icon: Icons.thumb_up_alt_outlined, label: '${reply.likeCount} suka'),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.reply_rounded, size: 14, color: AppColors.blue),
                        const SizedBox(width: 4),
                        Text('Balas', style: AppTextStyles.badge.copyWith(color: AppColors.blue)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReplyComposer extends StatelessWidget {
  const _ReplyComposer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          const Icon(Icons.attach_file_rounded, size: 19, color: AppColors.textMuted),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              decoration: BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.border),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text('Tulis balasan...', style: AppTextStyles.bodySecondary),
                  ),
                  Icon(Icons.sentiment_satisfied_alt_rounded, size: 17, color: AppColors.textMuted),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(color: AppColors.navy, shape: BoxShape.circle),
            child: const Icon(Icons.send_rounded, size: 17, color: AppColors.onPrimary),
          ),
        ],
      ),
    );
  }
}