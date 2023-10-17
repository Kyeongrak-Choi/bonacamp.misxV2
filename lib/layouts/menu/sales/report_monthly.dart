import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_sales_type.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manager.dart';
import 'package:misxV2/components/common/datepicker/option_year_month_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/dialog/option_dialog.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../models/common/chart_spot.dart';
import '../../../models/menu/sales/customer_info/customer_info_employee_model.dart';
import '../../../models/menu/sales/customer_info/customer_info_model.dart';
import '../../../models/menu/sales/customer_info/customer_info_representative_model.dart';
import '../../../models/menu/sales/customer_info/customer_info_sales_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class ReportMonthly extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(ReportMonthlyController());
    return Obx(() => Scaffold(
      appBar: AppBar(
          title: Text('menu_sub_report_monthly'.tr),
          backgroundColor: context.theme.canvasColor,
          iconTheme: context.theme.iconTheme,
          actions: [
            IconButton(
              icon: OptionBtnVisible(visible: Get.find<ReportMonthlyController>().visible.value),
              onPressed: () {
                Get.find<ReportMonthlyController>().setVisible();
              },
            ),
          ]),
      body: Container(
        color: context.theme.canvasColor,
        child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              children: [
                Visibility(
                    visible: Get.find<ReportMonthlyController>().visible.value,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Column(
                              children: [
                                OptionYearMonthPicker(),
                                OptionCbBranch(),
                                OptionCbEmployee(),
                                OptionCbManager(),
                                OptionCbSalesType(),
                                OptionBtnSearch(ROUTE_MENU_REPORT_MONTHLY),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
                Expanded(
                  flex: Get.find<ReportMonthlyController>().visible.value ? 4 : 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.theme.cardColor,
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
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
    if (Get.find<ReportMonthlyController>().spotListSales.length > 0) {
      return EmptyWidget();
    } else {
      return EmptyWidget();
    }
  }

}

class ReportMonthlyController extends GetxController {
  var controllerCustomerInfoModel;
  var controllerCustomerInfoRepresentativeModel;
  var controllerCustomerInfoEmployeeModel;
  var controllerCustomerInfoSalesModel;

  List<ChartSpot> spotListSales = [];
  List<ChartSpot> spotListBalance = [];

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramCustCode = Get.find<OptionDialogController>().paramCustomerCode.value ?? '';

    var param = user. getClientCode;
    var parsedDataCustomerInfo;
    var parsedDataCustomerInfoRepre;
    var parsedDataCustomerInfoEmp;
    var parsedDataCustomerInfoSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(
          API_SALES + API_SALES_CUSTOMERINFO + '?branch=' + paramBranchCode + '&code=' + paramCustCode);

      if (response.statusCode == 200) {
        spotListSales.clear();
        spotListBalance.clear();

        parsedDataCustomerInfo = await jsonDecode(jsonEncode(response.data))[TAG_DATA];
        parsedDataCustomerInfoRepre = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_REPRESENTATIVE];
        parsedDataCustomerInfoEmp = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_EMPLOYEE];
        parsedDataCustomerInfoSales = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_SALESSUMMARIES] as List;

        controllerCustomerInfoModel = CustomerInfoModel.fromJson(parsedDataCustomerInfo);
        controllerCustomerInfoRepresentativeModel = CustomerInfoRepresentativeModel.fromJson(parsedDataCustomerInfoRepre);
        controllerCustomerInfoEmployeeModel = CustomerInfoEmployeeModel.fromJson(parsedDataCustomerInfoEmp);
        controllerCustomerInfoSalesModel = parsedDataCustomerInfoSales.map((dataJson)=>CustomerInfoSalesModel.fromJson(dataJson)).toList();

        for (var list in parsedDataCustomerInfoSales) {
          spotListSales.add(ChartSpot(list['title'].toString(),  list['sales-amount']));
          spotListBalance.add(ChartSpot(list['title'].toString(),  list['balance']));
        }

        Get.find<ReportMonthlyController>().setVisible();
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
}