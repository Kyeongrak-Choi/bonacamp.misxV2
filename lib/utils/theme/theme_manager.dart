import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:renew_misx/utils/constants.dart';
import 'package:renew_misx/utils/theme/text_theme.dart';
import 'appbar_theme.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarThemeLight(),
    backgroundColor: Colors.white,
    bottomAppBarColor: Colors.white,
    primaryColor: Color(AppColor),
    primaryColorLight: Colors.white,
    primaryColorDark: Color(AppColor),
    textTheme: textThemeLight(),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarThemeDark(),
    backgroundColor: Color(AppColor),
    bottomAppBarColor: Color(AppColor),
    primaryColor: Colors.white,
    primaryColorLight: Color(AppColor),
    primaryColorDark: Colors.white,
    textTheme: textThemeDark(),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(AppColor),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}