import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

TextTheme textThemeLight() {
  return TextTheme(
    headline1: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    headline2: GoogleFonts.nanumGothic(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    headline3: GoogleFonts.nanumGothic(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    subtitle1: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    subtitle2: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    bodyText1: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    bodyText2: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
  );
}

TextTheme textThemeDark() {
  return TextTheme(
    headline1: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    headline2: GoogleFonts.nanumGothic(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    headline3: GoogleFonts.nanumGothic(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    subtitle1: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    subtitle2: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    bodyText1: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
    bodyText2: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.white,
    ),
  );
}

TextTheme textThemeCommon() {
  return TextTheme(
    headline1: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    headline2: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    headline3: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
    bodyText1: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: CommonColors.dark,
    ),
  );
}
