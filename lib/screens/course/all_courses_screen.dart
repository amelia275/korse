import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/course_card.dart';
import '../../core/widgets/pills.dart';
import '../../data/dummy_data.dart';
import 'course_detail_screen.dart';

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = DummyData.courses;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Semua Course'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          children: [
            const FilterChipsRow(labels: DummyData.courseFilters),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 196,
              ),
              itemBuilder: (context, i) {
                final course = courses[i];
                return GridCourseCard(
                  course: course,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourseDetailScreen(course: course),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
