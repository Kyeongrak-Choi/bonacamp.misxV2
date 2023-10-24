import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/appframe/dashboard.dart';
import '../../utils/utility.dart';
import '../common/field/icon_title_field.dart';
import 'dashboard_item.dart';

class DashBoardWithdraw extends StatelessWidget {
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
                        'title_withdraw'.tr,
                        textAlign: TextAlign.start,
                        style: context.textTheme.displayLarge,
                      ),
                    ),
                  ),
                  // dummy
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: IconTitleField(
                      titleName: '신규대여수량계'.tr,
                      value: controller.controllerAssetModel != null ? numberFormat.format(controller.controllerAssetModel.totQty) : '0',
                      iconData: Icons.label_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 20),
                    child: IconTitleField(
                      titleName: '신규대여금액계'.tr,
                      value: controller.controllerAssetModel != null ? numberFormat.format(controller.controllerAssetModel.totAmt) : '0',
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
