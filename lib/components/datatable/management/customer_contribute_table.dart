import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layouts/menu/management/customer_contribute.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';

class CustomerContributeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CustomerContributeController());
    return GetBuilder<CustomerContributeController>(
        builder: (CustomerContributeController controller) {
      return Container(
        color: context.theme.cardColor,
        child: Padding(
          padding: EdgeInsets.zero,
          child: ListView(
            children: [
              IconTitleField(
                titleName: '매출공급가',
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(controller
                            .controllerCustomerContribute.supplementAmount ??
                        '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '매출원가',
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(controller
                            .controllerCustomerContribute.purchaseAmount ??
                        '0')
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '마진율',
                value: (controller.controllerCustomerContribute != null
                    ? controller.controllerCustomerContribute.profitRate
                        .toString()
                    : '0') + ' %',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '매출이익',
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(
                        controller.controllerCustomerContribute.profitAmount)
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
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(controller
                        .controllerCustomerContribute.managementAmount)
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '금융비용',
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(
                        controller.controllerCustomerContribute.financeAmount)
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '자산수리비',
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(
                        controller.controllerCustomerContribute.assetFixAmount)
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '비용합계',
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat
                        .format(controller.controllerCustomerContribute.total)
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
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(
                        controller.controllerCustomerContribute.bondBalance)
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '대여금액',
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(
                        controller.controllerCustomerContribute.rentalBalance)
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '대여자산',
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(
                        controller.controllerCustomerContribute.rentalAmount)
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '대여수량',
                value: controller.controllerCustomerContribute != null
                    ? numberFormat.format(controller
                            .controllerCustomerContribute.rentalAssetQuantity +
                        controller.controllerCustomerContribute
                            .consumptionAssetQuantity)
                    : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '기여금액',
                value: (controller.controllerCustomerContribute != null
                    ? numberFormat.format(controller
                        .controllerCustomerContribute.contributeAmount)
                    : '0') + ' 원',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(
                      color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '거래시작일',
                value: controller.controllerCustomerContribute != null
                    ? (controller.controllerCustomerContribute.startDate ?? '0')
                    : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '최종거래일',
                value: controller.controllerCustomerContribute != null
                    ? (controller.controllerCustomerContribute.lastDate ?? '0')
                    : '0',
                iconData: Icons.label_outlined,
              ),
            ],
          ),
        ),
      );
    });
  }
}
