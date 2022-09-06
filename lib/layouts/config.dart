import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/menu/menu_manager.dart';
import '../components/common/menu/card_icon_menu.dart';
import '../constants.dart';

// 설정 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColor),
      appBar: AppBar(
        title: Text('config'.tr),
      ),
      body: ListView(
        children: <Widget>[
          CardIconMenu(iconMenuList: configMenu),
        ],
      ),
    );
  }
}
