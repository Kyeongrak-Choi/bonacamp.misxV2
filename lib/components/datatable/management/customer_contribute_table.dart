import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../layouts/menu/management/customer_contribute.dart';
import '../../common/field/show_long_title_field.dart';
import '../../common/field/show_short_title_field.dart';

class CustomerContributeTable extends StatelessWidget {
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    Get.put(CustomerContributeController());
    return GetBuilder<CustomerContributeController>(builder: (CustomerContributeController controller) {
      return Container(
        color: context.theme.backgroundColor,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: ListView(
            children: [
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              ShowLongTitleField(
                  titleName: '매출공급가',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.supplementAmount ?? '0'))
                      : '0'),
              ShowLongTitleField(
                  titleName: '매출원가',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.purchaseAmount ?? '0'))
                      : '0'),
              ShowLongTitleField(
                  titleName: '마진율',
                  value: controller.controllerCustomerContribute != null ? controller.controllerCustomerContribute.profitRate ?? '0' : '0'),
              ShowLongTitleField(
                  titleName: '매출이익',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.profitAmount ?? '0'))
                      : '0'),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              ShowLongTitleField(
                  titleName: '관리비용',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.managementAmount ?? '0'))
                      : '0'),
              ShowLongTitleField(
                  titleName: '금융비용',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.financeAmount ?? '0'))
                      : '0'),
              ShowLongTitleField(
                  titleName: '자산수리비',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.assetFixAmount ?? '0'))
                      : '0'),
              ShowLongTitleField(
                  titleName: '비용합계',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.costTotalAmount ?? '0'))
                      : '0'),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              ShowShortTitleField(
                  titleName: '채권잔액',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.bondBalance ?? '0'))
                      : '0'),
              ShowShortTitleField(
                  titleName: '대여금액',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.rentalBalance ?? '0'))
                      : '0'),
              ShowShortTitleField(
                  titleName: '대여자산',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.rentalAmount ?? '0'))
                      : '0'),
              ShowShortTitleField(
                  titleName: '대여수량',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.rentalAssetQuantity ?? '0'))
                      : '0'),
              ShowShortTitleField(
                  titleName: '기여금액',
                  value: controller.controllerCustomerContribute != null
                      ? f.format(int.parse(controller.controllerCustomerContribute.contributeAmount ?? '0'))
                      : '0'),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              ShowLongTitleField(
                  titleName: '거래시작일',
                  value: controller.controllerCustomerContribute != null
                      ? controller.controllerCustomerContribute.transactionStartDate : '0'),
              ShowLongTitleField(
                  titleName: '최종거래일',
                  value: controller.controllerCustomerContribute != null
                      ? controller.controllerCustomerContribute.transactionLastDate : '0'),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
            ],
          ),
        ),
      );
    });
  }
}
