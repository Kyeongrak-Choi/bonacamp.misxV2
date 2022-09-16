import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renew_misx/utils/constants.dart';

TextTheme textThemeLight() {
  return TextTheme(
    headline1: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color(AppColor),
    ),
    headline2: GoogleFonts.nanumGothic(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Color(AppColor),
    ),
    headline3: GoogleFonts.nanumGothic(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color(AppColor),
    ),
    subtitle1: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Color(AppColor),
    ),
    subtitle2: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Color(AppColor),
    ),
    bodyText1: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Color(AppColor),
    ),
    bodyText2: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Color(AppColor),
    ),
  );
}

TextTheme textThemeDark() {
  return TextTheme(
    headline1: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.nanumGothic(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline3: GoogleFonts.nanumGothic(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    subtitle2: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText1: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

TextTheme textThemeLogin() {
  return TextTheme(
    headline1: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color(AppColor),
    ),
    headline2: GoogleFonts.nanumGothic(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Color(AppColor),
    ),
  );
}