import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/combobox/option_cb_rental_division.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/button/option_btn_visible.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_cb_employee.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/datepicker/option_date_picker.dart';
import '../../../components/common/dialog/customer/option_dialog_customer.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/support/rental_report_item.dart';
import '../../../models/menu/support/rental_report/rental_report_details_model.dart';
import '../../../models/menu/support/rental_report/rental_report_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class RentalReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(RentalReportController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_support_rental_report'.tr), actions: []),
          body: Container(
            color: context.theme.canvasColor,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible:
                          !Get.find<RentalReportController>().visible.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.all(15),
                          child: Column(
                            children: [
                              SumTitleTable('기간 대여금 합계'),
                              SumItemTable(
                                  '대여금',
                                  numberFormat.format(
                                      Get.find<RentalReportController>()
                                          .sumTotalRentalAmount),
                                  '회수금',
                                  numberFormat.format(
                                      Get.find<RentalReportController>()
                                          .sumTotalReturnAmount)),
                              SumItemTable(
                                  '대여잔액',
                                  numberFormat.format(
                                      Get.find<RentalReportController>()
                                          .sumBalance),
                                  '당일예정액',
                                  numberFormat.format(
                                      Get.find<RentalReportController>()
                                          .sumRentalAmount)),
                              SumItemTable(
                                  '당일회수액',
                                  numberFormat.format(
                                      Get.find<RentalReportController>()
                                          .sumReturnAmount),
                                  '연체금액',
                                  numberFormat.format(
                                      Get.find<RentalReportController>()
                                          .sumOverdueAmount)),
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
                                visible: Get.find<RentalReportController>()
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
                                        OptionDatePicker(),
                                        OptionTwoContent(OptionCbBranch(),
                                            OptionCbEmployee()),
                                        OptionTwoContent(OptionDialogCustomer(),
                                            OptionCbRentalDivision()),
                                        OptionBtnSearch(
                                            ROUTE_MENU_SUPPORT_RENTAL_REPORT),
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: Get.find<RentalReportController>()
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
                    padding: const EdgeInsets.all(5),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(
                          visible:
                              Get.find<RentalReportController>().visible.value),
                      onPressed: () {
                        Get.find<RentalReportController>().setVisible();
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
    if (Get.find<RentalReportController>().controllerRentalReport != null) {
      return RentalReportItem(
          Get.find<RentalReportController>().controllerRentalReport);
    } else {
      return EmptyWidget();
    }
  }
}

class RentalReportController extends GetxController {
  var visible = true.obs;
  var controllerRentalReport;

  int sumTotalRentalAmount = 0;
  int sumTotalReturnAmount = 0;
  int sumBalance = 0;
  int sumRentalAmount = 0;
  int sumReturnAmount = 0;
  int sumOverdueAmount = 0;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCd = Get.find<CbBranchController>().paramBranchCode;
    String paramDt = DateFormat('yyyyMMdd')
        .format(Get.find<DatePickerController>().date.value)
        .toString();
    String paramCustomerCode =
        Get.find<OptionDialogCustomerController>().paramCustomerCode.value;
    String paramEmployeeCode =
        Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramRentalStatusCode =
        Get.find<CbRentalDivisionController>().paramDivisionCode;

    var param = user.getClientCode;
    var parsedRentalReport;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_SUPPORT +
          API_SUPPORT_RENTALREPORT +
          '?branch=' +
          paramBranchCd +
          '&date=' +
          paramDt +
          '&code=' +
          paramCustomerCode +
          '&sales-rep=' +
          paramEmployeeCode +
          '&status=' +
          paramRentalStatusCode);

      if (response.statusCode == 200) {
        if ((parsedRentalReport =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerRentalReport = parsedRentalReport
              .map((dataJson) => RentalReportModel.fromJson(dataJson))
              .toList();

          for (RentalReportModel rentalData in controllerRentalReport) {
            for (RentalReportDetailsModel detailsData
                in rentalData.detailList) {
              sumTotalRentalAmount += detailsData.totalRentalAmount as int;
              sumTotalReturnAmount += detailsData.totalReturnAmount as int;
              sumBalance += detailsData.balance as int;
              sumRentalAmount += detailsData.rentalAmount as int;
              sumReturnAmount += detailsData.returnAmount as int;
              sumOverdueAmount += detailsData.overdueAmount as int;
            }
          }
        }

        Get.find<RentalReportController>().setVisible();
        update();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO,
            e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    } catch (e) {
      print("other error");
    }
  }

  void clearValue() {
    sumTotalRentalAmount = 0;
    sumTotalReturnAmount = 0;
    sumBalance = 0;
    sumRentalAmount = 0;
    sumReturnAmount = 0;
    sumOverdueAmount = 0;

    controllerRentalReport = null;
  }
}
