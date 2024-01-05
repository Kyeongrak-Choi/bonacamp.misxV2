import 'package:flutter/material.dart';
import 'package:misxV2/utils/theme/color_manager.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import 'appbar_theme.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarThemeLight(),
    primaryColor: LightColors.important,
    primaryColorLight: LightColors.basic,
    primaryColorDark: DarkColors.basic,
    canvasColor: LightColors.background,
    shadowColor: LightColors.textform,
    focusColor: LightColors.font,
    hoverColor: LightColors.defaultColor,
    iconTheme: const IconThemeData(
      color: LightColors.font,
    ),
    // backgorund
    cardColor: LightColors.basic,
    textTheme: textThemeLight(),
    buttonTheme: const ButtonThemeData(
      buttonColor: LightColors.basic,
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: LightColors.important,
      backgroundColor: LightColors.basic,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarThemeDark(),
    primaryColor: DarkColors.important,
    primaryColorLight: LightColors.basic,
    primaryColorDark: DarkColors.basic,
    canvasColor: DarkColors.background,
    shadowColor: DarkColors.textform,
    focusColor: DarkColors.font,
    hoverColor: DarkColors.defaultColor,
    iconTheme: const IconThemeData(
      color: DarkColors.font,
    ),
    // backgorund
    cardColor: DarkColors.basic,
    textTheme: textThemeDark(),
    buttonTheme: const ButtonThemeData(
      buttonColor: DarkColors.basic,
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: DarkColors.important,
      backgroundColor: DarkColors.basic,
    ),
  );
}
