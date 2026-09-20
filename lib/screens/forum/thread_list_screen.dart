import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/thread_card.dart';
import '../../data/dummy_data.dart';
import '../../models/course.dart';
import 'thread_detail_screen.dart';

/// List Thread
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('${threads.length} diskusi', style: AppTextStyles.bodySecondary),
            const SizedBox(height: 12),
            if (threads.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
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
                    MaterialPageRoute(builder: (_) => ThreadDetailScreen(thread: thread)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
