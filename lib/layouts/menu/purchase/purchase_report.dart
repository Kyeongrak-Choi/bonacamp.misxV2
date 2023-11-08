import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manager.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/dialog/customer/option_dialog_customer.dart';
import '../../../components/common/dialog/purchase/option_dialog_purchase.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/purchase/purchase_report_item.dart';
import '../../../components/datatable/sales/sales_ledger_item.dart';
import '../../../models/menu/purchase/purchase_report_model.dart';
import '../../../models/menu/sales/sales_ledger/sales_ledger_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class PurchaseReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(PurchaseReportController());
    return Obx(() => Scaffold(
      appBar: AppBar(
          title: Text('menu_sub_purchase_report'.tr),
          titleTextStyle: context.textTheme.displayLarge,
          backgroundColor: context.theme.canvasColor,
          iconTheme: context.theme.iconTheme,
          actions: [
            IconButton(
              icon: OptionBtnVisible(visible: Get.find<PurchaseReportController>().visible.value),
              onPressed: () {
                Get.find<PurchaseReportController>().setVisible();
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
                visible: Get.find<PurchaseReportController>().visible.value,
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
                        OptionBtnSearch(ROUTE_MENU_PURCHASE_REPORT),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !Get.find<PurchaseReportController>().visible.value,
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
                        SumItemTable('매입액', numberFormat.format(Get.find<PurchaseReportController>().sumPurchase), '출금합계',
                            numberFormat.format(Get.find<PurchaseReportController>().sumWithdraw)),
                        SumItemTable(null, null,
                            '채무잔액', numberFormat.format(Get.find<PurchaseReportController>().sumBalance)),
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
    if (Get.find<PurchaseReportController>().controllerPurchaseReport != null) {
      return PurchaseReportItem(Get.find<PurchaseReportController>().controllerPurchaseReport);
    } else {
      return EmptyWidget();
    }
  }
}

class PurchaseReportController extends GetxController {
  var controllerPurchaseReport;

  var visible = true.obs;

  int sumPurchase = 0;
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

    var param = user.getClientCode;
    var parsedPurchaseReport;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_PURCHASE +
          API_PURCHASE_REPORT +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&code=' +
          paramPurchaseCode
          );

      if (response.statusCode == 200) {
        if ((parsedPurchaseReport = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerPurchaseReport = parsedPurchaseReport.map((dataJson) => PurchaseReportModel.fromJson(dataJson)).toList();

          for (PurchaseReportModel calData in controllerPurchaseReport) {
            sumPurchase += calData.purchase as int;
            sumWithdraw += calData.withdraw as int;
            sumBalance += calData.balance as int;
          }
        }

        Get.find<PurchaseReportController>().setVisible();
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
    sumPurchase = 0;
    sumWithdraw = 0;
    sumBalance = 0;

    controllerPurchaseReport = null;
  }
}
