import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/menu/card_icon_menu.dart';
import 'package:misxV2/utils/database/hive_manager.dart';

import '../../components/menu/menu_manager.dart';
import '../../models/localDB/userinfo.dart';
import '../../utils/constants.dart';
import '../../utils/utility.dart';

// 더보기 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionController());
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Color(COMMON_COLOR),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0))),
                child: Obx(
                  () => Column(children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Text(
                        '${Get.find<OptionController>().clientNm.value} ${Get.find<OptionController>().businessNo.value}',
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Color(DARK_COLOR), fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Text(
                        '${Get.find<OptionController>().userId.value} (${Get.find<OptionController>().userNm.value})',
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(color: Color(DARK_COLOR), fontSize: 14),
                      ),
                    ),
                  ]),
                )),
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
  RxString clientNm = ''.obs;
  RxString businessNo = ''.obs;
  RxString userId = ''.obs;
  RxString userNm = ''.obs;

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
    setUserinfo();
  }

  Future<void> setUserinfo() async {
    await Hive.openBox(
      'USER_INFO',
    );
    UserinfoModel user = Hive.box('USER_INFO').get('user').elementAt(0);

    clientNm.value = user.clientNm;
    businessNo.value = convertBusinessNo(user.businessNo.toString());
    userId.value = user.userId.toString();
    userNm.value = user.userNm.toString();
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
