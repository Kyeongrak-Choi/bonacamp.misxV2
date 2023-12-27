import 'package:flutter/material.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import 'color_manager.dart';

AppBarTheme appBarThemeLight() {
  return AppBarTheme(
    centerTitle: false,
    //color: LightColors.basic,
    backgroundColor: LightColors.background,
    elevation: 0.0,
    titleTextStyle: textThemeLight().displayLarge,
    iconTheme: const IconThemeData(
      color: DarkColors.basic,
    ),
  );
}

AppBarTheme appBarThemeDark() {
  return AppBarTheme(
    centerTitle: false,
    //color: DarkColors.basic,
    backgroundColor: DarkColors.background,
    elevation: 0.0,
    titleTextStyle: textThemeDark().displayLarge,
    iconTheme: const IconThemeData(
      color: LightColors.basic,
    ),
  );
}
