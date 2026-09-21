# Korse

Aplikasi mobile e-learning untuk kursus umum. Pembelajaran tidak lewat video, tapi lewat **materi teks terstruktur, ilustrasi, dan kotak penekanan** (definisi, contoh). Dibuat dengan Flutter sebagai tugas kelompok mata kuliah Mobile Programming, dengan fokus pada **UI**.

## Ringkasan

- **10 screen**: 4 landing screen (punya bottom navigation) dan 6 screen turunan.
- **100% `StatelessWidget`**, tanpa state management.
- Semua data berupa **data contoh (hardcoded)**, tanpa backend, API, atau database.
- Nama aplikasi: **Korse**.

## Batasan proyek

- **Tidak ada `StatefulWidget`**, tidak ada `setState`, dan tidak ada state management (Provider/Bloc/Riverpod, dsb).
- Semua kondisi visual (status selesai/sedang berjalan/terkunci, progres, hasil pencarian, dsb) **di-hardcode** lewat data di `lib/data/dummy_data.dart`, bukan dihitung saat runtime.
- Navigasi antar-screen memakai `Navigator.push` / `Navigator.pushReplacement` biasa. Ini tidak melanggar batasan `StatelessWidget` karena berpindah halaman bukan mengubah state di dalam satu widget.

## Cara menjalankan

Prasyarat: **Flutter 3.27 atau lebih baru** (kode memakai `Color.withValues`).

```bash
flutter pub get
flutter run -d chrome
```

Untuk emulator atau perangkat lain, lihat daftar target dengan `flutter devices`, lalu jalankan `flutter run -d <id>`.

> Perubahan di `pubspec.yaml` (aset/font) dan nilai `static const` di `DummyData` **tidak ikut hot reload**. Pakai hot restart (`R` di terminal `flutter run`) atau jalankan ulang aplikasinya.

## Daftar screen

| # | Screen | Class | File | Jenis |
|---|---|---|---|---|
| 1 | Home | `HomeScreen` | `lib/screens/home/home_screen.dart` | Landing |
| 2 | Forum | `ForumLandingScreen` | `lib/screens/forum/forum_landing_screen.dart` | Landing |
| 3 | Achievement (Pencapaian Belajar) | `AchievementScreen` | `lib/screens/achievement/achievement_screen.dart` | Landing |
| 4 | Profile | `ProfileScreen` | `lib/screens/profile/profile_screen.dart` | Landing |
| 5 | Search (Cari Course) | `SearchScreen` | `lib/screens/search/search_screen.dart` | Turunan |
| 6 | Course Detail | `CourseDetailScreen` | `lib/screens/course/course_detail_screen.dart` | Turunan |
| 7 | Chapter Detail | `ChapterDetailScreen` | `lib/screens/chapter/chapter_detail_screen.dart` | Turunan |
| 8 | Material Detail | `MaterialDetailScreen` | `lib/screens/material/material_detail_screen.dart` | Turunan |
| 9 | Daftar Diskusi | `ThreadListScreen` | `lib/screens/forum/thread_list_screen.dart` | Turunan |
| 10 | Detail Diskusi | `ThreadDetailScreen` | `lib/screens/forum/thread_detail_screen.dart` | Turunan |
| 11 | Edit Profile | `ProfileEdited` | `lib/screens/profile/profile_edited.dart` | Turunan |

## Alur navigasi utama

```
Home ──▶ Course Detail ──▶ Chapter Detail ──▶ Material Detail (Sebelumnya/Lanjut antar-materi)
  ├──▶ Search
  └──▶ Profile (lewat tombol di AppBar, selain lewat tab)

Forum Landing ──▶ Thread List ──▶ Thread Detail
Course Detail ──▶ (tombol "Diskusi") ──▶ Thread List (melewati landing)

Profile ──▶ Edit Profile
Achievement: halaman mandiri (statis)
```

## Bottom navigation

`AppBottomNav` **hanya dipasang di 4 landing screen**, dengan urutan tab:

1. Home (`HomeScreen`)
2. Forum (`ForumLandingScreen`)
3. Achievement (`AchievementScreen`)
4. Profile (`ProfileScreen`)

