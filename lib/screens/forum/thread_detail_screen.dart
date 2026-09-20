import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/thread_card.dart';
import '../../models/thread.dart';

/// Detail Thread
class ThreadDetailScreen extends StatelessWidget {
  final Thread thread;

  const ThreadDetailScreen({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Diskusi')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: AppColors.surfaceMuted,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InitialsAvatar(initials: thread.authorInitials, size: 30),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(thread.authorName, style: AppTextStyles.h3),
                                Text(thread.timeAgo, style: AppTextStyles.caption),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(thread.title, style: AppTextStyles.h2),
                        if (thread.preview.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(thread.preview, style: AppTextStyles.body),
                        ],
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.favorite_border_rounded, size: 15, color: AppColors.textMuted),
                            const SizedBox(width: 4),
                            Text('${thread.likeCount}', style: AppTextStyles.caption),
                            const SizedBox(width: 16),
                            const Icon(Icons.chat_bubble_outline_rounded, size: 15, color: AppColors.textMuted),
                            const SizedBox(width: 4),
                            Text('${thread.replyCount} balasan', style: AppTextStyles.caption),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${thread.replyCount} Balasan', style: AppTextStyles.h3),
                        const SizedBox(height: 12),
                        ...thread.replies.map(
                          (reply) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InitialsAvatar(
                                  initials: reply.authorInitials,
                                  size: 26,
                                  bg: AppColors.skyBlue,
                                  fg: AppColors.navy,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(reply.authorName, style: AppTextStyles.h3.copyWith(fontSize: 13)),
                                          const SizedBox(width: 6),
                                          Text(reply.timeAgo, style: AppTextStyles.caption),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(reply.body, style: AppTextStyles.body.copyWith(fontSize: 13)),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.favorite_border_rounded, size: 13, color: AppColors.textMuted),
                                          const SizedBox(width: 4),
                                          Text('${reply.likeCount}', style: AppTextStyles.caption),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Input balasan
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.background,
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceMuted,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text('Tulis balasan...', style: AppTextStyles.bodySecondary),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(color: AppColors.navy, shape: BoxShape.circle),
                    child: const Icon(Icons.send_rounded, size: 17, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
