import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../layouts/menu/management/overall_status.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';

class OverAllTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OverAllController());
    return GetBuilder<OverAllController>(builder: (OverAllController controller) {
      return ListView(
        children: [
          Container(
            padding: EdgeInsetsDirectional.fromSTEB(16.w, 16.h, 16.w, 0),
            color: context.theme.cardColor,
            child: Column(
              children: [
                IconTitleField(
                  titleName: 'sales_amount'.tr,
                  value: controller.controllerSalesModel != null ? numberFormat.format(controller.controllerSalesModel.totAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'supplement_amount'.tr,
                  value: controller.controllerSalesModel != null ? numberFormat.format(controller.controllerSalesModel.suppAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'vat_amount'.tr,
                  value: controller.controllerSalesModel != null ? numberFormat.format(controller.controllerSalesModel.vatAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'guarantee_amount'.tr,
                  value: controller.controllerSalesModel != null ? numberFormat.format(controller.controllerSalesModel.grntAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'collect_amount'.tr,
                  value: controller.controllerDepositModel != null ? numberFormat.format(controller.controllerDepositModel.retrvAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'deposit_amount'.tr,
                  value: controller.controllerDepositModel != null ? numberFormat.format(controller.controllerDepositModel.ipTot) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'deposit_title_amt'.tr,
                  value: controller.controllerDepositModel != null ? numberFormat.format(controller.controllerDepositModel.amt) : '0',
                  iconData: Icons.label_outlined,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            padding: EdgeInsetsDirectional.fromSTEB(16.w, 16.h, 16.w, 0),
            color: context.theme.cardColor,
            child: Column(
              children: [
                IconTitleField(
                  titleName: 'purchase_amount'.tr,
                  value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.boTotAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'supplement_amount'.tr,
                  value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.suppAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'vat_amount'.tr,
                  value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.vatAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'guarantee_amount'.tr,
                  value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.grntAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'return_amount'.tr,
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
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            padding: EdgeInsetsDirectional.fromSTEB(16.w, 16.h, 16.w, 0),
            color: context.theme.cardColor,
            child: Column(
              children: [
                IconTitleField(
                  titleName: 'rental_amount'.tr,
                  value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.lendAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'rental_title_inspayLendAmt'.tr,
                  value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.inspayLendAmt) : '0',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: 'collect_amount'.tr,
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
              ],
            ),
          ),
        ],
      );
    });
  }
}