Semua screen lain (Search, Course, Chapter, Material, Thread List, Thread Detail, Edit Profile) adalah **screen turunan**. Diakses lewat `Navigator.push` dan otomatis punya tombol kembali, tanpa bottom navigation.

## Halaman Search

Search **hanya 1 screen**, muncul saat search bar di Home ditekan. Tidak ada screen kedua untuk "hasil pencarian". `TextField` di dalamnya murni visual (tanpa `controller`/`onChanged`), dan di bawahnya langsung tampil "Pencarian Populer" dan "Riwayat Pencarian" sebagai satu tampilan statis.

## Struktur folder

```
korse/
├── assets/
│   ├── fonts/                    # font Plus Jakarta Sans
│   └── images/                   # 18 gambar: cover course, avatar, ilustrasi materi, brand mark
├── lib/
│   ├── main.dart                 # entry point, KorseApp (MaterialApp)
│   ├── core/
│   │   ├── theme/                # AppColors, AppTextStyles, AppTheme
│   │   └── widgets/              # widget reusable (MaterialTile, CalloutBox, PrimaryButton, AppBottomNav, dst)
│   ├── models/                   # model data immutable (Course, Chapter, MaterialItem, ContentBlock, Thread, Achievement, ProgressStatus)
│   ├── data/
│   │   └── dummy_data.dart       # SATU-SATUNYA sumber data hardcoded (DummyData)
│   └── screens/
│       ├── home/                 # landing, punya bottom nav
│       ├── forum/                # landing Forum (punya bottom nav) + daftar/detail diskusi
│       ├── achievement/          # landing, punya bottom nav
│       ├── profile/              # landing, punya bottom nav, + Edit Profile
│       ├── search/               # turunan, 1 screen saja
│       ├── course/               # turunan, Halaman Course
│       ├── chapter/              # turunan, detail Bab + Struktur Materi
│       └── material/             # turunan, Detail Materi (konten belajar)
├── android/  ios/  web/          # folder platform
└── pubspec.yaml
```

## Aset gambar

Semua gambar ada di `assets/images/` dan **harus didaftarkan** di `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true

  assets:
    - assets/images/
```

Kalau bagian `assets:` tidak ada, gambar tidak ikut dibundel dan saat aplikasi berjalan muncul error "Unable to load asset".

## Palet warna

| Token | Hex | Pemakaian |
|---|---|---|
| Navy (primary) | `#293681` | Judul, tombol utama, teks penting |
| Blue (secondary) | `#4274D9` | Progress bar, ikon aktif, aksen |
| Sky Blue | `#95CCDD` | Highlight lembut, badge, tint kategori |
| Mint | `#D0E7E6` | Background ilustrasi/kartu, callout definisi |
| Background | `#FFFFFF` | Background solid semua screen |

Semua token ada di `lib/core/theme/app_colors.dart`. Jangan menambah warna baru di luar file ini.

## Font

Text style memakai font **Plus Jakarta Sans** (`fontFamily: 'Plus Jakarta Sans'` di `lib/core/theme/app_text_styles.dart`). File font diletakkan di `assets/fonts/` dan didaftarkan di `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: Plus Jakarta Sans
      fonts:
        - asset: assets/fonts/PlusJakartaSans-Regular.ttf
        - asset: assets/fonts/PlusJakartaSans-Medium.ttf
          weight: 500
        - asset: assets/fonts/PlusJakartaSans-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/PlusJakartaSans-Bold.ttf
          weight: 700
        - asset: assets/fonts/PlusJakartaSans-ExtraBold.ttf
          weight: 800
```

Kalau font belum didaftarkan, Flutter otomatis memakai font sistem. Tidak error, hanya tipografinya berbeda dari desain.

## Menambah atau mengubah data contoh

Semua data ada di satu file: `lib/data/dummy_data.dart`. Untuk menambah Course, Bab, Materi, atau Thread baru, cukup tambahkan instance baru di file ini. Screen tidak perlu diubah karena sudah generik terhadap model data (`Course`, `Chapter`, `MaterialItem`, `Thread`).

Isi setiap data dengan nilai yang realistis (bukan `null` atau `'-'`), karena nilai itu yang tampil langsung di layar.
