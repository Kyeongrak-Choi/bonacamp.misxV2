import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/menu/card_radio_menu.dart';

import '../../utils/menu_manager.dart';
import 'config.dart';

// Menu Config Setting
class MenuConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionController());
    return Scaffold(
      appBar: AppBar(
        title: Text('menu_setting'.tr),
      ),
      body: Container(
        color: context.theme.hoverColor,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                child: CardRadioMenu(radioMenu: menuDetail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
