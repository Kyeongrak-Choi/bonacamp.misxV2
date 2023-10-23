import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import 'dashboard_item.dart';

class DashBoardPurchase extends StatelessWidget {
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
                      padding: EdgeInsetsDirectional.all(20),
                      child: Text(
                        'title_purchase'.tr,
                        textAlign: TextAlign.start,
                        style: context.textTheme.displayLarge,
                      ),
                    ),
                  ),
                  // dummy
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 15, 20, 5),
                    child: DashBoardItem(
                        '매입계', controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.boTotAmt) : ''),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 15, 20, 5),
                    child: DashBoardItem(
                        '공급계', controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.suppAmt) : ''),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 15, 20, 15),
                    child: DashBoardItem(
                        '채무계', controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.grntAmt) : ''),
                  ),
                ],
              )),
        ],
      );
    });
  }
}
