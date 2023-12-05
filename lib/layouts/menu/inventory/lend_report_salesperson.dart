import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/button/option_btn_visible.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_cb_employee.dart';
import '../../../components/common/combobox/option_cb_lend_division.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/datepicker/option_period_picker.dart';
import '../../../components/common/dialog/customer/option_dialog_customer.dart';
import '../../../components/common/dialog/lenditem/option_dialog_lenditem.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/datatable/inventory/lend_report_customer_item.dart';
import '../../../models/menu/inventory/lend_report_salesperson_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class LendReportSalesperson extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(LendReportSalespersonController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_lend_report_salesperson'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: context.theme.canvasColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<LendReportSalespersonController>().visible.value),
                  onPressed: () {
                    Get.find<LendReportSalespersonController>().setVisible();
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
                      visible: Get.find<LendReportSalespersonController>().visible.value,
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
                              OptionTwoContent(OptionDialogCustomer(), OptionCbEmployee()),
                              OptionTwoContent(OptionDialogLendItem(), OptionCbLendDivision()),
                              OptionBtnSearch(ROUTE_MENU_LEND_REPORT_SALESPERSON),
                            ],
                          ),
                        ),
                      )),
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
    if (Get.find<LendReportSalespersonController>().controllerLendReportSalesperson != null) {
      return LendReportCustomerItem(Get.find<LendReportSalespersonController>().controllerLendReportSalesperson[0].salespersonList);
    } else {
      return EmptyWidget();
    }
  }
}

class LendReportSalespersonController extends GetxController {
  var visible = true.obs;
  var controllerLendReportSalesperson;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCd = Get.find<CbBranchController>().paramBranchCode;
    String paramFromDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().fromDate.value).toString();
    String paramToDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().toDate.value).toString();
    String paramCustomerCode = Get.find<OptionDialogCustomerController>().paramCustomerCode.value;
    String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramLendItemCode = Get.find<OptionDialogLendItemController>().paramLendItemCode.value;
    String paramLendDivisionCode = Get.find<CbLendDivisionController>().paramLendDivisionCode;

    if (paramEmployeeCode == '') {
      ShowSnackBar(SNACK_TYPE.INFO, '영업담당을 선택해주세요.');
      return;
    }

    var param = user.getClientCode;
    var parsedLendReportSalesperson;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_INVENTORY +
          API_LEND_REPORT_SALESPERSON +
          '?branch=' +
          paramBranchCd +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&sales-rep=' +
          paramEmployeeCode +
          '&customer=' +
          paramCustomerCode +
          '&item=' +
          paramLendItemCode +
          '&type=' +
          paramLendDivisionCode);

      if (response.statusCode == 200) {
        if ((parsedLendReportSalesperson = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerLendReportSalesperson = parsedLendReportSalesperson.map((dataJson) => LendReportSalespersonModel.fromJson(dataJson)).toList();
        }

        Get.find<LendReportSalespersonController>().setVisible();
        update();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    } catch (e) {
      print("other error");
    }
  }

  void clearValue() {
    controllerLendReportSalesperson = null;
  }
}