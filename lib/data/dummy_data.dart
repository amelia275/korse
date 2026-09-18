import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/achievement.dart';
import '../models/chapter.dart';
import '../models/course.dart';
import '../models/material_item.dart';
import '../models/progress_status.dart';
import '../models/thread.dart';

class DummyData {
  DummyData._();

  // MATERI
  static const _distribusiNormalContent = [
    ContentBlock.illustration('Ilustrasi kurva lonceng distribusi normal'),
    ContentBlock.paragraph(
      'Distribusi normal adalah pola sebaran data yang paling sering muncul di alam, '
      'membentuk kurva simetris menyerupai lonceng.',
    ),
    ContentBlock.callout(
      CalloutType.definisi,
      'Kurva berbentuk lonceng, simetris terhadap nilai rata-rata (mean).',
    ),
    ContentBlock.paragraph(
      'Contohnya bisa dilihat dari sebaran nilai ujian di satu kelas — sebagian besar '
      'siswa mendapat nilai di sekitar rata-rata, sedikit yang sangat rendah atau sangat tinggi.',
    ),
    ContentBlock.callout(
      CalloutType.contoh,
      'Nilai ujian 80 siswa: sebagian besar dapat nilai 70-80, hanya sedikit yang di bawah 50 atau di atas 95.',
    ),
    ContentBlock.paragraph(
      'Sifat ini membuat distribusi normal jadi dasar dari banyak metode statistik, '
      'termasuk uji hipotesis dan interval kepercayaan.',
    ),
    ContentBlock.callout(
      CalloutType.tips,
      'Kalau data kalian membentuk kurva lonceng saat di-plot, itu tanda kuat datanya berdistribusi normal.',
    ),
  ];

  static final Map<String, MaterialItem> _materialLibrary = {
    'apa-itu-distribusi': const MaterialItem(
      id: 'apa-itu-distribusi',
      title: 'Apa itu Distribusi?',
      readingTime: '3 menit baca',
      status: ProgressStatus.completed,
      content: [
        ContentBlock.paragraph(
          'Distribusi data adalah cara nilai-nilai dalam sebuah data tersebar atau terdistribusi.',
        ),
        ContentBlock.callout(
          CalloutType.definisi,
          'Distribusi menggambarkan seberapa sering tiap nilai muncul dalam kumpulan data.',
        ),
      ],
    ),
    'distribusi-normal': const MaterialItem(
      id: 'distribusi-normal',
      title: 'Distribusi Normal',
      readingTime: '5 menit baca',
      status: ProgressStatus.inProgress,
      content: _distribusiNormalContent,
    ),
    'distribusi-binomial': const MaterialItem(
      id: 'distribusi-binomial',
      title: 'Distribusi Binomial',
      readingTime: '4 menit baca',
      status: ProgressStatus.locked,
    ),
    'latihan-soal-distribusi': const MaterialItem(
      id: 'latihan-soal-distribusi',
      title: 'Latihan Soal',
      readingTime: '6 menit baca',
      status: ProgressStatus.locked,
    ),
  };

  // CHAPTERS (Bab)
  static final List<Chapter> _statistikaChapters = [
    Chapter(
      id: 'pengenalan-data',
      title: 'Pengenalan Data',
      status: ProgressStatus.completed,
      completedMaterialCount: 4,
      materials: [
        _materialLibrary['apa-itu-distribusi']!,
        _materialLibrary['apa-itu-distribusi']!,
        _materialLibrary['apa-itu-distribusi']!,
        _materialLibrary['apa-itu-distribusi']!,
      ],
    ),
    Chapter(
      id: 'distribusi-data',
      title: 'Distribusi Data',
      levelLabel: 'Tingkat Pemula · Teori & Studi Kasus',
      description: 'Pahami bagaimana data terpusat dan menyebar untuk validasi eksperimen.',
      status: ProgressStatus.inProgress,
      completedMaterialCount: 1,
      materials: [
        _materialLibrary['apa-itu-distribusi']!,
        _materialLibrary['distribusi-normal']!,
        _materialLibrary['distribusi-binomial']!,
        _materialLibrary['latihan-soal-distribusi']!,
      ],
    ),
    const Chapter(
      id: 'probabilitas-dasar',
      title: 'Probabilitas Dasar',
      status: ProgressStatus.locked,
      materials: [],
    ),
  ];

