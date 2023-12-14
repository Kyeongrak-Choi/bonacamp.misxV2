import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

TextTheme textThemeLight() {
  return TextTheme(
    // 라벨
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    // 타이틀
    titleLarge: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    // 데이터
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      color: CommonColors.dark,
    ),
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      color: CommonColors.dark,
    ),
    bodySmall: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      color: CommonColors.dark,
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
      color: CommonColors.dark,
    ),
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      color: CommonColors.dark,
    ),
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      color: CommonColors.dark,
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
