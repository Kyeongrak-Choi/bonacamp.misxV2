import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/menu/card_radio_menu.dart';

import '../../utils/menu_manager.dart';

// System Config Setting
class SystemConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('system_setting'.tr),
        backgroundColor: context.theme.cardColor,
        iconTheme: context.theme.iconTheme,
      ),
      backgroundColor: context.theme.cardColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
            child: CardRadioMenu(radioMenu: systemDetail),
          ),
        ],
      ),
    );
  }
}
