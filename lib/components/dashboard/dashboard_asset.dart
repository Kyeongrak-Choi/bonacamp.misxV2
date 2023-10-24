import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import 'dashboard_item.dart';

class DashBoardAsset extends StatelessWidget {
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
                        'title_asset'.tr,
                        textAlign: TextAlign.start,
                        style: context.textTheme.displayLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 15, 20, 5),
                    child: DashBoardItem(
                        '출금계', controller.controllerWithdrawModel != null ? numberFormat.format(controller.controllerWithdrawModel.outTot) : ''),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 15, 20, 15),
                    child: DashBoardItem(
                        '채무계', controller.controllerWithdrawModel != null ? numberFormat.format(controller.controllerWithdrawModel.amt) : ''),
                  ),
                ],
              )),
        ],
      );
    });
  }
}
