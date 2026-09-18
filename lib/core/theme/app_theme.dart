import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.blue,
        primary: AppColors.navy,
        secondary: AppColors.blue,
        surface: AppColors.background,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
