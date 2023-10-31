import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

// notice master
final List<IconMenu> noticeMaster = [
  IconMenu(title: 'notice'.tr, iconData: CupertinoIcons.speaker_2_fill, path: ROUTE_NOTICE),
];

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

/* Icon Reference
 1. cupertino * https://api.flutter.dev/flutter/cupertino/CupertinoIcons-class.html#constants
  - example : iconData: CupertinoIcons.airplane
 2. material * https://fonts.google.com/icons
  - example : iconData: Icons.copy_outlined
 */

// 경영분석
final List<IconMenu> managementAnalysisMaster = [
  IconMenu(title: 'menu_sub_total'.tr, iconData: Icons.assessment, path: ROUTE_MENU_OVERALL_STATUS),
  // 종합현황
  IconMenu(title: 'menu_sub_salesdaily'.tr, iconData: FontAwesomeIcons.calendarCheck, path: ROUTE_MENU_SALES_DAILY),
  // 영업일보
  IconMenu(title: 'menu_sub_salesperson_contribute'.tr, iconData: CupertinoIcons.person_2_fill, path: ROUTE_MENU_SALESPERSON_CONTRIBUTE),
  // 영업사원별 기여현황
  IconMenu(title: 'menu_sub_customer_contribute'.tr, iconData: FontAwesomeIcons.buildingCircleCheck, path: ROUTE_MENU_CONTRIBUTION_STATUS_CUSTOMER),
  // 매출처별 기여현황
  IconMenu(title: 'menu_sub_sales_class_status'.tr, iconData: Icons.inventory_2_outlined, path: ROUTE_MENU_CLASSSTATUS),
  // 판매분류별 현황
  IconMenu(title: 'menu_sub_sales_rank'.tr, iconData: FontAwesomeIcons.medal, path: ROUTE_MENU_RANKSTATUS),
  // 매출순위현황
  IconMenu(title: 'menu_sub_analysis_graph'.tr, iconData: CupertinoIcons.graph_square, path: ROUTE_MENU_GRAPH),
  // 분석 그래프
  IconMenu(title: 'menu_sub_salesdaily_division'.tr, iconData: FontAwesomeIcons.calendar, path: ROUTE_MENU_DIVISIONSTATUS),
  // 영업일보(용도별)
];

// 영업분석
final List<IconMenu> salesAnalysisMaster = [
  IconMenu(title: 'menu_sub_customer_info'.tr, iconData: Icons.store_mall_directory_outlined, path: ROUTE_MENU_CUSTOMER_INFO), // 거래처 현황
  IconMenu(title: 'menu_sub_salesperson_report'.tr, iconData: CupertinoIcons.person_2_fill, path: ROUTE_MENU_SALESPERSON_REPORT), // 영업사원별 매출현황
  IconMenu(title: 'menu_sub_report_monthly'.tr, iconData: Icons.calendar_month, path: ROUTE_MENU_SALESPERSON_REPORT_MONTHLY), // 영업사원별 월별 매출현황
  IconMenu(title: 'menu_sub_sales_status'.tr, iconData: Icons.monetization_on_outlined, path: ROUTE_MENU_CUSTOMER_REPORT), // 매출현황
  IconMenu(title: 'menu_sub_customer_monthly'.tr, iconData: Icons.calendar_month, path: ROUTE_MENU_CUSTOMER_REPORT_MONTHLY), // 월별 매출현황
  IconMenu(title: 'menu_sub_sales_ledger'.tr, iconData: CupertinoIcons.flowchart, path: ROUTE_MENU_SALES_LEDGER), // 매출원장
  IconMenu(title: 'menu_sub_achievement'.tr, iconData: Icons.flag_outlined, path: ROUTE_MENU_ACHIEVEMENT), // 목표대비 실적현황
  IconMenu(title: 'menu_sub_balance_report'.tr, iconData: CupertinoIcons.doc_text, path: ROUTE_MENU_BALANCE_REPORT), // 채권현황
  IconMenu(title: 'menu_sub_balance_rental_report'.tr, iconData: FontAwesomeIcons.peopleArrows, path: ROUTE_MENU_BALANCE_RENTAL_REPORT), // 채권 및 대여 현황
  IconMenu(title: 'title_18'.tr, iconData: Icons.copy_outlined, path: ''), // 매출 및 대여 원장
];

// 매입분석
final List<IconMenu> purchaseAnalysisMaster = [
  IconMenu(title: 'title_19'.tr, iconData: Icons.copy_outlined, path: ''), // 매입현황
  IconMenu(title: 'title_20'.tr, iconData: Icons.copy_outlined, path: ''), // 매입원장
];

// 지원현황
final List<IconMenu> supportStatusMaster = [
  IconMenu(title: 'title_21'.tr, iconData: Icons.copy_outlined, path: ''), // 대여금 현황
  IconMenu(title: 'title_22'.tr, iconData: Icons.copy_outlined, path: ''), // 대여자산 현황
  IconMenu(title: 'title_23'.tr, iconData: Icons.copy_outlined, path: ''), // 대여자산 현황(이력)
];

// 위치조회
final List<IconMenu> locationSearchMaster = [
  IconMenu(title: 'menu_sub_vendor_location'.tr, iconData: Icons.map_rounded, path: ROUTE_MENU_VENDORLOCATION), // 매출처 위치조회
];

// 재고분석
final List<IconMenu> inventoryAnalysisMaster = [
  IconMenu(title: 'title_25'.tr, iconData: Icons.copy_outlined, path: ''), // 재고현황
  IconMenu(title: 'title_26'.tr, iconData: Icons.copy_outlined, path: ''), // 재고수불현황
  IconMenu(title: 'title_27'.tr, iconData: Icons.copy_outlined, path: ''), // 용공수불(창고)
  IconMenu(title: 'title_28'.tr, iconData: Icons.copy_outlined, path: ''), // 용공수불현황(거래처)
  IconMenu(title: 'title_29'.tr, iconData: Icons.copy_outlined, path: ''), // 용공수불현황(영업담당)
];
