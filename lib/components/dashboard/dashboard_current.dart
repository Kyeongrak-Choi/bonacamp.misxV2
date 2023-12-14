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
                      padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 20),
                      child: Text(
                        'title_current'.tr,
                        textAlign: TextAlign.center,
                        style: context.textTheme.displayLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                    child: IconTitleFieldDash(
                      titleName: '매  출'.tr,
                      value: controller.controllerCurrentModel != null ? numberFormat.format(controller.controllerCurrentModel.salesAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                    child: IconTitleFieldDash(
                      titleName: '매  입'.tr,
                      value: controller.controllerCurrentModel != null ? numberFormat.format(controller.controllerCurrentModel.purchaseAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                    child: IconTitleFieldDash(
                      titleName: '회  수'.tr,
                      value: controller.controllerCurrentModel != null ? numberFormat.format(controller.controllerCurrentModel.depositCollect) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                    child: IconTitleFieldDash(
                      titleName: '입  금'.tr,
                      value: controller.controllerCurrentModel != null ? numberFormat.format(controller.controllerCurrentModel.depositAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 20),
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
