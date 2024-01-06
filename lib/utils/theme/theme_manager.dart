import 'package:flutter/material.dart';
import 'package:misxV2/utils/theme/color_manager.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import 'appbar_theme.dart';

/*
      canvasColor: canvasColor ?? this.canvasColor,
      cardColor: cardColor ?? this.cardColor,
      colorScheme: (colorScheme ?? this.colorScheme).copyWith(brightness: brightness),
      dialogBackgroundColor: dialogBackgroundColor ?? this.dialogBackgroundColor,
      disabledColor: disabledColor ?? this.disabledColor,
      dividerColor: dividerColor ?? this.dividerColor,
      focusColor: focusColor ?? this.focusColor,
      highlightColor: highlightColor ?? this.highlightColor,
      hintColor: hintColor ?? this.hintColor,
      hoverColor: hoverColor ?? this.hoverColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColorDark: primaryColorDark ?? this.primaryColorDark,
      primaryColorLight: primaryColorLight ?? this.primaryColorLight,
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      secondaryHeaderColor: secondaryHeaderColor ?? this.secondaryHeaderColor,
      shadowColor: shadowColor ?? this.shadowColor,
      splashColor: splashColor ?? this.splashColor,
      unselectedWidgetColor: unselectedWidgetColor ?? this.unselectedWidgetColor,
*/

class Themes {
  static final light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: LightColors.primaryColor,
    primaryColorLight: LightColors.primaryColorLight,
    primaryColorDark: DarkColors.primaryColorDark,
    canvasColor: LightColors.canvasColor,
    shadowColor: LightColors.shadowColor,
    focusColor: LightColors.focusColor,
    hoverColor: LightColors.hoverColor,
    cardColor: LightColors.basic,

    appBarTheme: appBarThemeLight(),
    iconTheme: const IconThemeData(
      color: LightColors.iconColor,
    ),
    textTheme: textThemeLight(),
    buttonTheme: const ButtonThemeData(
      buttonColor: LightColors.basic,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: LightColors.backgroundColor,
      error: CommonColors.red,
      onPrimary: LightColors.font100, // font100
      onSecondary: LightColors.font80, // font80
      onSurface: LightColors.font60, // font60
      onSurfaceVariant: LightColors.font40, // font40
      onBackground: LightColors.font20, // font20
      surface: LightColors.textform, // login textForm

      primary: LightColors.primaryColor, // point color1
      primaryContainer: LightColors.primaryColor, // point color2
      secondary: LightColors.primaryColor, // point color3
      outline: LightColors.primaryColor, // card line or divider
      surfaceVariant: LightColors.primaryColor, // disabled
      tertiary: CommonColors.yellow, // normal
      tertiaryContainer: CommonColors.green, // safe
      onError: LightColors.basic, //no use
    ),
    // navigationBarTheme: const NavigationBarThemeData(
    //   indicatorColor: LightColors.important,
    //   backgroundColor: LightColors.basic,
    // ),
  );

  static final dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: DarkColors.primaryColor,
    primaryColorLight: DarkColors.primaryColorLight,
    primaryColorDark: DarkColors.primaryColorDark,
    canvasColor: DarkColors.canvasColor,
    shadowColor: DarkColors.shadowColor,
    focusColor: DarkColors.focusColor,
    hoverColor: DarkColors.hoverColor,
    cardColor: DarkColors.cardColor,

    appBarTheme: appBarThemeDark(),
    iconTheme: const IconThemeData(
      color: DarkColors.iconColor,
    ),
    textTheme: textThemeDark(),
    buttonTheme: const ButtonThemeData(
      buttonColor: DarkColors.basic,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: DarkColors.backgroundColor,
      error: CommonColors.red,
      onPrimary: DarkColors.font100, // font100
      onSecondary: DarkColors.font80, // font80
      onSurface: DarkColors.font60, // font60
      onSurfaceVariant: DarkColors.font40, // font40
      onBackground: DarkColors.font20, // font20
      surface: DarkColors.textform, // login textForm

      primary: DarkColors.primaryColor, // point color1
      primaryContainer: DarkColors.primaryColor, // point color2
      secondary: DarkColors.primaryColor, // point color3
      outline: DarkColors.primaryColor, // card line or divider
      surfaceVariant: DarkColors.primaryColor, // disabled
      tertiary: CommonColors.yellow, // normal
      tertiaryContainer: CommonColors.green, // safe
      onError: DarkColors.basic, //no use
    ),
    // navigationBarTheme: const NavigationBarThemeData(
    //   indicatorColor: DarkColors.important,
    //   backgroundColor: DarkColors.basic,
    // ),
  );
}
