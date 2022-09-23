import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/menu/card_icon_menu.dart';
import '../../components/menu/menu_manager.dart';
import '../../utils/constants.dart';

// 더보기 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Color(AppColor),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
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
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
            child: CardIconMenu(iconMenuList: systemMaster),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
            child: CardIconMenu(iconMenuList: menuMaster),
          ),
        ],
      ),
    );
  }
}
