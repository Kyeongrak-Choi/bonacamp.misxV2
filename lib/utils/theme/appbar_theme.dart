import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import 'color_manager.dart';

AppBarTheme appBarThemeLight() {
  return AppBarTheme(
    centerTitle: true,
    backgroundColor: LightColors.defaultColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color:  DarkColors.defaultColor),
    iconTheme: const IconThemeData(
      color: DarkColors.defaultColor,
    ),
  );
}

AppBarTheme appBarThemeDark() {
  return AppBarTheme(
    centerTitle: true,
    backgroundColor: DarkColors.defaultColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: LightColors.basic),
    iconTheme: const IconThemeData(
      color: DarkColors.font,
    ),
  );
}
