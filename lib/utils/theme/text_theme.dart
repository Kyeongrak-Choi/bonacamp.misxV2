import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

TextTheme textThemeLight() {
  return TextTheme(
    // Display 1
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 72.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ),
    // Heading 1
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 56.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ),
    // Heading 2
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 48.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ),
    // Heading 3
    titleLarge: GoogleFonts.nanumGothic(
      fontSize: 40.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ),
    // Heading 4
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ),
    // Heading 5
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ),
    // Heading 6
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 20.sp,
      color: LightColors.font,
    ),
    // Paragraph 1
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 18.sp,
      color: LightColors.font,
    ),
    // Paragraph 2
    bodySmall: GoogleFonts.nanumGothic(
      fontSize: 16.sp,
      color: LightColors.font,
    ),

  );
}

TextTheme textThemeDark() {
  return TextTheme(
    // 라벨
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    // 타이틀
    titleLarge: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      color: CommonColors.white,
    ),
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      color: CommonColors.white,
    ),
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      color: CommonColors.white,
    ),
    // 데이터
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      color: CommonColors.white,
    ),
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      color: CommonColors.white,
    ),
    bodySmall: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      color: CommonColors.white,
    ),
  );
}

TextTheme textThemeCommon() {
  return TextTheme(
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.signature,
    ),
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.signature,
    ),
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.signature,
    ),
    titleLarge: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      color: LightColors.font,
    ),
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      color: LightColors.font,
    ),
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      color: LightColors.font,
    ),
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      color: CommonColors.signature,
    ),
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      color: CommonColors.signature,
    ),
    bodySmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      color: CommonColors.signature,
    ),
  );
}
