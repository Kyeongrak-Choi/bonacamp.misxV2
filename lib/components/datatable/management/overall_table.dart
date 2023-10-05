import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../layouts/menu/management/overall_status.dart';
import '../../common/field/show_long_title_field.dart';
import '../../common/field/show_short_title_field.dart';

class OverAllTable extends StatelessWidget {
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    Get.put(OverAllController());
    return GetBuilder<OverAllController>(builder: (OverAllController controller) {
      return Container(
        color: context.theme.cardColor,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: ListView(
            children: [
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              ShowShortTitleField(
                  titleName: 'sales_title_totAmt'.tr,
                  value: controller.controllerSalesModel != null ? f.format(int.parse(controller.controllerSalesModel.totAmt)) : '0'),
              ShowShortTitleField(
                  titleName: 'sales_title_suppAmt'.tr,
                  value: controller.controllerSalesModel != null ? f.format(int.parse(controller.controllerSalesModel.suppAmt)) : '0'),
              ShowShortTitleField(
                  titleName: 'sales_title_vatAmt'.tr,
                  value: controller.controllerSalesModel != null ? f.format(int.parse(controller.controllerSalesModel.vatAmt)) : '0'),
              ShowShortTitleField(
                  titleName: 'sales_title_grntAmt'.tr,
                  value: controller.controllerSalesModel != null ? f.format(int.parse(controller.controllerSalesModel.grntAmt)) : '0'),
              ShowShortTitleField(
                  titleName: 'deposit_title_retrvAmt'.tr,
                  value: controller.controllerDepositModel != null ? f.format(int.parse(controller.controllerDepositModel.retrvAmt)) : '0'),
              ShowShortTitleField(
                  titleName: 'deposit_title_ipTot'.tr,
                  value: controller.controllerDepositModel != null ? f.format(int.parse(controller.controllerDepositModel.ipTot)) : '0'),
              ShowShortTitleField(
                  titleName: 'deposit_title_amt'.tr,
                  value: controller.controllerDepositModel != null ? f.format(int.parse(controller.controllerDepositModel.amt)) : '0'),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),

              ShowShortTitleField(
                  titleName: 'purchase_title_boTotAmt'.tr,
                  value: controller.controllerPurchaseModel != null ? f.format(int.parse(controller.controllerPurchaseModel.boTotAmt)) : '0'),
              ShowShortTitleField(
                  titleName: 'purchase_title_suppAmt'.tr,
                  value: controller.controllerPurchaseModel != null ? f.format(int.parse(controller.controllerPurchaseModel.suppAmt)) : '0'),
              ShowShortTitleField(
                  titleName: 'purchase_title_vatAmt'.tr,
                  value: controller.controllerPurchaseModel != null ? f.format(int.parse(controller.controllerPurchaseModel.vatAmt)) : '0'),
              ShowShortTitleField(
                  titleName: 'purchase_title_grntAmt'.tr,
                  value: controller.controllerPurchaseModel != null ? f.format(int.parse(controller.controllerPurchaseModel.grntAmt)) : '0'),
              ShowShortTitleField(
                  titleName: 'return_title_oTot'.tr,
                  value: controller.controllerReturnModel != null ? f.format(int.parse(controller.controllerReturnModel.oTot)) : '0'),
              ShowShortTitleField(
                  titleName: 'withdraw_title_outTot'.tr,
                  value: controller.controllerWithdrawModel != null ? f.format(int.parse(controller.controllerWithdrawModel.outTot)) : '0'),
              ShowShortTitleField(
                  titleName: 'withdraw_title_amt'.tr,
                  value: controller.controllerWithdrawModel != null ? f.format(int.parse(controller.controllerWithdrawModel.amt)) : '0'),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),

              ShowLongTitleField(
                  titleName: 'rental_title_lendAmt'.tr,
                  value: controller.controllerRentalModel != null ? f.format(int.parse(controller.controllerRentalModel.lendAmt)) : '0'),
              ShowLongTitleField(
                  titleName: 'rental_title_inspayLendAmt'.tr,
                  value: controller.controllerRentalModel != null ? f.format(int.parse(controller.controllerRentalModel.inspayLendAmt)) : '0'),
              ShowLongTitleField(
                  titleName: 'rental_title_retrvAmt'.tr,
                  value: controller.controllerRentalModel != null ? f.format(int.parse(controller.controllerRentalModel.retrvAmt)) : '0'),
              ShowLongTitleField(
                  titleName: 'rental_title_remAmt'.tr,
                  value: controller.controllerRentalModel != null ? f.format(int.parse(controller.controllerRentalModel.remAmt)) : '0'),
              ShowLongTitleField(
                  titleName: 'rental_title_totAmt'.tr,
                  value: controller.controllerRentalModel != null ? f.format(int.parse(controller.controllerRentalModel.totAmt)) : '0'),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),

              ShowLongTitleField(
                  titleName: 'asset_title_totQty'.tr,
                  value: controller.controllerAssetModel != null ? f.format(int.parse(controller.controllerAssetModel.totQty)) : '0'),
              ShowLongTitleField(
                  titleName: 'asset_title_totAmt'.tr,
                  value: controller.controllerAssetModel != null ? f.format(int.parse(controller.controllerAssetModel.totAmt)) : '0'),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              //ShowShortTitleField(titleName: '매출액', value: controller.controllerOverAllModel.overAllSales.totAmt),
            ],
          ),
        ),
      );
    });
  }
}
