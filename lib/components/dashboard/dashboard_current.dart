import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import '../common/field/icon_title_field_dash.dart';

class DashBoardCurrent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardController());
    return GetBuilder<DashBoardController>(
        builder: (DashBoardController controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING * 2.h, 0.w, BASIC_PADDING.h),
            child: IconTitleFieldDash(
              titleName: 'dashboard_sales'.tr,
              value: controller.controllerCurrentModel != null
                  ? numberFormat
                      .format(controller.controllerCurrentModel.salesAmount)
                  : '0',
              iconData: Icons.label_outlined,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: IconTitleFieldDash(
              titleName: 'dashboard_purchase'.tr,
              value: controller.controllerCurrentModel != null
                  ? numberFormat
                      .format(controller.controllerCurrentModel.purchaseAmount)
                  : '0',
              iconData: Icons.label_outlined,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: IconTitleFieldDash(
              titleName: 'dashboard_collect'.tr,
              value: controller.controllerCurrentModel != null
                  ? numberFormat
                      .format(controller.controllerCurrentModel.depositCollect)
                  : '0',
              iconData: Icons.label_outlined,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: IconTitleFieldDash(
              titleName: 'dashboard_deposit'.tr,
              value: controller.controllerCurrentModel != null
                  ? numberFormat
                      .format(controller.controllerCurrentModel.depositAmount)
                  : '0',
              iconData: Icons.label_outlined,
            ),
          ),
        ],
      );
    });
  }
}
