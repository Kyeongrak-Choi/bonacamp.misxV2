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
        titleTextStyle: context.textTheme.displayLarge,
        backgroundColor: context.theme.canvasColor,
        iconTheme: context.theme.iconTheme,
      ),
      body: Container(
        color: context.theme.canvasColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                    child: CardRadioMenu(radioMenu: systemDetail),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
