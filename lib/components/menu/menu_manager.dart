import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class IconMenu {
  String title;
  IconData iconData;

  IconMenu({required this.title, required this.iconData});
}

class RadioMenu {
  String title;
  bool val;

  RadioMenu({
    required this.title,
    required this.val,
  });
}

// 영업관리 메뉴
final List<IconMenu> salesMenu = [
  IconMenu(title: '종합현황', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '영업일보', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '영업사원별 기여현황', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '매출처별 기여현황', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '판매분류별 현황', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '매출순위현황', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '분석그래프', iconData: FontAwesomeIcons.signal),
];

// 매입관리 메뉴
final List<IconMenu> purchaseMenu = [
  IconMenu(title: '매입현황', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '매입원장', iconData: FontAwesomeIcons.signal),
];

// 지원관리 메뉴
final List<IconMenu> supportMenu = [
  IconMenu(title: '대여금 현황', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '대여자산현황', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '대여자산현황(이력)', iconData: FontAwesomeIcons.signal),
];

// 재고관리 메뉴
final List<IconMenu> stockMenu = [
  IconMenu(title: '재고 현황', iconData: FontAwesomeIcons.signal),
  IconMenu(title: '재고수불현황', iconData: FontAwesomeIcons.signal),
];

// 시스템 설정 메뉴
final List<RadioMenu> systemConfig = [
  RadioMenu(title: 'dark_mode'.tr, val: false),
];

// 메뉴 설정 메뉴
final List<RadioMenu> menuConfig = [
  RadioMenu(title: '거래처 검색 시 거래처명 우선 선택', val: true),
  RadioMenu(title: '거래처 필터링 사용', val: true),
  RadioMenu(title: '초성검색시 첫글자부터 비교', val: false),
  RadioMenu(title: '품목검색시 품목명 우선 선택', val: true),
  RadioMenu(title: '영업사원 선택시 관리사원 포함', val: false),
];
