import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/menu/card_title_menu.dart';
import '../../utils/menu_manager.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.cardColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                //   child: CardTitleMenuList(menuTitleName: "공통 팝업(추후 삭제)", iconMenuList: commonModulesMaster),
                // ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  child: CardTitleMenuList(menuTitleName: 'menu_main_managemnent'.tr, iconMenuList: managementAnalysisMaster),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  child: CardTitleMenuList(menuTitleName: 'menu_main_sales'.tr, iconMenuList: salesAnalysisMaster),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  child: CardTitleMenuList(menuTitleName: 'menu_main_purchase'.tr, iconMenuList: purchaseAnalysisMaster),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  child: CardTitleMenuList(menuTitleName: 'menu_main_rental'.tr, iconMenuList: supportStatusMaster),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  child: CardTitleMenuList(menuTitleName: 'menu_main_location'.tr, iconMenuList: locationSearchMaster),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  child: CardTitleMenuList(menuTitleName: 'menu_main_asset'.tr, iconMenuList: inventoryAnalysisMaster),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
