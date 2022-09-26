import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/menu/card_icon_menu.dart';
import 'package:misxV2/utils/database/hive_manager.dart';

import '../../components/menu/menu_manager.dart';
import '../../utils/constants.dart';

// 더보기 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Color(CommonColor),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
              child: Column(children: [
                Text(
                  '보나캠프(주)',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color(DarkColor)),
                ),
                Text(
                  '개발자',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color(DarkColor)),
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
            child: CardIconMenu(iconMenuList: systemMaster),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
            child: CardIconMenu(iconMenuList: menuMaster),
          ),
        ],
      ),
    );
  }
}

class OptionController extends GetxController {
  RxBool isDark = getHiveBool(Hive.box('SYSTEM').get('isDark')).obs; // 다크모드
  RxBool isCustomFilter =
      getHiveBool(Hive.box('SYSTEM').get('isCustomFilter', defaultValue: false))
          .obs; // 거래처 필터링 사용
  RxBool isIncludeSalChrgCd = getHiveBool(
          Hive.box('SYSTEM').get('isIncludeSalChrgCd', defaultValue: true))
      .obs; // 영업사원 선택시 관리사원 포함
  RxBool isCompareFirst =
      getHiveBool(Hive.box('SYSTEM').get('isCompareFirst', defaultValue: false))
          .obs; // 초성검색시 첫글자부터 비교

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> changeTheme(bool val) async {
    isDark.value = val;
    await Hive.box('SYSTEM').put('isDark', val);
    Get.changeThemeMode(
        Hive.box('SYSTEM').get('isDark') ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> changeOption(String id, bool val) async {
    switch (id) {
      case 'isCustomFilter':
        isCustomFilter.value = val;
        break;
      case 'isIncludeSalChrgCd':
        isIncludeSalChrgCd.value = val;
        break;
      case 'isCompareFirst':
        isCompareFirst.value = val;
        break;
    }
    await Hive.box('SYSTEM').put(id, val);
  }
}
