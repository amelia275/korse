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

  // ASSET
  static const String brandMark = 'assets/images/brand_mark.png';
  static const String avatarUser = 'assets/images/avatar_ammsy.png';

  // MATERI
  static const _distribusiNormalContent = [
    ContentBlock.illustration(
      'assets/images/fig_kurva_normal.png',
      'Gambar 2.1: Kurva Lonceng Gauss Simetris (μ = Nilai Tengah)',
    ),
    ContentBlock.paragraph(
      'Distribusi normal adalah distribusi probabilitas kontinu yang membentuk '
      'kurva lonceng simetris sempurna, di mana nilai sebagian besar data '
      'berpusat di sekitar nilai rata-rata (mean).',
    ),
    ContentBlock.callout(
      CalloutType.definisi,
      'Secara matematis, distribusi ini dipengaruhi oleh dua parameter utama: '
      'rata-rata (μ) yang menentukan posisi puncak dan deviasi standar (σ) '
      'yang menentukan lebar sebaran data.',
    ),
    ContentBlock.paragraph(
      'Banyak fenomena alamiah dan sosial secara alami mengikuti pola ini, '
      'mulai dari tinggi badan populasi, skor tes standar internasional, '
      'hingga variasi toleransi mesin manufaktur.',
    ),
    ContentBlock.callout(
      CalloutType.tips,
      'Dalam ujian seleksi berskala nasional dengan 10.000 peserta, sekitar '
      '68,2% peserta akan memperoleh nilai berkisar di antara satu deviasi '
      'standar dari nilai rata-rata keseluruhan.',
    ),
  ];

  static const _apaItuDistribusiContent = [
    ContentBlock.illustration(
      'assets/images/fig_histogram.png',
      'Gambar 2.0: Histogram sebaran nilai sebagai bentuk awal distribusi',
    ),
    ContentBlock.paragraph(
      'Distribusi data adalah cara nilai-nilai dalam sebuah kumpulan data '
      'tersebar: mana yang sering muncul, mana yang jarang, dan seberapa jauh '
      'jaraknya dari pusat data.',
    ),
    ContentBlock.callout(
      CalloutType.definisi,
      'Distribusi menggambarkan seberapa sering tiap nilai muncul dalam '
      'kumpulan data, biasanya divisualisasikan lewat histogram.',
    ),
  ];

  static final Map<String, MaterialItem> _materialLibrary = {
    'apa-itu-distribusi': const MaterialItem(
      id: 'apa-itu-distribusi',
      title: 'Apa itu Distribusi?',
      readingTime: '3 menit baca',
      kindLabel: 'Konsep Dasar',
      breadcrumbLabel: 'MODUL 2 · STATISTIKA DASAR',
      coreConceptNote: 'Lanjut ke bahasan kurva lonceng',
      status: ProgressStatus.completed,
      content: _apaItuDistribusiContent,
    ),
    'distribusi-normal': const MaterialItem(
      id: 'distribusi-normal',
      title: 'Distribusi Normal',
      readingTime: '5 menit baca',
      kindLabel: 'Sedang dipelajari · 5 menit',
      breadcrumbLabel: 'MODUL 2 · STATISTIKA DASAR',
      coreConceptNote: 'Lanjut ke bahasan parameter deviasi',
      status: ProgressStatus.inProgress,
      content: _distribusiNormalContent,
    ),
    'distribusi-binomial': const MaterialItem(
      id: 'distribusi-binomial',
      title: 'Distribusi Binomial',
      readingTime: '4 menit baca',
      kindLabel: 'Probabilitas Diskrit',
      breadcrumbLabel: 'MODUL 2 · STATISTIKA DASAR',
      status: ProgressStatus.locked,
    ),
    'latihan-soal-distribusi': const MaterialItem(
      id: 'latihan-soal-distribusi',
      title: 'Latihan Soal',
      readingTime: '6 menit uji pemahaman',
      kindLabel: 'Kuis Formatif',
      extraBadge: '5 Soal',
      breadcrumbLabel: 'MODUL 2 · STATISTIKA DASAR',
      status: ProgressStatus.locked,
    ),
  };

  // CHAPTERS
  static final List<Chapter> _statistikaChapters = [
    Chapter(
      id: 'pengenalan-data',
      title: 'Pengenalan Data',
      moduleLabel: 'MODUL 1 · DASAR STATISTIKA',
      headline: 'Jenis Data dan Skala Pengukuran',
      levelLabel: 'Tingkat Pemula · Teori Dasar',
      description:
          'Mengenali tipe data nominal, ordinal, interval, dan rasio sebelum '
          'masuk ke analisis sebaran.',
      thumbnailAsset: 'assets/images/thumb_kurva.png',
      status: ProgressStatus.completed,
      completedMaterialCount: 4,
      progressPercent: 100,
      estimateLabel: 'Estimasi total 14 menit bacaan interaktif',
      remainingLabel: 'Selesai',
      materials: [
        _materialLibrary['apa-itu-distribusi']!,
      ],
    ),
    Chapter(
      id: 'distribusi-data',
      title: 'Distribusi Data',
      moduleLabel: 'MODUL 2 · DASAR STATISTIKA',
      headline: 'Kurva, Pola, dan Dispersi',
      levelLabel: 'Tingkat Pemula · Teori & Studi Kasus',
      description:
          'Pahami bagaimana data terpusat dan menyebar untuk validasi '
          'eksperimen.',
      thumbnailAsset: 'assets/images/thumb_kurva.png',
      status: ProgressStatus.inProgress,
      completedMaterialCount: 1,
      progressPercent: 25,
      estimateLabel: 'Estimasi total 18 menit bacaan interaktif',
      remainingLabel: 'Tersisa 15m',
      funFact:
          'Kurva normal Gauss pertama kali digunakan untuk memperkirakan '
          'kesalahan pengamatan astronomi sebelum menjadi pilar utama analisis '
          'data modern.',
      unlockNote: 'Bab berikutnya terbuka otomatis setelah materi ini selesai.',
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
      moduleLabel: 'MODUL 3 · DASAR STATISTIKA',
      headline: 'Peluang dan Ruang Sampel',
      status: ProgressStatus.locked,
      materials: [],
    ),
  ];

  // ---------------------------------------------------------------------
  // COURSES
  // ---------------------------------------------------------------------
  static final List<Course> courses = [
    Course(
      id: 'dasar-statistika',
      title: 'Dasar Statistika',
      certificationLabel: 'Sertifikasi Analisis Data',
      category: 'Sains',
      icon: Icons.bar_chart_rounded,
      tintColor: AppColors.mint,
      iconColor: AppColors.navy,
      coverAsset: 'assets/images/cover_statistika.png',
      description:
          'Pengantar konsep statistika untuk pemula, dari distribusi data '
          'hingga probabilitas dasar.',
      structureLabel: '6 Bab · 38 artikel teks',
      levelLabel: 'Pemula',
      ratingLabel: '4.9',
      modulePositionLabel: 'Modul 2 dari 6',
      readingTimeLabel: '45 Menit Bacaan',
      continueModuleLabel: 'Modul 4 · 12 mnt',
      syllabusTitle: 'Ukuran Pemusatan & Distribusi Data',
      syllabusDescription:
          'Pelajari konsep tendensi sentral meliputi mean, median, modus, '
          'serta interpretasi variansi pada sebuah kumpulan data.',
      chapterCountLabel: '3 Bab Pembelajaran',
      moduleProgressPercent: 50,
      activeMaterialTitle: 'Distribusi Frekuensi & Histogram',
      activeMaterialEstimate: 'Estimasi waktu: 12 menit interaktif',
      nextModuleNote: 'Modul aktif berikutnya: Distribusi Frekuensi',
      progressPercent: 60,
      activeDiscussionCount: 24,
      hasNewDiscussion: true,
      participantAvatars: const [
        'assets/images/avatar_rina.png',
        'assets/images/avatar_dimas.png',
        'assets/images/avatar_siti.png',
      ],
      chapters: _statistikaChapters,
    ),
    Course(
      id: 'dasar-pemrograman',
      title: 'Dasar Pemrograman',
      certificationLabel: 'Jalur Pengembang Pemula',
      category: 'Teknologi',
      icon: Icons.code_rounded,
      tintColor: AppColors.categoryTints[2],
      iconColor: AppColors.navy,
      coverAsset: 'assets/images/cover_pemrograman.png',
      description: 'Fondasi logika pemrograman dan sintaks dasar untuk pemula.',
      structureLabel: '10 Bab · 52 artikel teks',
      levelLabel: 'Pemula',
      ratingLabel: '4.7',
      continueModuleLabel: 'Modul 2 · 18 mnt',
      progressPercent: 25,
      activeDiscussionCount: 9,
      participantAvatars: const [
        'assets/images/avatar_rian.png',
        'assets/images/avatar_budi.png',
      ],
      chapters: const [],
    ),
    const Course(
      id: 'kimia-dasar',
      title: 'Kimia Dasar',
      certificationLabel: 'Sains Terapan',
      category: 'Sains',
      icon: Icons.science_rounded,
      tintColor: AppColors.mint,
      iconColor: AppColors.navy,
      coverAsset: 'assets/images/cover_kimia.png',
      description: 'Konsep dasar kimia, ikatan, dan reaksi untuk pemula.',
      structureLabel: '8 Bab · 45 artikel teks',
      levelLabel: 'Pemula',
      ratingLabel: '4.8',
      activeDiscussionCount: 3,
      participantAvatars: ['assets/images/avatar_anisa.png'],
      chapters: [],
    ),
    Course(
      id: 'bahasa-inggris',
      title: 'Bahasa Inggris',
      certificationLabel: 'Komunikasi Profesional',
      category: 'Bahasa',
      icon: Icons.translate_rounded,
      tintColor: AppColors.categoryTints[3],
      iconColor: AppColors.navy,
      coverAsset: 'assets/images/cover_bahasa.png',
      description:
          'Kemampuan dasar bahasa Inggris untuk komunikasi sehari-hari.',
      structureLabel: '12 Bab · 60 artikel teks',
      levelLabel: 'Menengah',
      ratingLabel: '4.9',
      chapters: const [],
    ),
    Course(
      id: 'manajemen-produk',
      title: 'Manajemen Produk',
      certificationLabel: 'Bisnis & Strategi',
      category: 'Teknologi',
      icon: Icons.trending_up_rounded,
      tintColor: AppColors.categoryTints[2],
      iconColor: AppColors.navy,
      coverAsset: 'assets/images/cover_manajemen.png',
      description: 'Siklus hidup produk digital dari riset sampai peluncuran.',
      structureLabel: '10 Bab · 34 artikel teks',
      levelLabel: 'Semua',
      ratingLabel: '4.7',
      chapters: const [],
    ),
    const Course(
      id: 'psikologi-kognitif',
      title: 'Psikologi Kognitif',
      certificationLabel: 'Ilmu Perilaku',
      category: 'Sains',
      icon: Icons.psychology_rounded,
      tintColor: AppColors.mint,
      iconColor: AppColors.navy,
      coverAsset: 'assets/images/cover_psikologi.png',
      description: 'Bagaimana manusia mengingat, belajar, dan mengambil '
          'keputusan.',
      structureLabel: '6 Bab · 34 artikel teks',
      levelLabel: 'Pemula',
      ratingLabel: '4.9',
      chapters: [],
    ),
  ];

  static Course get featuredCourse => courses.first;

  static const List<String> courseFilters = [
    'Semua',
    'Sains',
    'Teknologi',
    'Bahasa',
  ];

  // FORUM / THREADS
  static const List<String> forumFilters = [
    'Semua',
    'Diikuti 3',
    'Populer',
    'Terbaru',
  ];

  static const List<String> threadFilters = [
    'Semua (24)',
    'Tanya Jawab',
    'Catatan & Tips',
    'Diskusi',
  ];

  static const String forumOnlineLabel = '128 Online';

  static final List<Thread> threads = [
    const Thread(
      id: 'thread-1',
      courseId: 'dasar-statistika',
      authorName: 'Dimas Raditya',
      authorInitials: 'DR',
      authorAvatar: 'assets/images/avatar_dimas.png',
      timeAgo: '15 menit lalu',
      moduleLabel: 'Modul 2',
      categoryLabel: 'Tanya Jawab',
      statusLabel: 'Terjawab',
      title: 'Bedanya distribusi normal dan binomial apa ya?',
      preview:
          'Halo rekan-rekan dan dosen, saya masih agak bingung membedakan '
          'kapan kita harus menggunakan distribusi diskrit vs kontinu di soal '
          'latihan Modul 2. Terutama untuk kasus variabel peluang yang '
          'nilainya banyak sekali, batas penggunaannya seperti apa?',
      likeCount: 12,
      isSolved: true,
      footerNote: 'Balasan terakhir 10m lalu',
      participantAvatars: [
        'assets/images/avatar_siti.png',
        'assets/images/avatar_budi.png',
        'assets/images/avatar_rina.png',
      ],
      replies: [
        Reply(
          authorName: 'Dr. Pandu Wicaksono',
          authorInitials: 'DP',
          authorAvatar: 'assets/images/avatar_pandu.png',
          role: AuthorRole.mentor,
          isBestAnswer: true,
          timeAgo: '1 jam lalu',
          body:
              'Singkatnya, distribusi binomial dipakai untuk data diskrit '
              '(hasil hitungan bulat seperti ya/tidak, jumlah sukses), '
              'sedangkan distribusi normal untuk data kontinu yang bisa '
              'bernilai pecahan pada rentang tertentu.',
          likeCount: 14,
        ),
        Reply(
          authorName: 'Siti Fadhilah',
          authorInitials: 'SF',
          authorAvatar: 'assets/images/avatar_siti.png',
          timeAgo: '45 menit lalu',
          body:
              'Tambahan info, jika nilai n pada binomial cukup besar dan p '
              'mendekati 0.5, distribusi binomial bisa didekati dengan kurva '
              'distribusi normal (teorema limit pusat).',
          likeCount: 6,
        ),
        Reply(
          authorName: 'Budi Prasetyo',
          authorInitials: 'BP',
          authorAvatar: 'assets/images/avatar_budi.png',
          timeAgo: '20 menit lalu',
          body:
              'Coba cek catatan ringkas modul 1 dan 2 yang saya upload kemarin '
              'di forum, ada tabel perbandingan rumusnya juga kayak Rina. '
              'Membantu banget pas ngerjain kuis!',
          likeCount: 3,
          attachmentName: 'Ringkasan_Distribusi_M1-M2.pdf',
        ),
      ],
    ),
    const Thread(
      id: 'thread-2',
      courseId: 'dasar-statistika',
      authorName: 'Siti Fadhilah',
      authorInitials: 'SF',
      authorAvatar: 'assets/images/avatar_siti.png',
      timeAgo: '2 jam lalu',
      moduleLabel: 'Latihan Soal',
      categoryLabel: 'Tanya Jawab',
      title: 'Rekomendasi latihan soal tambahan?',
      preview:
          'Apakah ada modul atau bank soal rekomendasi untuk memperdalam '
          'pemahaman uji hipotesis setelah menyelesaikan Bab 2?',
      likeCount: 5,
      footerNote: 'Balasan terakhir 10m lalu',
      replies: [
        Reply(
          authorName: 'Anisa Maharani',
          authorInitials: 'AM',
          authorAvatar: 'assets/images/avatar_anisa.png',
          timeAgo: '1 jam lalu',
          body:
              'Coba buka bank soal di akhir tiap Bab, tombolnya ada di bawah '
              'kartu "Latihan Soal".',
          likeCount: 2,
        ),
      ],
    ),
    const Thread(
      id: 'thread-3',
      courseId: 'dasar-statistika',
      authorName: 'Budi Prasetyo',
      authorInitials: 'BP',
      authorAvatar: 'assets/images/avatar_budi.png',
      timeAgo: 'Kemarin',
      moduleLabel: 'Catatan Belajar',
      categoryLabel: 'Catatan & Tips',
      statusLabel: 'Populer',
      title: 'Catatan ringkas modul 1, semoga membantu',
      preview:
          'Saya merangkum konsep mean, median, modus, dan visualisasi diagram '
          'batang dalam bentuk satu halaman PDF.',
      likeCount: 41,
      attachmentName: 'Ringkasan_Statistika_Modul1.pdf',
      attachmentSize: '1.4 MB',
      downloadCount: 28,
      replies: [
        Reply(
          authorName: 'Rina Nastiti',
          authorInitials: 'RN',
          authorAvatar: 'assets/images/avatar_rina.png',
          timeAgo: '20 jam lalu',
          body: 'Rapi banget, makasih banyak Budi!',
          likeCount: 4,
        ),
      ],
    ),
    const Thread(
      id: 'thread-4',
      courseId: 'dasar-statistika',
      authorName: 'Anisa Maharani',
      authorInitials: 'AM',
      authorAvatar: 'assets/images/avatar_anisa.png',
      timeAgo: '2 hari lalu',
      moduleLabel: 'Kuis Modul 2',
      categoryLabel: 'Diskusi',
      statusLabel: 'Dosen menjawab',
      title: 'Mengapa nilai deviasi standar kurva normal bernilai 1 pada '
          'Z-Score?',
      preview:
          'Membahas standarisasi kurva Z. Apakah rumus deviasi standar selalu '
          'konstan atau bergantung pada data aslinya?',
      likeCount: 32,
      footerNote: 'Solusi disetujui',
      replies: [
        Reply(
          authorName: 'Dr. Pandu Wicaksono',
          authorInitials: 'DP',
          authorAvatar: 'assets/images/avatar_pandu.png',
          role: AuthorRole.mentor,
          isBestAnswer: true,
          timeAgo: '1 hari lalu',
          body:
              'Z-Score menormalkan data sehingga rata-ratanya 0 dan deviasi '
              'standarnya 1. Jadi angka 1 itu hasil standarisasi, bukan sifat '
              'bawaan datanya.',
          likeCount: 18,
        ),
      ],
    ),
    const Thread(
      id: 'thread-5',
      courseId: 'dasar-pemrograman',
      authorName: 'Rian Pratama',
      authorInitials: 'RP',
      authorAvatar: 'assets/images/avatar_rian.png',
      timeAgo: '1 jam lalu',
      moduleLabel: 'Python',
      categoryLabel: 'Tanya Jawab',
      title: "Tips debugging error 'IndexError: list index out of range' saat "
          'looping',
      preview:
          'Halo rekan-rekan, ada pola praktis untuk menghindari off-by-one '
          'error saat memanipulasi list?',
      likeCount: 19,
      footerNote: 'Dosen ikut membalas',
      replies: [
        Reply(
          authorName: 'Dr. Pandu Wicaksono',
          authorInitials: 'DP',
          authorAvatar: 'assets/images/avatar_pandu.png',
          role: AuthorRole.mentor,
          timeAgo: '30 menit lalu',
          body:
              'Biasakan pakai perulangan berbasis iterator daripada indeks '
              'manual, dan cek panjang list sebelum mengakses elemen terakhir.',
          likeCount: 8,
        ),
      ],
    ),
  ];

  static List<Thread> threadsForCourse(String courseId) =>
      threads.where((t) => t.courseId == courseId).toList();

  static List<Thread> get hotThreads => [threads[3], threads[4]];

  // ACHIEVEMENT
  static const String achievementLevelLabel = 'Level 2';
  static const String achievementSummaryDone = '1 Kursus Selesai';
  static const String achievementSummaryProgress = '1 Dalam Progres';
  static const String achievementTargetTitle = 'Target Pembelajaran';
  static const String achievementTargetBody =
      'Selesaikan 1 modul lagi untuk badge baru';

  static const List<Achievement> achievements = [
    Achievement(
      courseTitle: 'Dasar HTML & CSS',
      isCompleted: true,
      subtitle: 'Selesai 3 Sept 2026',
      statusLabel: 'Selesai',
      progressPercent: 100,
    ),
    Achievement(
      courseTitle: 'Dasar Statistika',
      isCompleted: false,
      subtitle: '60% selesai',
      statusLabel: 'Terkunci',
      progressPercent: 60,
    ),
  ];

  // SEARCH
  static const List<String> popularSearches = [
    'Statistika',
    'Python',
    'Bahasa Inggris',
  ];
  static const List<String> recentSearches = [
    'Aljabar linear',
    'Machine learning',
  ];

  // PROFILE
  static const String userName = 'Irul';
  static const String userEmail = 'khairyul@email.com';
  static const String userPlanLabel = 'Learner Pro Aktif';
  static const String greeting = 'Selamat pagi,';
  static const int coursesCompletedCount = 3;
  static const int materialsLearnedCount = 42;
  static const String coursesCompletedNote = 'Target semester: 4';
  static const String materialsLearnedNote = '+5 modul minggu ini';
  static const String streakLabel = '6 Hari Berturut-turut';
  static const List<String> streakDays = [
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min',
  ];
  static const int streakActiveIndex = 4;
  static const String appVersionLabel = 'Korse v2.4.1 (Build 2026)';
  static const String appVersionNote =
      'Dirancang untuk fokus & ketenangan siswa';

  static const int coursesCompleted = coursesCompletedCount;
  static const int materialsLearned = materialsLearnedCount;
  static const int learningStreak = 6;
}