  // COURSES
  static final List<Course> courses = [
    Course(
      id: 'dasar-statistika',
      title: 'Dasar Statistika',
      category: 'Sains',
      icon: Icons.bar_chart_rounded,
      tintColor: AppColors.mint,
      iconColor: AppColors.navy,
      description:
          'Pengantar konsep statistika untuk pemula, dari distribusi data hingga probabilitas dasar.',
      progressPercent: 60,
      activeDiscussionCount: 24,
      chapters: _statistikaChapters,
    ),
    Course(
      id: 'dasar-pemrograman',
      title: 'Dasar Pemrograman',
      category: 'Teknologi',
      icon: Icons.code_rounded,
      tintColor: AppColors.skyBlue,
      iconColor: AppColors.navy,
      description: 'Fondasi logika pemrograman dan sintaks dasar untuk pemula.',
      progressPercent: 25,
      activeDiscussionCount: 9,
      chapters: const [],
    ),
    Course(
      id: 'kimia-dasar',
      title: 'Kimia Dasar',
      category: 'Sains',
      icon: Icons.science_rounded,
      tintColor: AppColors.mint,
      iconColor: AppColors.navy,
      description: 'Konsep dasar kimia untuk pemula.',
      progressPercent: 0,
      activeDiscussionCount: 3,
      chapters: const [],
    ),
    Course(
      id: 'bahasa-inggris',
      title: 'Bahasa Inggris',
      category: 'Bahasa',
      icon: Icons.language_rounded,
      tintColor: AppColors.skyBlue,
      iconColor: AppColors.navy,
      description: 'Kemampuan dasar bahasa Inggris untuk komunikasi sehari-hari.',
      progressPercent: 0,
      activeDiscussionCount: 0,
      chapters: const [],
    ),
  ];

  static Course get featuredCourse => courses.first; // "Dasar Statistika"

  // FORUM / THREADS
  static final List<Thread> threads = [
    const Thread(
      id: 'thread-1',
      courseId: 'dasar-statistika',
      authorName: 'Rina',
      authorInitials: 'RN',
      timeAgo: '2 jam lalu',
      title: 'Bedanya distribusi normal dan binomial apa ya?',
      preview: 'Masih bingung di bagian kurva lonceng, ada yang bisa jelasin sederhana?',
      likeCount: 12,
      isSolved: true,
      replies: [
        Reply(
          authorName: 'Dimas',
          authorInitials: 'DP',
          timeAgo: '1 jam lalu',
          body:
              'Normal itu data kontinu (bisa pecahan), binomial diskrit (cuma hitungan bulat). '
              'Jadi bentuk binomial lebih kayak batang, bukan kurva mulus.',
          likeCount: 6,
        ),
        Reply(
          authorName: 'Sari',
          authorInitials: 'SA',
          timeAgo: '40 menit lalu',
          body: 'Coba baca lagi Materi 2 di Bab Distribusi Data, di situ ada diagram perbandingannya.',
          likeCount: 3,
        ),
      ],
    ),
    const Thread(
      id: 'thread-2',
      courseId: 'dasar-statistika',
      authorName: 'Dimas',
      authorInitials: 'DP',
      timeAgo: '5 jam lalu',
      title: 'Rekomendasi latihan soal tambahan?',
      preview: 'Materi Bab 2 udah selesai, pengen latihan lebih banyak.',
      likeCount: 5,
      replies: [
        Reply(
          authorName: 'Sari',
          authorInitials: 'SA',
          timeAgo: '3 jam lalu',
          body: 'Coba cek bank soal di akhir setiap Bab, ada tombol "Latihan Soal".',
          likeCount: 2,
        ),
      ],
    ),
    const Thread(
      id: 'thread-3',
      courseId: 'dasar-statistika',
      authorName: 'Sari',
      authorInitials: 'SA',
      timeAgo: '1 hari lalu',
      title: 'Catatan ringkas Bab 1, semoga membantu',
      likeCount: 41,
      replies: [],
    ),
    const Thread(
      id: 'thread-4',
      courseId: 'dasar-pemrograman',
      authorName: 'Budi',
      authorInitials: 'BD',
      timeAgo: '3 jam lalu',
      title: 'Error "index out of range" saat looping, kenapa ya?',
      preview: 'Baru belajar array, sering kena error ini pas akses elemen terakhir.',
      likeCount: 8,
      replies: [],
    ),
  ];

  static List<Thread> threadsForCourse(String courseId) =>
      threads.where((t) => t.courseId == courseId).toList();

  // ---------------------------------------------------------------------
  // ACHIEVEMENT
  // ---------------------------------------------------------------------
  static const List<Achievement> achievements = [
    Achievement(
      courseTitle: 'Dasar HTML & CSS',
      isCompleted: true,
      subtitle: 'Selesai 3 Sept 2026',
    ),
    Achievement(
      courseTitle: 'Dasar Statistika',
      isCompleted: false,
      subtitle: '60% selesai',
    ),
  ];

  // SEARCH
  static const List<String> popularSearches = ['Statistika', 'Python', 'Bahasa Inggris'];
  static const List<String> recentSearches = ['Aljabar linear', 'Machine learning'];

  // PROFILE
  static const String userName = 'Karina';
  static const String userEmail = 'karina.aespa@email.com';
  static const int coursesCompletedCount = 3;
  static const int materialsLearnedCount = 42;
}
