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
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Heading 1
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 56.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Heading 2
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 48.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Heading 3
    headlineLarge: GoogleFonts.nanumGothic(
      fontSize: 40.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Heading 4
    headlineMedium: GoogleFonts.nanumGothic(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Heading 5
    headlineSmall: GoogleFonts.nanumGothic(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Heading 6
    titleLarge: GoogleFonts.nanumGothic(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Paragraph 1
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 18.sp,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Paragraph 2
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 16.sp,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Paragraph 3
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 14.sp,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
    // Paragraph 4
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 13.sp,
      color: LightColors.font,
    ).merge(TextStyle(fontFamily: 'SUITE')),
  );
}

TextTheme textThemeDark() {
  return TextTheme(
    // Display 1
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 72.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 1
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 56.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 2
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 48.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 3
    headlineLarge: GoogleFonts.nanumGothic(
      fontSize: 40.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 4
    headlineMedium: GoogleFonts.nanumGothic(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 5
    headlineSmall: GoogleFonts.nanumGothic(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 6
    titleLarge: GoogleFonts.nanumGothic(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Paragraph 1
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 18.sp,
      color: DarkColors.paragraphFont,
    ),
    // Paragraph 2
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 16.sp,
      color: DarkColors.paragraphFont,
    ),
    // Paragraph 3
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 14.sp,
      color: DarkColors.paragraphFont,
    ),
    // Paragraph 4
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 13.sp,
      color: DarkColors.paragraphFont,
    ),
  );
}

TextTheme textThemeCommon() {
  return TextTheme(
    // Display 1
    displayLarge: GoogleFonts.nanumGothic(
      fontSize: 72.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 1
    displayMedium: GoogleFonts.nanumGothic(
      fontSize: 56.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 2
    displaySmall: GoogleFonts.nanumGothic(
      fontSize: 48.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 3
    headlineLarge: GoogleFonts.nanumGothic(
      fontSize: 40.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 4
    headlineMedium: GoogleFonts.nanumGothic(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 5
    headlineSmall: GoogleFonts.nanumGothic(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Heading 6
    titleLarge: GoogleFonts.nanumGothic(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: DarkColors.font,
    ),
    // Paragraph 1
    titleMedium: GoogleFonts.nanumGothic(
      fontSize: 18.sp,
      color: DarkColors.font,
    ),
    // Paragraph 2
    titleSmall: GoogleFonts.nanumGothic(
      fontSize: 16.sp,
      color: DarkColors.paragraphFont,
    ),
    // Paragraph 3
    bodyLarge: GoogleFonts.nanumGothic(
      fontSize: 14.sp,
      color: CommonColors.copyright,
    ),
    // Paragraph 4
    bodyMedium: GoogleFonts.nanumGothic(
      fontSize: 13.sp,
      color: CommonColors.copyright,
    ),
  );
}
