import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/sales/balance_rental_report_item.dart';
import '../../../models/menu/sales/balance_rental_report_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class BanlanceRentalReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(BalanceRentalReportController());
    return Obx(() => Scaffold(
      appBar: AppBar(
          title: Text('menu_sub_balance_rental_report'.tr),
          titleTextStyle: context.textTheme.displayLarge,
          backgroundColor: context.theme.canvasColor,
          iconTheme: context.theme.iconTheme,
          actions: [
            IconButton(
              icon: OptionBtnVisible(visible: Get.find<BalanceRentalReportController>().visible.value),
              onPressed: () {
                Get.find<BalanceRentalReportController>().setVisible();
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
                visible: Get.find<BalanceRentalReportController>().visible.value,
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
                        OptionTwoContent(OptionCbTeam(), OptionCbCustomerClass()),
                        OptionBtnSearch(ROUTE_MENU_BALANCE_RENTAL_REPORT),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !Get.find<BalanceRentalReportController>().visible.value,
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
                        SumTitleTable('기간 채권 및 대여 합계'),
                        // SumItemTable('매출액', numberFormat.format(Get.find<BalanceRentalReportController>().sumTotal), '공급가',
                        //     numberFormat.format(Get.find<BalanceRentalReportController>().sumPrice)),
                        // SumItemTable('합계', numberFormat.format(Get.find<BalanceRentalReportController>().sumAmount), '입금합계',
                        //     numberFormat.format(Get.find<BalanceRentalReportController>().sumDeposit)),
                        SumItemTable('채권잔액', numberFormat.format(Get.find<BalanceRentalReportController>().sumBalance), '대여금\n(장기)',
                            numberFormat.format(Get.find<BalanceRentalReportController>().sumLongRent)),
                        SumItemTable('대여금\n(단기)', numberFormat.format(Get.find<BalanceRentalReportController>().sumShortRent), '대여금\n(합계)',
                            numberFormat.format(Get.find<BalanceRentalReportController>().sumTotalRent)),
                        SumItemTable('채권\n+대여금', numberFormat.format(Get.find<BalanceRentalReportController>().sumTotalBalance), '대여자산',
                            numberFormat.format(Get.find<BalanceRentalReportController>().sumRentQuantity)),
                        SumItemTable('소비자산', numberFormat.format(Get.find<BalanceRentalReportController>().sumConsumeQuantity), '매출이익',
                            numberFormat.format(Get.find<BalanceRentalReportController>().sumMargin)),
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
      ),
    ));
  }

  Widget setChild() {
    if (Get.find<BalanceRentalReportController>().controllerBalanceRentalReport != null) {
      return BalanceRentalReportItem(Get.find<BalanceRentalReportController>().controllerBalanceRentalReport);
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
    String paramTeamCode = Get.find<CbTeamController>().paramTeamCode;
    String paramCustGrade = Get.find<CbCustomerClassController>().paramBusinessCode;

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
          paramCustGrade
      );

      if (response.statusCode == 200) {
        if ((parsedBalanceRentalReportSales = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerBalanceRentalReport = parsedBalanceRentalReportSales.map((dataJson) => BalanceRentalReportModel.fromJson(dataJson)).toList();

          for (BalanceRentalReportModel calData in controllerBalanceRentalReport) {
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
    sumLongRent = 0;
    sumShortRent = 0;
    sumTotalRent = 0;
    sumTotalBalance = 0;
    sumRentQuantity = 0;
    sumConsumeQuantity = 0;

    controllerBalanceRentalReport = null;
  }
}
