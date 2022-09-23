import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misxV2/utils/theme/text_theme.dart';
import '../constants.dart';

AppBarTheme appBarThemeLight() {
  return AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 0.0,
      titleTextStyle: textThemeLight().headline3);
}

AppBarTheme appBarThemeDark() {
  return AppBarTheme(
      centerTitle: true,
      color: Color(AppColor),
      elevation: 0.0,
      titleTextStyle: textThemeDark().headline3);
}
