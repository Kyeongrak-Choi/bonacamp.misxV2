import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

TextTheme textThemeLight() {
  return TextTheme(
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 21.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
  );
}

TextTheme textThemeDark() {
  return TextTheme(
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 21.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
  );
}

TextTheme textThemeCommon() {
  return TextTheme(
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 21.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
  );
}
