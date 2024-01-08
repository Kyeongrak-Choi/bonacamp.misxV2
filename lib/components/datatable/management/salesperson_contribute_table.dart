import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layouts/menu/management/salesperson_contribute.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';

class SalesPersonContributeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SalesPersonContributeController());
    return GetBuilder<SalesPersonContributeController>(
        builder: (SalesPersonContributeController controller) {
      return Container(
        color: context.theme.cardColor,
        child: Padding(
          padding: EdgeInsets.zero,
          child: ListView(
            children: [
              IconTitleField(
                titleName: '관리업체수',
                value: controller.controllerModel != null
                    ? numberFormat.format(int.parse(
                        controller.controllerModel.customerCount ?? '0'))
                    : '0',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(
                      color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '매출공급가',
                value: (controller.controllerModel != null
                    ? numberFormat
                        .format(controller.controllerModel.salesAmount ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '매출원가',
                value: (controller.controllerModel != null
                    ? numberFormat.format(
                        controller.controllerModel.purchaseAmount ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '마진율',
                value: (controller.controllerModel != null
                    ? controller.controllerModel.marginRate.toString()
                    : '0') + ' %',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '매출이익',
                value: (controller.controllerModel != null
                    ? numberFormat
                        .format(controller.controllerModel.margin ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(
                      color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '관리비용',
                value: (controller.controllerModel != null
                    ? numberFormat.format(
                        controller.controllerModel.managementCost ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '금융비용',
                value: (controller.controllerModel != null
                    ? numberFormat
                        .format(controller.controllerModel.financeCost ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '자산수리비',
                value: (controller.controllerModel != null
                    ? numberFormat
                        .format(controller.controllerModel.fixCost ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '비용합계',
                value: (controller.controllerModel != null
                    ? numberFormat
                        .format(controller.controllerModel.costTotal ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(
                      color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '채권잔액',
                value: (controller.controllerModel != null
                    ? numberFormat
                        .format(controller.controllerModel.balance ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '대여금잔액',
                value: (controller.controllerModel != null
                    ? numberFormat
                        .format(controller.controllerModel.rentalBalance ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '대여자산',
                value: (controller.controllerModel != null
                    ? numberFormat
                        .format(controller.controllerModel.rentalCount ?? '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '대여수량',
                value: controller.controllerModel != null
                    ? numberFormat.format(
                        controller.controllerModel.rentalQuantity +
                                controller.controllerModel.expenseQuantity ??
                            '0')
                    : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '기여비중',
                value: (controller.controllerModel != null
                    ? controller.controllerModel.serveRate.toString()
                    : '0') + ' %',
                iconData: Icons.label_outlined,
              ),
            ],
          ),
        ),
      );
    });
  }
}
