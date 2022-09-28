import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../utils/constants.dart';
import '../../utils/utility.dart';

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
final List<IconMenu> systemMaster = [
  IconMenu(
      title: 'system_setting'.tr,
      iconData: Icons.settings,
      path: '/systemConfig'),
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
  IconMenu(
      title: 'menu_setting'.tr,
      iconData: Icons.copy_outlined,
      path: '/menuConfig'),
];

// menu setting detail
final List<RadioMenu> menuDetail = [
  RadioMenu(
    id: KEY_CUSTOM_FILTER,
    title: 'isCustomFilter'.tr,
    val: Hive.box(LOCAL_DB).get(KEY_CUSTOM_FILTER, defaultValue: false),
  ),
  RadioMenu(
    id: KEY_INCLUDE_SALCHRG,
    title: 'isIncludeSalChrgCd'.tr,
    val: Hive.box(LOCAL_DB).get(KEY_INCLUDE_SALCHRG, defaultValue: true),
  ),
  RadioMenu(
    id: KEY_COMPARE_FIRST,
    title: KEY_COMPARE_FIRST.tr,
    val: Hive.box(LOCAL_DB).get(KEY_COMPARE_FIRST, defaultValue: false),
  ),
];
