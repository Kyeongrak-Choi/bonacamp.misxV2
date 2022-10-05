import 'package:flutter/material.dart';
import 'package:misxV2/utils/theme/color_manager.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import 'appbar_theme.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarThemeLight(),
    backgroundColor: LightColors.basic,
    bottomAppBarColor: LightColors.basic,
    primaryColor: DarkColors.basic,
    primaryColorLight: LightColors.basic,
    primaryColorDark: DarkColors.basic,
    canvasColor: LightColors.canvas,
    textTheme: textThemeLight(),
    buttonTheme: const ButtonThemeData(
      buttonColor: LightColors.basic,
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: LightColors.canvas,
      backgroundColor: LightColors.basic,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarThemeDark(),
    backgroundColor: DarkColors.basic,
    bottomAppBarColor: DarkColors.basic,
    primaryColor: LightColors.basic,
    primaryColorLight: DarkColors.important,
    primaryColorDark: CommonColors.common_dark,
    canvasColor: DarkColors.canvas,
    textTheme: textThemeDark(),
    buttonTheme: const ButtonThemeData(
      buttonColor: DarkColors.basic,
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: DarkColors.canvas,
      backgroundColor: DarkColors.basic,
    ),
  );
}
