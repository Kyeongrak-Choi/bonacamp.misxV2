import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/dialog/purchase/option_dialog_purchase.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
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
          appBar: AppBar(
              title: Text('menu_sub_purchase_ledger'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: context.theme.canvasColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<PurchaseLedgerController>().visible.value),
                  onPressed: () {
                    Get.find<PurchaseLedgerController>().setVisible();
                  },
                ),
              ]),
          body: Container(
            color: context.theme.canvasColor,
            child: Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Column(
                children: [
                  Visibility(
                    visible: Get.find<PurchaseLedgerController>().visible.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: Column(
                          children: [
                            OptionPeriodPicker(),
                            OptionCbBranch(),
                            OptionDialogPurchase(),
                            OptionBtnSearch(ROUTE_MENU_PURCHASE_LEDGER),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !Get.find<PurchaseLedgerController>().visible.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Column(
                          children: [
                            SumTitleTable('기간 매입 합계'),
                            SumItemTable(
                                'BOX/EA',
                                numberFormat.format(Get.find<PurchaseLedgerController>().sumBoxQuantity) +
                                    ' / ' +
                                    numberFormat.format(Get.find<PurchaseLedgerController>().sumBottleQuantity),
                                '매입액',
                                numberFormat.format(Get.find<PurchaseLedgerController>().sumTotal)),
                            SumItemTable('공급가', numberFormat.format(Get.find<PurchaseLedgerController>().sumPrice), '출금액',
                                numberFormat.format(Get.find<PurchaseLedgerController>().sumWithdraw)),
                            SumItemTable(null, null, '채무잔액', numberFormat.format(Get.find<PurchaseLedgerController>().sumBalance)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                        child: ListView(
                          children: <Widget>[setChild()],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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

  int sumBoxQuantity = 0;
  int sumBottleQuantity = 0;
  int sumTotal = 0;
  int sumPrice = 0;
  int sumWithdraw = 0;
  int sumBalance = 0;

  setVisible() async {
    visible.value = !visible.value;
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
