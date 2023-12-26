import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import '../common/field/icon_title_field.dart';
import '../common/field/icon_title_field_dash.dart';

class DashBoardMonth extends StatelessWidget {
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
                //borderRadius: BorderRadius.circular(20),
                //shape: BoxShape.rectangle,
                border: Border(
                  top: BorderSide(color: Colors.grey.withOpacity(0.3)),
                ),
              ),
              child: Column(
                children: [
                  // Align(
                  //   alignment: AlignmentDirectional(-1, 0),
                  //   child: Padding(
                  //     padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 20),
                  //     child: Text(
                  //       'title_month'.tr,
                  //       textAlign: TextAlign.center,
                  //       style: context.textTheme.displayLarge,
                  //     ),
                  //   ),
                  // ),
                  // dummy
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: IconTitleFieldDash(
                      titleName: '매출'.tr,
                      value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.salesAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: IconTitleFieldDash(
                      titleName: '매입'.tr,
                      value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.purchaseAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: IconTitleFieldDash(
                      titleName: '회수'.tr,
                      value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.depositCollect) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: IconTitleFieldDash(
                      titleName: '입금'.tr,
                      value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.depositAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 20),
                  //   child: IconTitleFieldDash(
                  //     titleName: '채권'.tr,
                  //     value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.depositBalance) : '0',
                  //     iconData: Icons.label_outlined,
                  //   ),
                  // ),
                ],
              )),
        ],
      );
    });
  }
}
