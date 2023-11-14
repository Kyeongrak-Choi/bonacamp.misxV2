import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import '../common/field/icon_title_field.dart';

class DashBoardDeposit extends StatelessWidget {
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
                        'title_deposit'.tr,
                        textAlign: TextAlign.start,
                        style: context.textTheme.displayLarge,
                      ),
                    ),
                  ),
                  // dummy
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: IconTitleField(
                      titleName: '회수계'.tr,
                      value: controller.controllerDepositModel != null ? numberFormat.format(controller.controllerDepositModel.retrvAmt) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: IconTitleField(
                      titleName: '입금계'.tr,
                      value: controller.controllerDepositModel != null ? numberFormat.format(controller.controllerDepositModel.ipTot) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 20),
                    child: IconTitleField(
                      titleName: '채권계'.tr,
                      value: controller.controllerDepositModel != null ? numberFormat.format(controller.controllerDepositModel.amt) : '0',
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
