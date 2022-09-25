import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/menu/card_radio_menu.dart';

import '../../components/menu/menu_manager.dart';

// Menu Config Setting
class MenuConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('menu_setting'.tr),
        backgroundColor: context.theme.backgroundColor,
        iconTheme: context.theme.iconTheme,
      ),
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
            child: CardRadioMenu(radioMenu: menuDetail),
          ),
        ],
      ),
    );
  }
}

class OptionController extends GetxController {
  var isCustomFilter; // 거래처 필터링 사용
  var isCompareFirst; // 초성검색시 첫글자부터 비교
  var isIncludeSalChrgCd; // 영업사원 선택시 관리사원 포함

  @override
  void onInit() {
    super.onInit();
    isCustomFilter = RxBool(Hive.box('SYSTEM').get('isCustomFilter'));
    isCompareFirst = RxBool(Hive.box('SYSTEM').get('isCompareFirst'));
    isIncludeSalChrgCd = RxBool(Hive.box('SYSTEM').get('isIncludeSalChrgCd'));
  }

  Future<void> changeOption(String id, bool val) async {
    switch (id) {
      case 'isCustomFilter':
        isCustomFilter != isCustomFilter;
        isCustomFilter = RxBool(val);
        break;
      case 'isCompareFirst':
        isCompareFirst != isCompareFirst;
        isCompareFirst = RxBool(val);
        break;
      case 'isIncludeSalChrgCd':
        isIncludeSalChrgCd != isIncludeSalChrgCd;
        isIncludeSalChrgCd = RxBool(val);
        break;
    }
    await Hive.box('SYSTEM').put(id, val);
  }
}
