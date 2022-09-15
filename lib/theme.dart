import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renew_misx/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Color(AppColor),
      textTheme: textTheme(),
      appBarTheme: appBarTheme(),
      primaryColor: Color(AppColor),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.nanumGothic(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline3: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline4: GoogleFonts.nanumGothic(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline5: GoogleFonts.nanumGothic(
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline6: GoogleFonts.nanumGothic(
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    subtitle1: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    subtitle2: GoogleFonts.nanumGothic(
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.nanumGothic(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Color(AppColor),
    elevation: 0.0,
    systemOverlayStyle:
        Get.isDarkMode ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    toolbarTextStyle: TextTheme(
        headline6: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    )).bodyText2,
    titleTextStyle: TextTheme(
        headline6: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    )).headline6,
  );
}
