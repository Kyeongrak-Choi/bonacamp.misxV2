import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

TextTheme textThemeLight() {
  return TextTheme(
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 8,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    titleLarge: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.gray,
    ),
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.gray,
    ),
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.gray,
    ),
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      color: CommonColors.dark,
    ),
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      color: CommonColors.dark,
    ),
    bodySmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      color: CommonColors.dark,
    ),
  );
}

TextTheme textThemeDark() {
  return TextTheme(
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    titleLarge: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.gray,
    ),
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.gray,
    ),
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.gray,
    ),
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      color: CommonColors.white,
    ),
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      color: CommonColors.white,
    ),
    bodySmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      color: CommonColors.white,
    ),
  );
}

TextTheme textThemeCommon() {
  return TextTheme(
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 8.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    bodySmall: GoogleFonts.nanumGothic(
      fontSize: 6.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
  );
}
