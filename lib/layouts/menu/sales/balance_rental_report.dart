import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manager.dart';
import 'package:misxV2/components/common/combobox/option_cb_team.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_cb_customer_class.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_one_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/sales/balance_rental_report_item.dart';
import '../../../models/menu/sales/balance_rental_report_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class BalanceRentalReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(BalanceRentalReportController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_balance_rental_report'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: !Get.find<BalanceRentalReportController>()
                          .visible
                          .value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h,
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h),
                          child: Column(
                            children: [
                              SumTitleTable('기간 채권 및 대여 합계', controller: Get.find<BalanceRentalReportController>(),),
                              Visibility(
                                visible: Get.find<BalanceRentalReportController>().sumTableVisible.value,
                                child: Column(
                                  children: [
                                    SumOneItemTable(
                                        '채권잔액',
                                        numberFormat.format(
                                            Get.find<BalanceRentalReportController>()
                                                .sumBalance) + ' 원',
                                    ),
                                    SumOneItemTable(
                                        '대여금 (장기)',
                                        numberFormat.format(
                                            Get.find<BalanceRentalReportController>()
                                                .sumLongRent) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '대여금 (단기)',
                                        numberFormat.format(
                                            Get.find<BalanceRentalReportController>()
                                                .sumShortRent) + ' 원',
                                    ),
                                    SumOneItemTable(
                                        '대여금 (합계)',
                                        numberFormat.format(
                                            Get.find<BalanceRentalReportController>()
                                                .sumTotalRent) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '채권 + 대여금',
                                        numberFormat.format(
                                            Get.find<BalanceRentalReportController>()
                                                .sumTotalBalance) + ' 원',
                                    ),
                                    SumOneItemTable(
                                        '대여자산',
                                        numberFormat.format(
                                            Get.find<BalanceRentalReportController>()
                                                .sumRentQuantity) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '소비자산',
                                        numberFormat.format(
                                            Get.find<BalanceRentalReportController>()
                                                .sumConsumeQuantity) + ' 원',
                                    ),
                                    SumOneItemTable(
                                        '매출이익',
                                        numberFormat.format(
                                            Get.find<BalanceRentalReportController>()
                                                .sumMargin) + ' 원'
                                    ),
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
                            visible: Get.find<BalanceRentalReportController>()
                                .visible
                                .value,
                            child: Container(
                              decoration: BoxDecoration(
                                color: context.theme.cardColor,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    BASIC_PADDING * 2.w,
                                    BASIC_PADDING * 2.h,
                                    BASIC_PADDING * 2.w,
                                    BASIC_PADDING * 2.h),
                                child: Column(
                                  children: [
                                    OptionPeriodPicker(),
                                    OptionCbBranch(),
                                    OptionTwoContent(OptionCbEmployee(),
                                        OptionCbManager()),
                                    OptionTwoContent(OptionCbTeam(),
                                        OptionCbCustomerClass()),
                                    OptionBtnSearch(
                                        ROUTE_MENU_BALANCE_RENTAL_REPORT),
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                        0.w,
                        0.h,
                        BASIC_PADDING * 2.w,
                        0.h),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(
                          visible: Get.find<BalanceRentalReportController>()
                              .visible
                              .value),
                      onPressed: () {
                        Get.find<BalanceRentalReportController>().setVisible();
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
    if (Get.find<BalanceRentalReportController>()
            .controllerBalanceRentalReport !=
        null) {
      return BalanceRentalReportItem(Get.find<BalanceRentalReportController>()
          .controllerBalanceRentalReport);
    } else {
      return EmptyWidget();
    }
  }
}

class BalanceRentalReportController extends GetxController {
  var controllerBalanceRentalReport;
  int sumTotal = 0;
  int sumPrice = 0;
  int sumAmount = 0;
  int sumDeposit = 0;
  int sumBalance = 0;
  int sumMargin = 0;
  int sumLongRent = 0;
  int sumShortRent = 0;
  int sumTotalRent = 0;
  int sumTotalBalance = 0;
  int sumRentQuantity = 0;
  int sumConsumeQuantity = 0;

  var visible = true.obs;
  var sumTableVisible = true.obs;

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
    String paramFromDate = DateFormat('yyyyMMdd')
        .format(Get.find<PeriodPickerController>().fromDate.value)
        .toString();
    String paramToDate = DateFormat('yyyyMMdd')
        .format(Get.find<PeriodPickerController>().toDate.value)
        .toString();
    String paramEmployeeCode =
        Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramManagementCode =
        Get.find<CbManagerController>().paramManagerCode;
    String paramTeamCode = Get.find<CbTeamController>().paramTeamCode;
    String paramCustGrade =
        Get.find<CbCustomerClassController>().paramBusinessCode;

    var param = user.getClientCode;
    var parsedBalanceRentalReportSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_SALES +
          API_SALES_BALANCERENTALREPORT +
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
          '&team=' +
          paramTeamCode +
          '&grade=' +
          paramCustGrade);

      if (response.statusCode == 200) {
        if ((parsedBalanceRentalReportSales =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerBalanceRentalReport = parsedBalanceRentalReportSales
              .map((dataJson) => BalanceRentalReportModel.fromJson(dataJson))
              .toList();

          for (BalanceRentalReportModel calData
              in controllerBalanceRentalReport) {
            sumTotal += calData.total as int;
            sumPrice += calData.price as int;
            sumAmount += calData.amount as int;
            sumDeposit += calData.deposit as int;
            sumBalance += calData.balance as int;
            sumMargin += calData.margin as int;
            sumLongRent += calData.longRent as int;
            sumShortRent += calData.shortRent as int;
            sumTotalRent += calData.totalRent as int;
            sumTotalBalance += calData.totalBalance as int;
            sumRentQuantity += calData.rentQuantity as int;
            sumConsumeQuantity += calData.consumeQuantity as int;
          }
        }

        Get.find<BalanceRentalReportController>().setVisible();
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
    sumTotal = 0;
    sumPrice = 0;
    sumAmount = 0;
    sumDeposit = 0;
    sumBalance = 0;
    sumMargin = 0;
    sumLongRent = 0;
    sumShortRent = 0;
    sumTotalRent = 0;
    sumTotalBalance = 0;
    sumRentQuantity = 0;
    sumConsumeQuantity = 0;

    controllerBalanceRentalReport = null;
  }
}
