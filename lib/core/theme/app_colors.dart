import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Palet dasar
  static const Color navy = Color(0xFF293681); // primary — teks penting, tombol utama
  static const Color blue = Color(0xFF4274D9); // secondary — aksen, ikon aktif, progress
  static const Color skyBlue = Color(0xFF95CCDD); // tersier — highlight lembut, badge
  static const Color mint = Color(0xFFD0E7E6); // tint — background kartu/ilustrasi

  // Background & surface
  static const Color background = Color(0xFFFFFFFF); // background solid putih
  static const Color surfaceMuted = Color(0xFFF5F7FB); // abu sangat terang, untuk section/stat card
  static const Color border = Color(0xFFE3E7F1);

  // Teks
  static const Color textPrimary = Color(0xFF1A1D29);
  static const Color textSecondary = Color(0xFF5B6072);
  static const Color textMuted = Color(0xFF9AA0B4);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Status
  static const Color success = Color(0xFF2E9E6C);
  static const Color successBg = Color(0xFFE4F5EC);
  static const Color locked = Color(0xFFB9BECF);
  static const Color lockedBg = Color(0xFFF0F1F6);

  // Callout (Detail Materi)
  static const Color calloutDefinisiBg = mint;
  static const Color calloutDefinisiFg = navy;
  static const Color calloutContohBg = Color(0xFFEFEAF9);
  static const Color calloutContohFg = Color(0xFF5B3EA6);
  static const Color calloutTipsBg = Color(0xFFFFF3D9);
  static const Color calloutTipsFg = Color(0xFF8A5A00);

  // Kategori/course cover tints (dipilih dari turunan palet + status)
  static const List<Color> categoryTints = [
    mint,
    skyBlue,
    Color(0xFFDCE6FB), // biru sangat muda
    Color(0xFFE7E9F7), // navy sangat muda
  ];

  static Color? get primary => null;

  static Color? get surface => null;
}
