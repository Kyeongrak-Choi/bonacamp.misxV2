import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/dialog/purchase/option_dialog_purchase.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_one_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/purchase/purchase_ledger_item.dart';
import '../../../models/menu/purchase/purchase_ledger/purchase_ledger_details_model.dart';
import '../../../models/menu/purchase/purchase_ledger/purchase_ledger_list_model.dart';
import '../../../models/menu/purchase/purchase_ledger/purchase_ledger_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class PurchaseLedger extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(PurchaseLedgerController());
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text('menu_sub_purchase_ledger'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: !Get.find<PurchaseLedgerController>().visible.value,
                      child: Container(
                        color: context.theme.canvasColor,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
                          child: Column(
                            children: [
                              SumTitleTable('기간 매입 합계',controller: Get.find<PurchaseLedgerController>()),
                              Visibility(
                                visible: Get.find<PurchaseLedgerController>().sumTableVisible.value,
                                child: Column(
                                  children: [
                                    SumOneItemTable('BOX', numberFormat.format(Get.find<PurchaseLedgerController>().sumBoxQuantity)),
                                    SumOneItemTable('EA',  numberFormat.format(Get.find<PurchaseLedgerController>().sumBottleQuantity)),
                                    SumOneItemTable('매입액',  numberFormat.format(Get.find<PurchaseLedgerController>().sumTotal) +' 원'),
                                    SumOneItemTable('공급가', numberFormat.format(Get.find<PurchaseLedgerController>().sumPrice) +' 원'),
                                    SumOneItemTable('출금액', numberFormat.format(Get.find<PurchaseLedgerController>().sumWithdraw) +' 원'),
                                    SumOneItemTable('채무잔액',  numberFormat.format(Get.find<PurchaseLedgerController>().sumBalance) +' 원'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Visibility(
                            visible: Get.find<PurchaseLedgerController>().visible.value,
                            child: Container(
                              color: context.theme.canvasColor,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
                                child: Column(
                                  children: [
                                    OptionPeriodPicker(),
                                    OptionTwoContent(OptionDialogPurchase(), OptionCbBranch()),
                                    OptionBtnSearch(ROUTE_MENU_PURCHASE_LEDGER),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: BASIC_PADDING.h,
                          ),
                          Expanded(
                            child: Container(
                              child: ListView(
                                children: <Widget>[setChild()],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.w, 0.h, BASIC_PADDING * 2.w, 0.h),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(visible: Get.find<PurchaseLedgerController>().visible.value),
                      onPressed: () {
                        Get.find<PurchaseLedgerController>().setVisible();
                      },
                      backgroundColor: context.theme.colorScheme.onTertiary,
                      elevation: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget setChild() {
    if (Get.find<PurchaseLedgerController>().controllerPurchaseLedger != null) {
      return PurchaseLedgerItem(Get.find<PurchaseLedgerController>().controllerPurchaseLedger);
    } else {
      return EmptyWidget();
    }
  }
}

class PurchaseLedgerController extends GetxController {
  var controllerPurchaseLedger;

  var visible = true.obs;
  var sumTableVisible = true.obs;

  int sumBoxQuantity = 0;
  int sumBottleQuantity = 0;
  int sumTotal = 0;
  int sumPrice = 0;
  int sumWithdraw = 0;
  int sumBalance = 0;

  setVisible() async {
    visible.value = !visible.value;
  }

  setSumTableVisible() async {
    sumTableVisible.value = !sumTableVisible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramFromDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().fromDate.value).toString();
    String paramToDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().toDate.value).toString();
    String paramPurchaseCode = Get.find<OptionDialogPurchaseController>().paramCode;

    if (paramPurchaseCode == '') {
      ShowSnackBar(SNACK_TYPE.INFO, '매입처를 선택해주세요.');
      return;
    }

    var param = user.getClientCode;
    var parsedPurchaseLedger;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_PURCHASE +
          API_PURCHASE_LEDGER +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&code=' +
          paramPurchaseCode);

      if (response.statusCode == 200) {
        if ((parsedPurchaseLedger = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerPurchaseLedger = PurchaseLedgerModel.fromJson(parsedPurchaseLedger);

          sumBalance = controllerPurchaseLedger.balance;

          for (PurchaseLedgerListModel calData in controllerPurchaseLedger.dateList) {
            for (PurchaseLedgerDetailsModel details in calData.details) {
              sumBoxQuantity += details.boxQuantity as int;
              sumBottleQuantity += details.bottleQuantity as int;
              sumTotal += details.total as int;
              sumPrice += details.price as int;
              sumWithdraw += details.withdraw as int;
            }
          }
        }

        Get.find<PurchaseLedgerController>().setVisible();
        update();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    } catch (e) {
      print(e.toString());
      print("other error");
    }
  }

  void clearValue() {
    sumBoxQuantity = 0;
    sumBottleQuantity = 0;
    sumTotal = 0;
    sumPrice = 0;
    sumWithdraw = 0;
    sumBalance = 0;

    controllerPurchaseLedger = null;
  }
}
