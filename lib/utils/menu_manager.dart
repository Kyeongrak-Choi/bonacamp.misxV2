import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

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

// notice master - step2
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

// menu setting master
final List<IconMenu> commonModulesMaster = [
  IconMenu(title: 'title_search_lenditem'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_LENDITM),
  IconMenu(title: 'title_search_item'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_ITEM),
  IconMenu(title: 'title_search_customer'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_CUSTOMER),
];

final List<IconMenu> managementAnalysisMaster = [
  IconMenu(title: 'title_1'.tr, iconData: Icons.copy_outlined, path: ROUTE_MENU_OVERALL_STATUS),
  IconMenu(title: 'title_2'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_ITEM),
  IconMenu(title: 'title_3'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_CUSTOMER),
  IconMenu(title: 'title_4'.tr, iconData: Icons.copy_outlined, path: ROUTE_MENU_EXAMPLE),
  IconMenu(title: 'title_5'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
  IconMenu(title: 'title_6'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
  IconMenu(title: 'title_7'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
  IconMenu(title: 'title_8'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
];

final List<IconMenu> salesAnalysisMaster = [
  IconMenu(title: 'title_9'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_LENDITM),
  IconMenu(title: 'title_10'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_ITEM),
  IconMenu(title: 'title_11'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_CUSTOMER),
  IconMenu(title: 'title_12'.tr, iconData: Icons.copy_outlined, path: ROUTE_MENU_EXAMPLE),
  IconMenu(title: 'title_13'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
  IconMenu(title: 'title_14'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
  IconMenu(title: 'title_15'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
  IconMenu(title: 'title_16'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
  IconMenu(title: 'title_17'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
  IconMenu(title: 'title_18'.tr, iconData: Icons.copy_outlined, path: ROUTE_API_EXAMPLE),
];

final List<IconMenu> purchaseAnalysisMaster = [
  IconMenu(title: 'title_19'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_LENDITM),
  IconMenu(title: 'title_20'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_ITEM),
];

final List<IconMenu> supportStatusMaster = [
  IconMenu(title: 'title_21'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_LENDITM),
  IconMenu(title: 'title_22'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_ITEM),
  IconMenu(title: 'title_23'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_CUSTOMER),
];

final List<IconMenu> locationSearchMaster = [
  IconMenu(title: 'title_24'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_LENDITM),
];

final List<IconMenu> inventoryAnalysisMaster = [
  IconMenu(title: 'title_25'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_LENDITM),
  IconMenu(title: 'title_26'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_ITEM),
  IconMenu(title: 'title_27'.tr, iconData: Icons.copy_outlined, path: ROUTE_DIALOG_CUSTOMER),
  IconMenu(title: 'title_28'.tr, iconData: Icons.copy_outlined, path: ROUTE_MENU_EXAMPLE),
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
