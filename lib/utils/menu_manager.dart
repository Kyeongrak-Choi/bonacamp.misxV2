import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../layouts/example/funtion.dart';
import 'constants.dart';
import 'utility.dart';

class IconMenu {
  String title;
  IconData iconData;
  String path;

  IconMenu({required this.title, required this.iconData, required this.path});
}

class RadioMenu {
  String id;
  String title;
  bool val;

  RadioMenu({
    required this.id,
    required this.title,
    required this.val,
  });
}

// system setting master
// final List<IconMenu> noticeMaster = [
//   IconMenu(title: 'notice'.tr, iconData: CupertinoIcons.speaker_2_fill, path: ROUTE_NOTICE),
// ];

// system setting master
final List<IconMenu> systemMaster = [
  IconMenu(title: 'system_setting'.tr, iconData: Icons.settings, path: ROUTE_SYSTEM_CONFIG),
];

// system setting detail
final List<RadioMenu> systemDetail = [
  RadioMenu(
    id: KEY_THEME_MODE,
    title: 'dark_mode'.tr,
    val: Hive.box(LOCAL_DB).get(KEY_THEME_MODE, defaultValue: GetSystemMode()),
  ),
];

// menu setting master
final List<IconMenu> menuMaster = [
  IconMenu(title: 'menu_setting'.tr, iconData: Icons.copy_outlined, path: ROUTE_MENU_CONFIG),
];

// menu setting detail
final List<RadioMenu> menuDetail = [
  RadioMenu(
    id: KEY_CUSTOM_FILTER,
    title: KEY_CUSTOM_FILTER.tr,
    val: Hive.box(LOCAL_DB).get(KEY_CUSTOM_FILTER, defaultValue: false),
  ),
  RadioMenu(
    id: KEY_INCLUDE_SALCHRG,
    title: KEY_INCLUDE_SALCHRG.tr,
    val: Hive.box(LOCAL_DB).get(KEY_INCLUDE_SALCHRG, defaultValue: true),
  ),
  RadioMenu(
    id: KEY_COMPARE_FIRST,
    title: KEY_COMPARE_FIRST.tr,
    val: Hive.box(LOCAL_DB).get(KEY_COMPARE_FIRST, defaultValue: false),
  ),

];

// exam menu master
// final List<IconMenu> examMaster = [
//   IconMenu(title: 'exam_menu'.tr, iconData: Icons.copy_outlined, path: ROUTE_EXAM_MENU),
// ];

// menu setting detail
// final List<IconMenu> examDetail = [
//   UtilFunction();
// ];
