import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manager.dart';
import 'package:misxV2/components/common/combobox/option_cb_sales_type.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/dialog/customer/option_dialog_customer.dart';
import '../../../components/common/dialog/item/option_dialog_item.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/sales/customer_report_item.dart';
import '../../../models/menu/sales/customer_report_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class CustomerReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(CustomerReportController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_sales_status'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: APPBAR_BACKGROUND_COLOR,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<CustomerReportController>().visible.value),
                  onPressed: () {
                    Get.find<CustomerReportController>().setVisible();
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
                    visible: Get.find<CustomerReportController>().visible.value,
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
                            OptionTwoContent(OptionDialogCustomer(), OptionCbBranch()),
                            OptionTwoContent(OptionDialogItem(), OptionCbSalesType()),
                            OptionTwoContent(OptionCbEmployee(), OptionCbManager()),
                            OptionBtnSearch(ROUTE_MENU_CUSTOMER_REPORT),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.find<CustomerReportController>().visible.value ? 20 : 0,
                  ),
                  Visibility(
                    visible: !Get.find<CustomerReportController>().visible.value,
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
                            SumTitleTable('기간 합계'),
                            SumItemTable('매출액', numberFormat.format(Get.find<CustomerReportController>().sumTotal), '공급가',
                                numberFormat.format(Get.find<CustomerReportController>().sumPrice)),
                            SumItemTable('합계', numberFormat.format(Get.find<CustomerReportController>().sumAmount), '입금합계',
                                numberFormat.format(Get.find<CustomerReportController>().sumDeposit)),
                            SumItemTable('채권잔액', numberFormat.format(Get.find<CustomerReportController>().sumBalance), '매출이익',
                                numberFormat.format(Get.find<CustomerReportController>().sumMargin)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: !Get.find<CustomerReportController>().visible.value ? 20 : 0,
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
    if (Get.find<CustomerReportController>().controllerCustomerReport != null) {
      return CustomerReportItem(Get.find<CustomerReportController>().controllerCustomerReport);
    } else {
      return EmptyWidget();
    }
  }
}

class CustomerReportController extends GetxController {
  var controllerCustomerReport;
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
    String paramCustomerCode = Get.find<OptionDialogCustomerController>().paramCustomerCode.value;
    String paramItemCode = Get.find<OptionDialogItemController>().paramItemCode.value;
    String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramManagementCode = Get.find<CbManagerController>().paramManagerCode;
    String paramTypeCode = Get.find<CbSalesTypeController>().paramSalesTypeCode;

    var param = user.getClientCode;
    var parsedCustomerReportSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_SALES +
          API_SALES_CUSTOMERREPORT +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&customer=' +
          paramCustomerCode +
          '&item=' +
          paramItemCode +
          '&sales-rep=' +
          paramEmployeeCode +
          '&manager=' +
          paramManagementCode +
          '&type=' +
          paramTypeCode +
          '&flag=' +
          '1');

      if (response.statusCode == 200) {
        if ((parsedCustomerReportSales = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerCustomerReport = parsedCustomerReportSales.map((dataJson) => CustomerReportModel.fromJson(dataJson)).toList();

          for (CustomerReportModel calData in controllerCustomerReport) {
            sumTotal += calData.total as int;
            sumPrice += calData.price as int;
            sumAmount += calData.amount as int;
            sumDeposit += calData.deposit as int;
            sumBalance += calData.balance as int;
            sumMargin += calData.margin as int;
          }
        }

        Get.find<CustomerReportController>().setVisible();
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

    controllerCustomerReport = null;
  }
}
