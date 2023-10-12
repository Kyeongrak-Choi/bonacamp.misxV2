import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/utility.dart';

import '../../layouts/appframe/dashboard.dart';
import 'dashboard_item.dart';

class DashBoardRental extends StatelessWidget {
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
                        'title_rental'.tr,
                        textAlign: TextAlign.start,
                        style: context.textTheme.displayLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: DashBoardItem(
                        '대여금계', controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.lendAmt) : ''),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: DashBoardItem('회수예정금계',
                        controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.inspayLendAmt) : ''),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: DashBoardItem(
                        '회수금계', controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.retrvAmt) : ''),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: DashBoardItem(
                        '미회수금계', controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.remAmt) : ''),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: DashBoardItem(
                        '대여금잔액계', controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.totAmt) : ''),
                  ),
                ],
              )),
        ],
      );
    });
  }
}
