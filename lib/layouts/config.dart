import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/menu/card_radio_menu.dart';
import 'package:renew_misx/utils/theme/text_theme.dart';
import '../components/menu/menu_manager.dart';
import '../utils/constants.dart';

// 설정 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        title: Text('config'.tr),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: Text(
              'system_setting'.tr,
              style: textThemeLight().headline3,
            ),
          ),
          CardRadioMenu(radioMenu: systemConfig),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: Text(
              'menu_setting'.tr,
              style: textThemeLight().headline3,
            ),
          ),
          CardRadioMenu(radioMenu: menuConfig),
        ],
      ),
    );
  }
}
