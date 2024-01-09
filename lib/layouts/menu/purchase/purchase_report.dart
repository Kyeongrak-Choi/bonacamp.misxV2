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
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/purchase/purchase_report_item.dart';
import '../../../models/menu/purchase/purchase_report_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class PurchaseReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(PurchaseReportController());
    return Obx(() => Scaffold(
          appBar:
              AppBar(title: Text('menu_sub_purchase_report'.tr), actions: []),
          body: Container(
            color: context.theme.canvasColor,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible:
                          !Get.find<PurchaseReportController>().visible.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.all(15),
                          child: Column(
                            children: [
                              SumTitleTable('기간 매입 합계'),
                              SumItemTable(
                                  '매입액',
                                  numberFormat.format(
                                      Get.find<PurchaseReportController>()
                                          .sumPurchase),
                                  '출금합계',
                                  numberFormat.format(
                                      Get.find<PurchaseReportController>()
                                          .sumWithdraw)),
                              SumItemTable(
                                  null,
                                  null,
                                  '채무잔액',
                                  numberFormat.format(
                                      Get.find<PurchaseReportController>()
                                          .sumBalance)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: Column(
                          children: [
                            Visibility(
                              visible: Get.find<PurchaseReportController>()
                                  .visible
                                  .value,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.theme.cardColor,
                                  borderRadius: BorderRadius.circular(15),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.all(15),
                                  child: Column(
                                    children: [
                                      OptionPeriodPicker(),
                                      OptionTwoContent(OptionDialogPurchase(),
                                          OptionCbBranch()),
                                      OptionBtnSearch(
                                          ROUTE_MENU_PURCHASE_REPORT),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.find<PurchaseReportController>()
                                      .visible
                                      .value
                                  ? 20
                                  : 0,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.theme.cardColor,
                                  borderRadius: BorderRadius.circular(15),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.all(15),
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
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                        0.w,
                        0.h,
                        BASIC_PADDING * 2.w,
                        0.h),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(
                          visible: Get.find<PurchaseReportController>()
                              .visible
                              .value),
                      onPressed: () {
                        Get.find<PurchaseReportController>().setVisible();
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
    if (Get.find<PurchaseReportController>().controllerPurchaseReport != null) {
      return PurchaseReportItem(
          Get.find<PurchaseReportController>().controllerPurchaseReport);
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
    String paramFromDate = DateFormat('yyyyMMdd')
        .format(Get.find<PeriodPickerController>().fromDate.value)
        .toString();
    String paramToDate = DateFormat('yyyyMMdd')
        .format(Get.find<PeriodPickerController>().toDate.value)
        .toString();
    String paramPurchaseCode =
        Get.find<OptionDialogPurchaseController>().paramCode;

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
          paramPurchaseCode);

      if (response.statusCode == 200) {
        if ((parsedPurchaseReport =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerPurchaseReport = parsedPurchaseReport
              .map((dataJson) => PurchaseReportModel.fromJson(dataJson))
              .toList();

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
        ShowSnackBar(SNACK_TYPE.INFO,
            e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
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
