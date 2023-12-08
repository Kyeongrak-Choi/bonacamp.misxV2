import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manager.dart';
import 'package:misxV2/components/common/combobox/option_cb_sales_type.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/common/datepicker/option_year_month_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/datatable/sales/salesperson_report_monthly_item.dart';
import '../../../models/menu/sales/salesperson_report_monthly/salesperson_report_monthly_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class SalesPersonReportMonthly extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesPersonReportMonthlyController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_report_monthly'.tr),
              backgroundColor: APPBAR_BACKGROUND_COLOR,
              titleTextStyle: context.textTheme.displayLarge,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<SalesPersonReportMonthlyController>().visible.value),
                  onPressed: () {
                    Get.find<SalesPersonReportMonthlyController>().setVisible();
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
                        visible: Get.find<SalesPersonReportMonthlyController>().visible.value,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: context.theme.cardColor,
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.all(20),
                                child: Column(
                                  children: [
                                    OptionYearMonthPicker(),
                                    OptionTwoContent(OptionCbBranch(), OptionCbSalesType()),
                                    OptionTwoContent(OptionCbEmployee(), OptionCbManager()),
                                    OptionBtnSearch(ROUTE_MENU_SALESPERSON_REPORT_MONTHLY),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: Get.find<SalesPersonReportMonthlyController>().visible.value ? 20 : 0,
                    ),
                    Expanded(
                      flex: Get.find<SalesPersonReportMonthlyController>().visible.value ? 4 : 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.all(20),
                          child: setChild(),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget setChild() {
    if (Get.find<SalesPersonReportMonthlyController>().controllerSalesPersonMonthlyReport != null) {
      return SalesPersonReportMonthlyItem(Get.find<SalesPersonReportMonthlyController>().controllerSalesPersonMonthlyReport);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesPersonReportMonthlyController extends GetxController {
  var controllerSalesPersonMonthlyReport;
  var visible = true.obs;

  int sumTotal = 0;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramYearMonth = DateFormat('yyyyMM').format(Get.find<MonthPickerController>().yearMonth.value).toString();
    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramManagementCode = Get.find<CbManagerController>().paramManagerCode;
    String paramTypeCode = Get.find<CbSalesTypeController>().paramSalesTypeCode;

    var param = user.getClientCode;

    List parsedSalesPersonReportSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_SALES +
          API_SALES_SALESPERSONREPORT_MONTHLY +
          '?branch=' +
          paramBranchCode +
          '&month=' +
          paramYearMonth +
          '&code=' +
          paramEmployeeCode +
          '&manager=' +
          paramManagementCode +
          '&type=' +
          paramTypeCode);

      if (response.statusCode == 200) {
        if (jsonDecode(jsonEncode(response.data))[TAG_DATA] == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
        } else {
          jsonDecode(jsonEncode(response.data))[TAG_DATA] as List;
          sumTotal = 0;
          log(response.data.toString());

          parsedSalesPersonReportSales = await jsonDecode(jsonEncode(response.data))[TAG_DATA] as List;
          controllerSalesPersonMonthlyReport =
              parsedSalesPersonReportSales.map((dataJson) => SalesPersonReportMonthlyModel.fromJson(dataJson)).toList();

          for (SalesPersonReportMonthlyModel calData in controllerSalesPersonMonthlyReport) {
            sumTotal += calData.total as int;
          }

          Get.find<SalesPersonReportMonthlyController>().setVisible();
          update();
        }
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
}
