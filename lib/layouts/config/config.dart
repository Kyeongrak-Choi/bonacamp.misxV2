import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/menu/card_icon_menu.dart';
import 'package:misxV2/utils/database/hive_manager.dart';

import '../../models/system/userinfo.dart';
import '../../utils/constants.dart';
import '../../utils/menu_manager.dart';
import '../../utils/theme/color_manager.dart';
import '../../utils/utility.dart';
import '../appframe/navigation.dart';

// 더보기 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionController());
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CardIconMenu(iconMenuList: noticeMaster),
                    CardIconMenu(iconMenuList: systemMaster),
                    CardIconMenu(iconMenuList: menuMaster),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              onPressed: () async {
                Get.offAllNamed(ROUTE_LOGIN);
              },
              child: Text('text_logout'.tr),
              style: ElevatedButton.styleFrom(
                foregroundColor: CommonColors.white,
                backgroundColor: CommonColors.signature,
              ))),
    );
  }
}

class OptionController extends GetxController {
  RxString clientNm = ''.obs;
  RxString businessNo = ''.obs;
  RxString userId = ''.obs;
  RxString userNm = ''.obs;

  RxBool isDark = getHiveBool(Hive.box(LOCAL_DB).get(KEY_THEME_MODE, defaultValue: GetSystemMode())).obs; // 다크모드
  RxBool isShowAdmob = getHiveBool(Hive.box(LOCAL_DB).get(KEY_SHOW_ADMOB, defaultValue: true)).obs; // 광고 보기
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
      case KEY_SHOW_ADMOB:
        isShowAdmob.value = val;
        break;
    }
    await Hive.box(LOCAL_DB).put(id, val);
  }
}
