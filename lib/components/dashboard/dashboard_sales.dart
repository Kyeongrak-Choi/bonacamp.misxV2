import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/dashboard/dashboard_item.dart';

import '../../layouts/dashboard.dart';

class DashBoardSales extends StatelessWidget {
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardController());
    return GetBuilder<DashBoardController>(builder: (DashBoardController controller) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.all(10),
              child: Text(
                'title_sales'.tr,
                textAlign: TextAlign.start,
                style: context.textTheme.headline3,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: context.theme.canvasColor,
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  // dummy
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: DashBoardItem(
                        '매출계', controller.controllerSalesModel != null ? f.format(int.parse(controller.controllerSalesModel.totAmt)) : '0'),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: DashBoardItem(
                        '공급계', controller.controllerSalesModel != null ? f.format(int.parse(controller.controllerSalesModel.suppAmt)) : '0'),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: DashBoardItem(
                        '채권계', controller.controllerSalesModel != null ? f.format(int.parse(controller.controllerSalesModel.grntAmt)) : '0'),
                  ),
                ],
              )),
        ],
      );
    });
  }
}
