import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/menu/card_radio_menu.dart';

import '../../components/common/combobox/config.dart';
import '../../utils/menu_manager.dart';

// Menu Config Setting
class MenuConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionController());
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
