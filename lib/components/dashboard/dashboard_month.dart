import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import '../common/field/icon_title_field_dash.dart';

class DashBoardMonth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardController());
    return GetBuilder<DashBoardController>(builder: (DashBoardController controller) {
      return Column(
        //mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
            child: IconTitleFieldDash(
              titleName: '매출'.tr,
              value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.salesAmount) : '0',
              iconData: Icons.label_outlined,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
            child: IconTitleFieldDash(
              titleName: '매입'.tr,
              value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.purchaseAmount) : '0',
              iconData: Icons.label_outlined,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
            child: IconTitleFieldDash(
              titleName: '회수'.tr,
              value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.depositCollect) : '0',
              iconData: Icons.label_outlined,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
            child: IconTitleFieldDash(
              titleName: '입금'.tr,
              value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.depositAmount) : '0',
              iconData: Icons.label_outlined,
            ),
          ),
        ],
      );
    });
  }
}
