import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import 'dashboard_item.dart';

class DashBoardWithdraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardController());
    return GetBuilder<DashBoardController>(builder: (DashBoardController controller) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(10),
                      child: Text(
                        'title_withdraw'.tr,
                        textAlign: TextAlign.start,
                        style: context.textTheme.displayLarge,
                      ),
                    ),
                  ),
                  // dummy
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: DashBoardItem(
                        '신규대여수량계', controller.controllerAssetModel != null ? numberFormat.format(controller.controllerAssetModel.totQty) : ''),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: DashBoardItem(
                        '신규대여금액계', controller.controllerAssetModel != null ? numberFormat.format(controller.controllerAssetModel.totAmt) : ''),
                  ),
                ],
              )),
        ],
      );
    });
  }
}