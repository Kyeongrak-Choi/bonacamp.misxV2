import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/menu/card_icon_menu.dart';
import 'package:misxV2/components/menu/card_radio_menu.dart';
import '../../components/common/dialog/logout_check.dart';
import '../../components/menu/menu_manager.dart';
import '../../utils/constants.dart';

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
  var optionBox = Hive.box('Option');
  var opt1; // 거래처 검색 시 거래처명 우선 선택
  var opt2; // 거래처 필터링 사용
  var opt3; // 초성검색시 첫글자부터 비교
  var opt4; // 품목검색시 품목명 우선 선택
  var opt5; // 영업사원 선택시 관리사원 포함

  @override
  void onInit() {
    super.onInit();
    opt1 = RxBool(optionBox.get('opt1', defaultValue: false));
    opt2 = RxBool(optionBox.get('opt2', defaultValue: false));
    opt3 = RxBool(optionBox.get('opt3', defaultValue: false));
    opt4 = RxBool(optionBox.get('opt4', defaultValue: false));
    opt5 = RxBool(optionBox.get('opt5', defaultValue: false));
  }

  Future<void> changeOption(String id,bool val) async {
    switch (id) {
      case 'opt1' :
        opt1 != opt1;
        opt1 = RxBool(val);
        break;
      case 'opt2' :
        opt2 != opt2;
        opt2 = RxBool(val);
        break;
      case 'opt3' :
        opt3 != opt3;
        opt3 = RxBool(val);
        break;
      case 'opt4' :
        opt4 != opt4;
        opt4 = RxBool(val);
        break;
      case 'opt5' :
        opt5 != opt5;
        opt5 = RxBool(val);
        break;
    }
    await optionBox.put(id,val);
  }

}