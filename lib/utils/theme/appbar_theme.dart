import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import '../constants.dart';

AppBarTheme appBarThemeLight() {
  return AppBarTheme(
      centerTitle: false,
      color: Colors.white,
      elevation: 0.0,
      titleTextStyle: textThemeLight().headline3);
}

AppBarTheme appBarThemeDark() {
  return AppBarTheme(
      centerTitle: false,
      color: Color(DARK_COLOR),
      elevation: 0.0,
      titleTextStyle: textThemeDark().headline3);
}
