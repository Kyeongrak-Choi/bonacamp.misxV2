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
    id: 'darkmode',
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
    id: 'opt1',
    title: '거래처 검색 시 거래처명 우선 선택',
    val: Hive.box('OPTION').get('opt1', defaultValue: false),
  ),
  RadioMenu(
    id: 'opt2',
    title: '거래처 필터링 사용',
    val: Hive.box('OPTION').get('opt2', defaultValue: false),
  ),
  RadioMenu(
    id: 'opt3',
    title: '초성검색시 첫글자부터 비교',
    val: Hive.box('OPTION').get('opt3', defaultValue: false),
  ),
  RadioMenu(
    id: 'opt4',
    title: '품목검색시 품목명 우선 선택',
    val: Hive.box('OPTION').get('opt4', defaultValue: false),
  ),
  RadioMenu(
    id: 'opt5',
    title: '영업사원 선택시 관리사원 포함',
    val: Hive.box('OPTION').get('opt5', defaultValue: false),
  ),
];
