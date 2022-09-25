import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misxV2/utils/constants.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

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
    canvasColor: Colors.blueGrey,
    textTheme: textThemeLight(),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Colors.blueGrey,
      backgroundColor: Colors.white,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarThemeDark(),
    backgroundColor: Color(AppColor),
    bottomAppBarColor: Color(AppColor),
    primaryColor: Colors.white,
    primaryColorLight: Colors.white,
    primaryColorDark: Color(AppColor),
    hoverColor: Colors.blueGrey ,
    canvasColor: Colors.black26,
    textTheme: textThemeDark(),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(AppColor),
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Colors.blueGrey,
      backgroundColor: Colors.blueGrey,
    ),
  );
}
