import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/callout_box.dart';
import '../../core/widgets/pills.dart';
import '../../core/widgets/thread_card.dart';
import '../../data/dummy_data.dart';
import '../../models/course.dart';
import 'thread_detail_screen.dart';

class ThreadListScreen extends StatelessWidget {
  final Course course;

  const ThreadListScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final threads = DummyData.threadsForCourse(course.id);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(course.title)),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
          children: [
            SearchBox(
              hint: 'Cari dalam diskusi ${course.title}...',
              trailingIcon: Icons.mic_none_rounded,
            ),
            const SizedBox(height: 14),
            const FilterChipsRow(labels: DummyData.threadFilters),
            const SizedBox(height: 18),
            if (threads.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(
                  child: Text('Belum ada diskusi di course ini.', style: AppTextStyles.bodySecondary),
                ),
              )
            else
              ...threads.map(
                (thread) => ThreadCard(
                  thread: thread,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ThreadDetailScreen(course: course, thread: thread),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 8),
            const InfoNoteCard(
              title: 'Punya pertanyaan spesifik materi?',
              body: 'Sertakan nomor menit video atau halaman modul agar asisten dosen dapat membantu lebih cepat.',
              icon: Icons.help_outline_rounded,
            ),
            const SizedBox(height: 14),
            PillButton(label: 'Mulai Diskusi', icon: Icons.add_rounded, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}