import 'package:flutter/material.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import 'color_manager.dart';

AppBarTheme appBarThemeLight() {
  return AppBarTheme(centerTitle: false, color: LightColors.basic, elevation: 0.0, titleTextStyle: textThemeLight().displayMedium);
}

AppBarTheme appBarThemeDark() {
  return AppBarTheme(centerTitle: false, color: DarkColors.basic, elevation: 0.0, titleTextStyle: textThemeDark().displayMedium);
}
