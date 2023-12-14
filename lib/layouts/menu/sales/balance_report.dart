import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_customer_status.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manager.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_cb_customer_class.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/sales/balance_report_item.dart';
import '../../../models/menu/sales/balance_report_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class BanlanceReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(BalanceReportController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_balance_report'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: APPBAR_BACKGROUND_COLOR,
              iconTheme: context.theme.iconTheme,
              actions: [
              ]),
          body: Container(
            color: context.theme.canvasColor,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.all(20),
                  child: Column(
                    children: [
                      Visibility(
                        visible: Get.find<BalanceReportController>().visible.value,
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
                                OptionTwoContent(OptionCbEmployee(), OptionCbManager()),
                                OptionTwoContent(OptionCbCustomerClass(), OptionCbCustomerStatus()),
                                OptionBtnSearch(ROUTE_MENU_BALANCE_REPORT),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !Get.find<BalanceReportController>().visible.value,
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
                                SumTitleTable('기간 채권 합계'),
                                SumItemTable('매출액', numberFormat.format(Get.find<BalanceReportController>().sumTotal), '공급가',
                                    numberFormat.format(Get.find<BalanceReportController>().sumPrice)),
                                SumItemTable('합계', numberFormat.format(Get.find<BalanceReportController>().sumAmount), '입금합계',
                                    numberFormat.format(Get.find<BalanceReportController>().sumDeposit)),
                                SumItemTable('채권잔액', numberFormat.format(Get.find<BalanceReportController>().sumBalance), '매출이익',
                                    numberFormat.format(Get.find<BalanceReportController>().sumMargin)),
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
                            padding: EdgeInsetsDirectional.all(20),
                            child: ListView(
                              children: <Widget>[setChild()],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(visible: Get.find<BalanceReportController>().visible.value),
                      onPressed: () {
                        Get.find<BalanceReportController>().setVisible();
                      },
                      splashColor: CommonColors.signature,
                      backgroundColor: Colors.white,
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
    if (Get.find<BalanceReportController>().controllerBalanceReport != null) {
      return BalanceReportItem(Get.find<BalanceReportController>().controllerBalanceReport);
    } else {
      return EmptyWidget();
    }
  }
}

class BalanceReportController extends GetxController {
  var controllerBalanceReport;
  int sumTotal = 0;
  int sumPrice = 0;
  int sumAmount = 0;
  int sumDeposit = 0;
  int sumBalance = 0;
  int sumMargin = 0;

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramFromDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().fromDate.value).toString();
    String paramToDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().toDate.value).toString();
    String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramManagementCode = Get.find<CbManagerController>().paramManagerCode;
    String paramCustStat = Get.find<CbCustomerStatusController>().paramCustomerStatusCode;
    String paramCustGrade = Get.find<CbCustomerClassController>().paramBusinessCode;

    var param = user.getClientCode;
    var parsedBalanceReportSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_SALES +
          API_SALES_BALANCEREPORT +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&sales-rep=' +
          paramEmployeeCode +
          '&manager=' +
          paramManagementCode +
          '&grade=' +
          paramCustGrade +
          '&status=' +
          paramCustStat);

      if (response.statusCode == 200) {
        if ((parsedBalanceReportSales = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerBalanceReport = parsedBalanceReportSales.map((dataJson) => BalanceReportModel.fromJson(dataJson)).toList();

          for (BalanceReportModel calData in controllerBalanceReport) {
            sumTotal += calData.total as int;
            sumPrice += calData.price as int;
            sumAmount += calData.amount as int;
            sumDeposit += calData.deposit as int;
            sumBalance += calData.balance as int;
            sumMargin += calData.margin as int;
          }
        }

        Get.find<BalanceReportController>().setVisible();
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
    sumTotal = 0;
    sumPrice = 0;
    sumAmount = 0;
    sumDeposit = 0;
    sumBalance = 0;
    sumMargin = 0;

    controllerBalanceReport = null;
  }
}
