import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_customer_status.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_graph_type.dart';
import 'package:misxV2/components/common/datepicker/option_year_month_picker.dart';
import 'package:misxV2/components/dashboard/dashboard_chart.dart';
import 'package:misxV2/components/datatable/management/salesperson_contribute_table.dart';
import 'package:misxV2/models/management/salesperson_contribute.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/datepicker/option_period_yearmonth_picker.dart';
import '../../../components/dashboard/dashboard_chart2.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class AnalysisGraph extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(AnalysisGraphController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_analysis_graph'.tr),
              backgroundColor: context.theme.backgroundColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<AnalysisGraphController>().visible.value),
                  onPressed: () {
                    Get.find<AnalysisGraphController>().setVisible();
                  },
                ),
              ]),
          body: Container(
            color: context.theme.backgroundColor,
            child: Column(
              children: [
                Visibility(
                  visible: Get.find<AnalysisGraphController>().visible.value,
                  child: Column(
                    children: [
                      OptionPeriodYearmonthPicker(),
                      OptionCbBranch(),
                      OptionCbGraphType(),
                      OptionBtnSearch(ROUTE_MENU_GRAPH),
                      DashBoardChart2(),
                    ],
                  ),
                ),
                // Expanded(
                //   child: SalesPersonContributeTable(),
                // ),
              ],
            ),
          ),
        ));
  }
}

class AnalysisGraphController extends GetxController {
  var visible = true.obs;
  var controllerModel;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;
    var parsedData;

    var paramClientCd = user.getClientCode;
    var paramNodeCd = Get.find<CbBranchController>().paramBranchCode;
    var paramFromYearmonth = setFirstDay(Get.find<PeriodYearmonthPickerController>().fromYearMonth.value);
    var paramToYearmonth = setLastDay(Get.find<PeriodYearmonthPickerController>().toYearMonth.value);

    getFirstDay();

    try {
      dio = await reqApi(paramClientCd);

      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_GRAPH +
          '?branch-code=' +
          paramNodeCd +
          '&from-date=' +
          paramFromYearmonth +
          '&to-date=' +
          paramToYearmonth);

      if (response.statusCode == 200) {
        log('response : ' + response.data.toString());
        parsedData = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_OBJECT];
        log('parsedData : ' + parsedData.toString());
        controllerModel = SalesPersonContributeModel.fromJson(parsedData);

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
}
