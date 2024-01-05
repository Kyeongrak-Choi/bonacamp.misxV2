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
      ),
      body: Container(
        color: context.theme.hoverColor,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                child: CardRadioMenu(radioMenu: systemDetail),
              )
            ],
          ),
        ),
      ),
    );
  }
}
