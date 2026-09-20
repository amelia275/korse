import 'package:flutter/material.dart';
import '../../models/thread.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'avatar.dart';
import 'pills.dart';

class ThreadStatusPill extends StatelessWidget {
  final String label;

  const ThreadStatusPill({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    late final Color bg;
    late final Color fg;
    late final IconData icon;

    switch (label) {
      case 'Populer':
        bg = AppColors.calloutTipsBg;
        fg = AppColors.calloutTipsFg;
        icon = Icons.local_fire_department_rounded;
        break;
      case 'Dosen menjawab':
        bg = AppColors.mint;
        fg = AppColors.navy;
        icon = Icons.school_rounded;
        break;
      default:
        bg = AppColors.successBg;
        fg = AppColors.success;
        icon = Icons.check_circle_rounded;
    }

    return Pill(label: label, bg: bg, fg: fg, icon: icon);
  }
}

class ThreadCard extends StatelessWidget {
  final Thread thread;
  final VoidCallback onTap;

  const ThreadCard({super.key, required this.thread, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppAvatar(
                asset: thread.authorAvatar,
                initials: thread.authorInitials,
                size: 34,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thread.authorName,
                      style: AppTextStyles.h3.copyWith(fontSize: 13.5),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      thread.moduleLabel.isEmpty
                          ? thread.timeAgo
                          : '${thread.timeAgo} · ${thread.moduleLabel}',
                      style: AppTextStyles.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (thread.statusLabel.isNotEmpty)
                ThreadStatusPill(label: thread.statusLabel),
            ],
          ),
          const SizedBox(height: 12),
          Text(thread.title, style: AppTextStyles.h2, maxLines: 2,
              overflow: TextOverflow.ellipsis),
          if (thread.preview.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              thread.preview,
              style: AppTextStyles.bodySecondary,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (thread.attachmentName.isNotEmpty) ...[
            const SizedBox(height: 10),
            AttachmentChip(
              name: thread.attachmentName,
              size: thread.attachmentSize,
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              MetaItem(
                icon: Icons.chat_bubble_outline_rounded,
                label: '${thread.replyCount} balasan',
              ),
              const SizedBox(width: 16),
              MetaItem(
                icon: thread.likeCount > 30
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                label: '${thread.likeCount} suka',
                color: thread.likeCount > 30
                    ? AppColors.blue
                    : AppColors.textMuted,
              ),
              const Spacer(),
              if (thread.downloadCount > 0)
                MetaItem(
                  icon: Icons.download_rounded,
                  label: '${thread.downloadCount} unduhan',
                )
              else if (thread.participantAvatars.isNotEmpty)
                AvatarStack(
                  assets: thread.participantAvatars,
                  size: 20,
                  extraCount: 6,
                )
              else if (thread.footerNote.isNotEmpty)
                Expanded(
                  child: Text(
                    thread.footerNote,
                    style: AppTextStyles.caption,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class HotThreadTile extends StatelessWidget {
  final Thread thread;
  final String courseTitle;
  final VoidCallback onTap;

  const HotThreadTile({
    super.key,
    required this.thread,
    required this.courseTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppAvatar(
                asset: thread.authorAvatar,
                initials: thread.authorInitials,
                size: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thread.authorName,
                      style: AppTextStyles.h3.copyWith(fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '$courseTitle · ${thread.timeAgo}',
                      style: AppTextStyles.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Pill(label: thread.moduleLabel),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            thread.title,
            style: AppTextStyles.h3.copyWith(fontSize: 15, height: 1.4),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            thread.preview,
            style: AppTextStyles.bodySecondary,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              MetaItem(
                icon: Icons.thumb_up_alt_outlined,
                label: '${thread.likeCount}',
              ),
              const SizedBox(width: 16),
              MetaItem(
                icon: Icons.mode_comment_outlined,
                label: '${thread.replyCount} tanggapan',
              ),
              const Spacer(),
              if (thread.footerNote.isNotEmpty)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.verified_rounded,
                        size: 13,
                        color: AppColors.success,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          thread.footerNote,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.success,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}