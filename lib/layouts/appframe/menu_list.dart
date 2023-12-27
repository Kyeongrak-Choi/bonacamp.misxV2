import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/menu/card_title_menu.dart';
import '../../utils/menu_manager.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: CardTitleMenuList(menuTitleName: 'menu_main_managemnent'.tr, iconMenuList: managementAnalysisMaster),
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: CardTitleMenuList(menuTitleName: 'menu_main_sales'.tr, iconMenuList: salesAnalysisMaster),
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: CardTitleMenuList(menuTitleName: 'menu_main_purchase'.tr, iconMenuList: purchaseAnalysisMaster),
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: CardTitleMenuList(menuTitleName: 'menu_main_support'.tr, iconMenuList: supportStatusMaster),
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: CardTitleMenuList(menuTitleName: 'menu_main_location'.tr, iconMenuList: locationSearchMaster),
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                  child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: CardTitleMenuList(menuTitleName: 'menu_main_asset'.tr, iconMenuList: inventoryAnalysisMaster),
                      )),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
