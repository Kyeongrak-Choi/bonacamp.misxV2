import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import '../common/field/icon_title_field.dart';
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
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: IconTitleField(
                      titleName: '출금계'.tr,
                      value: controller.controllerWithdrawModel != null ? numberFormat.format(controller.controllerWithdrawModel.outTot) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 20),
                    child: IconTitleField(
                      titleName: '채무계'.tr,
                      value: controller.controllerWithdrawModel != null ? numberFormat.format(controller.controllerWithdrawModel.amt) : '0',
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
