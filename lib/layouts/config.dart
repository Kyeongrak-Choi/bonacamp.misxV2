import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/menu/card_icon_menu.dart';
import '../components/menu/menu_manager.dart';
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
