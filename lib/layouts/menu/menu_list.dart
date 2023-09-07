import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/dashboard/dashboard_admob.dart';
import '../../components/menu/card_title_menu.dart';
import '../../utils/menu_manager.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(  // 어떤 항목을 넣을지 몰라 일단 홈과 같이 광고로 채웠습니다. 추후 필요 항목으로 변경 예정.
              padding: EdgeInsetsDirectional.all(5),
              child: DashBoardAdmob(), // 광고
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                    child: CardTitleMenuList(menuTitleName: "공통", iconMenuList: commonModulesMaster),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                    child: CardTitleMenuList(menuTitleName: "경영분석", iconMenuList: managementAnalysisMaster),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                    child: CardTitleMenuList(menuTitleName: "영업분석", iconMenuList: salesAnalysisMaster),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                    child: CardTitleMenuList(menuTitleName: "매입분석", iconMenuList: purchaseAnalysisMaster),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                    child: CardTitleMenuList(menuTitleName: "지원현황", iconMenuList: supportStatusMaster),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                    child: CardTitleMenuList(menuTitleName: "위치조회", iconMenuList: locationSearchMaster),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                    child: CardTitleMenuList(menuTitleName: "재고분석", iconMenuList: inventoryAnalysisMaster),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
