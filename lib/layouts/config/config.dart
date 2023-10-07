import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/menu/card_icon_menu.dart';
import 'package:misxV2/utils/database/hive_manager.dart';

import '../../models/system/userinfo.dart';
import '../../utils/constants.dart';
import '../../utils/menu_manager.dart';
import '../../utils/utility.dart';
import '../appframe/navigation.dart';

// 더보기 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionController());
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(40, 40, 40, 40),
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: context.theme.cardColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Obx(
                  () => Column(children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Text(
                        '${Get.find<OptionController>().clientNm.value} ${Get.find<OptionController>().businessNo.value}',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: context.theme.primaryColor, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Text(
                        '${Get.find<OptionController>().userId.value} (${Get.find<OptionController>().userNm.value})',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: context.theme.primaryColor, fontSize: 14),
                      ),
                    ),
                  ]),
                )),
          ),
          // Padding(
          //   padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          //   child: CardIconMenu(iconMenuList: noticeMaster),
          // ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Column(
                  children: [
                    CardIconMenu(iconMenuList: systemMaster),
                    CardIconMenu(iconMenuList: menuMaster),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionController extends GetxController {
  RxString clientNm = ''.obs;
  RxString businessNo = ''.obs;
  RxString userId = ''.obs;
  RxString userNm = ''.obs;

  RxBool isDark = getHiveBool(Hive.box(LOCAL_DB).get(KEY_THEME_MODE, defaultValue: GetSystemMode())).obs; // 다크모드
  RxBool isCustomFilter = getHiveBool(Hive.box(LOCAL_DB).get(KEY_CUSTOM_FILTER, defaultValue: false)).obs; // 거래처 필터링 사용
  RxBool isIncludeSalChrgCd = getHiveBool(Hive.box(LOCAL_DB).get(KEY_INCLUDE_SALCHRG, defaultValue: true)).obs; // 영업사원 선택시 관리사원 포함
  RxBool isCompareFirst = getHiveBool(Hive.box(LOCAL_DB).get(KEY_COMPARE_FIRST, defaultValue: false)).obs; // 초성검색시 첫글자부터 비교

  @override
  void onInit() {
    super.onInit();
    setUserinfo();
  }

  Future<void> setUserinfo() async {
    await Hive.openBox(
      LOCAL_DB,
    );
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO);

    clientNm.value = user.getClientName;
    businessNo.value = convertBusinessNo(user.getBusinessNo.toString());
    userId.value = user.getUserId.toString();
    userNm.value = user.getUserName.toString();
  }

  Future<void> changeTheme(bool val) async {
    Get.put(NavigationController());
    isDark.value = val;

    await Hive.box(LOCAL_DB).put(KEY_THEME_MODE, val);
    Get.changeThemeMode(Hive.box(LOCAL_DB).get(KEY_THEME_MODE) ? ThemeMode.dark : ThemeMode.light);

    Get.find<NavigationController>().changeIndex();
  }

  Future<void> changeOption(String id, bool val) async {
    switch (id) {
      case KEY_CUSTOM_FILTER:
        isCustomFilter.value = val;
        break;
      case KEY_INCLUDE_SALCHRG:
        isIncludeSalChrgCd.value = val;
        break;
      case KEY_COMPARE_FIRST:
        isCompareFirst.value = val;
        break;
    }
    await Hive.box(LOCAL_DB).put(id, val);
  }
}
