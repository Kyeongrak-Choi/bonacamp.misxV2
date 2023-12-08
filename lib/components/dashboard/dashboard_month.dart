import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import '../common/field/icon_title_field.dart';

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
                        'title_month'.tr,
                        textAlign: TextAlign.center,
                        style: context.textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  // dummy
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: IconTitleField(
                      titleName: '매 출'.tr,
                      value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.salesAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: IconTitleField(
                      titleName: '매 입'.tr,
                      value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.purchaseAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: IconTitleField(
                      titleName: '회 수'.tr,
                      value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.depositCollect) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: IconTitleField(
                      titleName: '입 금'.tr,
                      value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.depositAmount) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 20),
                    child: IconTitleField(
                      titleName: '채 권'.tr,
                      value: controller.controllerMonthModel != null ? numberFormat.format(controller.controllerMonthModel.depositBalance) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                ],
              )),
        ],
      );
    });
  }
}
