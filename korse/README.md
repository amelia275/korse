# Korse

Aplikasi mobile course umum (UI-only) — tugas kelompok mata kuliah Mobile Programming.

## Batasan proyek

- **100% `StatelessWidget`** — tidak ada `StatefulWidget`, tidak ada `setState`, tidak ada state management (Provider/Bloc/Riverpod/dsb).
- Semua kondisi visual (status selesai/sedang berjalan/terkunci, hasil pencarian, dsb) **di-hardcode** lewat data di `lib/data/dummy_data.dart` — bukan dihitung saat runtime.
- Navigasi antar-screen memakai `Navigator.push` / `Navigator.pushReplacement` biasa — tidak melanggar batasan StatelessWidget karena berpindah halaman ≠ mengubah state di dalam satu widget.

## Cara menjalankan

Repo ini berisi source code `lib/` saja (belum di-`flutter create`). Untuk menjalankannya:

```bash
flutter create . --platforms=android,ios --org com.korse
flutter pub get
flutter run
```

Perintah `flutter create .` akan membuat folder `android/`, `ios/`, dll di sekitar `lib/` yang sudah ada, tanpa menimpa kodenya.

## Palet warna

| Token | Hex | Pemakaian |
|---|---|---|
| Navy (primary) | `#293681` | Judul, tombol utama, teks penting |
| Blue (secondary) | `#4274D9` | Progress bar, ikon aktif, aksen |
| Sky Blue | `#95CCDD` | Highlight lembut, badge, tint kategori |
| Mint | `#D0E7E6` | Background ilustrasi/kartu, callout definisi |
| Background | `#FFFFFF` | Background solid semua screen |

Semua token ada di `lib/core/theme/app_colors.dart` — jangan menambah warna baru di luar file ini.

## Struktur folder

```
lib/
├── main.dart                     # entry point, MaterialApp
├── core/
│   ├── theme/                    # warna, text style, ThemeData
│   └── widgets/                  # widget reusable (card, tombol, bottom nav, dst)
├── models/                       # model data immutable (Course, Chapter, MaterialItem, Thread, dst)
├── data/
│   └── dummy_data.dart           # SATU-SATUNYA sumber data hardcoded
└── screens/
    ├── home/                     # top-level, punya bottom nav
    ├── search/                   # nested, 1 screen saja (lihat catatan di bawah)
    ├── course/                   # nested — Halaman Course
    ├── chapter/                  # nested — detail Bab + Struktur Materi
    ├── material/                 # nested — Detail Materi (konten belajar)
    ├── forum/                    # forum landing (top-level) + list/detail thread (nested)
    ├── achievement/              # top-level, punya bottom nav
    └── profile/                  # top-level, punya bottom nav
```

## Bottom navigation

Sesuai keputusan desain, `AppBottomNav` **hanya dipasang di 4 screen**:
`HomeScreen`, `ForumLandingScreen`, `AchievementScreen`, `ProfileScreen`.

Semua screen lain (Search, Course, Chapter, Material, Thread List, Thread Detail) adalah **nested screen** — diakses lewat `Navigator.push` dan otomatis punya tombol back dari `AppBar`, tanpa bottom nav.

## Halaman Search

Sesuai catatan proyek: Search **hanya 1 screen**, muncul saat search bar di Home ditekan. Tidak ada screen kedua untuk "hasil pencarian" — `TextField` di dalamnya murni visual (tanpa `controller`/`onChanged`), dan di bawahnya langsung tampil "Pencarian Populer" + "Riwayat Pencarian" sebagai satu tampilan statis.

## Alur navigasi utama

```
Home ──▶ Course Detail ──▶ Chapter Detail ──▶ Material Detail (Sebelumnya/Lanjut antar-materi)
  └──▶ Search

Forum Landing ──▶ Thread List ──▶ Thread Detail
Course Detail ──▶ (tombol "Diskusi") ──▶ Thread List (skip landing)

Achievement, Profile — halaman mandiri (statis)
```

## Menambah/mengubah data contoh

Semua data ada di satu file: `lib/data/dummy_data.dart`. Untuk menambah Course, Bab, Materi, atau Thread baru, cukup tambahkan instance baru di file ini — tidak perlu mengubah widget/screen apa pun karena semuanya sudah generic terhadap model data (`Course`, `Chapter`, `MaterialItem`, `Thread`).

## Font

Text style memakai nama font `Inter` (`lib/core/theme/app_text_styles.dart`). Font ini belum di-bundle sebagai asset di repo ini — kalau tidak ditambahkan, Flutter otomatis fallback ke font sistem (tidak error, cuma beda tipografi). Untuk memakai Inter yang sesungguhnya, tambahkan package [`google_fonts`](https://pub.dev/packages/google_fonts) lalu ganti `fontFamily: 'Inter'` dengan `GoogleFonts.inter()`, atau unduh file `.ttf` Inter dan daftarkan manual di `pubspec.yaml`.
