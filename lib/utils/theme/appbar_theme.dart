import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

AppBarTheme appBarThemeLight() {
  return AppBarTheme(
    shadowColor: LightColors.backgroundColor,
    elevation: 5.0,
    centerTitle: true,
    backgroundColor: LightColors.canvasColor,
    titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: LightColors.font100),
    iconTheme: const IconThemeData(
      color: LightColors.iconColor,
    ),
  );
}

AppBarTheme appBarThemeDark() {
  return AppBarTheme(
    shadowColor: DarkColors.backgroundColor,
    elevation: 5.0,
    centerTitle: true,
    backgroundColor: DarkColors.canvasColor,
    titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: DarkColors.font100),
    iconTheme: const IconThemeData(
      color: DarkColors.iconColor,
    ),
  );
}
