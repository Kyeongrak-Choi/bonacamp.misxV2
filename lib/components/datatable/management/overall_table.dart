import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layouts/menu/management/overall_status.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';

class OverAllTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OverAllController());
    return GetBuilder<OverAllController>(builder: (OverAllController controller) {
      return Container(
        color: context.theme.cardColor,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: ListView(
            children: [
              IconTitleField(
                titleName: 'sales_title_totAmt'.tr,
                value: controller.controllerSalesModel != null ? numberFormat.format(controller.controllerSalesModel.totAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'sales_title_suppAmt'.tr,
                value: controller.controllerSalesModel != null ? numberFormat.format(controller.controllerSalesModel.suppAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'sales_title_vatAmt'.tr,
                value: controller.controllerSalesModel != null ? numberFormat.format(controller.controllerSalesModel.vatAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'sales_title_grntAmt'.tr,
                value: controller.controllerSalesModel != null ? numberFormat.format(controller.controllerSalesModel.grntAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'deposit_title_retrvAmt'.tr,
                value: controller.controllerDepositModel != null ? numberFormat.format(controller.controllerDepositModel.retrvAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'deposit_title_ipTot'.tr,
                value: controller.controllerDepositModel != null ? numberFormat.format(controller.controllerDepositModel.ipTot) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'deposit_title_amt'.tr,
                value: controller.controllerDepositModel != null ? numberFormat.format(controller.controllerDepositModel.amt) : '0',
                iconData: Icons.label_outlined,
              ),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),

              IconTitleField(
                titleName: 'purchase_title_boTotAmt'.tr,
                value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.boTotAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'purchase_title_suppAmt'.tr,
                value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.suppAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'purchase_title_vatAmt'.tr,
                value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.vatAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'purchase_title_grntAmt'.tr,
                value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.grntAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'return_title_oTot'.tr,
                value: controller.controllerReturnModel != null ? numberFormat.format(controller.controllerReturnModel.oTot) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'withdraw_title_outTot'.tr,
                value: controller.controllerWithdrawModel != null ? numberFormat.format(controller.controllerWithdrawModel.outTot) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'withdraw_title_amt'.tr,
                value: controller.controllerWithdrawModel != null ? numberFormat.format(controller.controllerWithdrawModel.amt) : '0',
                iconData: Icons.label_outlined,
              ),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),

              IconTitleField(
                titleName: 'rental_title_lendAmt'.tr,
                value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.lendAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'rental_title_inspayLendAmt'.tr,
                value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.inspayLendAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'rental_title_retrvAmt'.tr,
                value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.retrvAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'rental_title_remAmt'.tr,
                value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.remAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'rental_title_totAmt'.tr,
                value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.totAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'asset_title_totQty'.tr,
                value: controller.controllerAssetModel != null ? numberFormat.format(controller.controllerAssetModel.totQty) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'asset_title_totAmt'.tr,
                value: controller.controllerAssetModel != null ? numberFormat.format(controller.controllerAssetModel.totAmt) : '0',
                iconData: Icons.label_outlined,
              ),
              //ShowShortTitleField(titleName: '매출액', value: controller.controllerOverAllModel.overAllSales.totAmt),
            ],
          ),
        ),
      );
    });
  }
}