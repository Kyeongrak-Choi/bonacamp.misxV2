import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

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
    id: 'isDark',
    title: 'dark_mode'.tr,
    val: Hive.box('SYSTEM').get('isDark'),
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
    id: 'isCustomFilter',
    title: 'isCustomFilter'.tr,
    val: Hive.box('SYSTEM').get('isCustomFilter', defaultValue: false),
  ),
  RadioMenu(
    id: 'isIncludeSalChrgCd',
    title: 'isIncludeSalChrgCd'.tr,
    val: Hive.box('SYSTEM').get('isIncludeSalChrgCd', defaultValue: false),
  ),
  RadioMenu(
    id: 'isCompareFirst',
    title: 'isCompareFirst'.tr,
    val: Hive.box('SYSTEM').get('isCompareFirst', defaultValue: false),
  ),
];
