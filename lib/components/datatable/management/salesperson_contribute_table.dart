import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layouts/menu/management/salesperson_contribute.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';

class SalesPersonContributeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SalesPersonContributeController());
    return GetBuilder<SalesPersonContributeController>(builder: (SalesPersonContributeController controller) {
      return Container(
        color: context.theme.cardColor,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: ListView(
            children: [
              IconTitleField(
                titleName: '관리업체수',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.custCnt ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '매출공급가',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.suppAmt ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '매출원가',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.prmcAmt ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '마진율',
                value: controller.controllerModel != null ? controller.controllerModel.marginRate ?? '0' : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '매출이익',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.marginAmt ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '관리비용',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.mngmtAmt ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '금융비용',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.fncAmt ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '자산수리비',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.assAsAmt ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '비용합계',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.costSum ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '채권잔액',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.perddBal ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '대여금잔액',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.balAmt ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '대여자산',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.assCnt ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '대여수량',
                value: controller.controllerModel != null ? numberFormat.format(int.parse(controller.controllerModel.assQty3 ?? '0')) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '기여비중',
                value: controller.controllerModel != null ? controller.controllerModel.cstrbtPct ?? '0' : '0',
                iconData: Icons.label_outlined,
              ),
            ],
          ),
        ),
      );
    });
  }
}
