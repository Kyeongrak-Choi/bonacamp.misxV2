import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import '../common/field/icon_title_field.dart';
import '../common/field/icon_title_field_dash.dart';

class DashBoardCurrent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardController());
    return GetBuilder<DashBoardController>(builder: (DashBoardController controller) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 60 * 4,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                    child: IconTitleFieldDash(
                      titleName: '매출'.tr,
                      value: controller.controllerCurrentModel != null ? numberFormat.format(controller.controllerCurrentModel.salesAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: IconTitleFieldDash(
                      titleName: '매입'.tr,
                      value: controller.controllerCurrentModel != null ? numberFormat.format(controller.controllerCurrentModel.purchaseAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: IconTitleFieldDash(
                      titleName: '회수'.tr,
                      value: controller.controllerCurrentModel != null ? numberFormat.format(controller.controllerCurrentModel.depositCollect) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: IconTitleFieldDash(
                      titleName: '입금'.tr,
                      value: controller.controllerCurrentModel != null ? numberFormat.format(controller.controllerCurrentModel.depositAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                  //   child: IconTitleFieldDash(
                  //     titleName: '채  권'.tr,
                  //     value: controller.controllerCurrentModel != null ? numberFormat.format(controller.controllerCurrentModel.depositBalance) : '0',
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
