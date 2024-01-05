import 'package:flutter/material.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import 'color_manager.dart';

AppBarTheme appBarThemeLight() {
  return AppBarTheme(
    centerTitle: true,
    //color: LightColors.basic,
    backgroundColor: LightColors.defaultColor,
    elevation: 0.5,
    titleTextStyle: textThemeLight().displayLarge,
    iconTheme: const IconThemeData(
      color: LightColors.font,
    ),
  );
}

AppBarTheme appBarThemeDark() {
  return AppBarTheme(
    centerTitle: true,
    //color: DarkColors.basic,
    backgroundColor: DarkColors.defaultColor,
    elevation: 0.5,
    titleTextStyle: textThemeDark().displayLarge,
    iconTheme: const IconThemeData(
      color: DarkColors.font,
    ),
  );
}
