import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle h1 = GoogleFonts.plusJakartaSans(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static final TextStyle h2 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static final TextStyle h3 = GoogleFonts.plusJakartaSans(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.35,
  );

  static final TextStyle body = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  static final TextStyle bodySecondary = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static final TextStyle caption = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.4,
  );

  static final TextStyle button = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.onPrimary,
  );

  static final TextStyle statNumber = GoogleFonts.plusJakartaSans(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
}
