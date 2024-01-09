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
import 'package:misxV2/components/common/combobox/option_cb_sales_type.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_one_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/sales/salesperson_report_item.dart';
import '../../../models/menu/sales/salesperson_report_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class SalesPersonReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesPersonReportController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_salesperson_report'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: !Get.find<SalesPersonReportController>()
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
                              SumTitleTable('기간 합계', controller: Get.find<SalesPersonReportController>(),),
                              Visibility(
                                visible: Get.find<SalesPersonReportController>().sumTableVisible.value,
                                child: Column(
                                  children: [
                                    SumOneItemTable(
                                        '매출액',
                                        numberFormat.format(
                                            Get.find<SalesPersonReportController>()
                                                .sumTotal) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '공급가',
                                        numberFormat.format(
                                            Get.find<SalesPersonReportController>()
                                                .sumPrice) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '합계',
                                        numberFormat.format(
                                            Get.find<SalesPersonReportController>()
                                                .sumAmount) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '입금합계',
                                        numberFormat.format(
                                            Get.find<SalesPersonReportController>()
                                                .sumDeposit) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '채권잔액',
                                        numberFormat.format(
                                            Get.find<SalesPersonReportController>()
                                                .sumBalance) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '매출이익',
                                        numberFormat.format(
                                            Get.find<SalesPersonReportController>()
                                                .sumMargin) + ' 원'
                                    ),
                                  ],
                                )
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
                            visible: Get.find<SalesPersonReportController>()
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
                                    OptionTwoContent(OptionCbBranch(),
                                        OptionCbSalesType()),
                                    OptionTwoContent(OptionCbEmployee(),
                                        OptionCbManager()),
                                    OptionBtnSearch(
                                        ROUTE_MENU_SALESPERSON_REPORT),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: BASIC_PADDING.h
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
                          visible: Get.find<SalesPersonReportController>()
                              .visible
                              .value),
                      onPressed: () {
                        Get.find<SalesPersonReportController>().setVisible();
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
    if (Get.find<SalesPersonReportController>().controllerSalesPersonReport !=
        null) {
      return SalesPersonReportItem(
          Get.find<SalesPersonReportController>().controllerSalesPersonReport);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesPersonReportController extends GetxController {
  var controllerSalesPersonReport;
  int sumTotal = 0;
  int sumPrice = 0;
  int sumAmount = 0;
  int sumDeposit = 0;
  int sumBalance = 0;
  int sumMargin = 0;

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
    String paramTypeCode = Get.find<CbSalesTypeController>().paramSalesTypeCode;

    var param = user.getClientCode;
    var parsedSalesPersonReportSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_SALES +
          API_SALES_SALESPERSONREPORT +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&code=' +
          paramEmployeeCode +
          '&manager=' +
          paramManagementCode +
          '&type=' +
          paramTypeCode);

      if (response.statusCode == 200) {
        if ((parsedSalesPersonReportSales =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerSalesPersonReport = parsedSalesPersonReportSales
              .map((dataJson) => SalesPersonReportModel.fromJson(dataJson))
              .toList();

          for (SalesPersonReportModel calData in controllerSalesPersonReport) {
            sumTotal += calData.total as int;
            sumPrice += calData.price as int;
            sumAmount += calData.amount as int;
            sumDeposit += calData.deposit as int;
            sumBalance += calData.balance as int;
            sumMargin += calData.margin as int;
          }
        }

        Get.find<SalesPersonReportController>().setVisible();
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

    controllerSalesPersonReport = null;
  }
}
