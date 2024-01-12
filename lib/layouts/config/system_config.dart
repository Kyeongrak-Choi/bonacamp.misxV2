import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/menu/card_radio_menu.dart';
import 'package:misxV2/utils/constants.dart';

import '../../utils/menu_manager.dart';

// System Config Setting
class SystemConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        title: Text('system_setting'.tr),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w,
                BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
            child: CardRadioMenu(radioMenu: systemDetail),
          )
        ],
      ),
    );
  }
}
