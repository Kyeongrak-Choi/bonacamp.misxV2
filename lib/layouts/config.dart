import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/menu/card_radio_menu.dart';
import '../components/common/dialog/logout_check.dart';
import '../components/menu/menu_manager.dart';
import '../utils/constants.dart';

// 설정 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      // appBar: AppBar(
      //   title: Text(
      //     'config'.tr,
      //     style: context.textTheme.headline3,
      //   ),
      //   backgroundColor: context.theme.backgroundColor,
      //   iconTheme: context.theme.iconTheme,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.logout),
      //       color: context.theme.primaryColor,
      //       onPressed: () => LogoutCheckDialog(context),
      //     ),
      //   ],
      // ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(children: [
                Text(
                  '보나캠프(주)',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '개발자',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                ),
              ]),
            ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
            child: Text(
              textAlign: TextAlign.left,
              'system_setting'.tr,
              style: context.textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
            child: CardRadioMenu(radioMenu: systemConfig),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
            child: Text(
              'menu_setting'.tr,
              style: context.textTheme.subtitle1,
            ),
          ),
          // Padding(
          //     padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
          //     child: CardRadioMenu(radioMenu: menuConfig)),
        ],
      ),
    );
  }
}
