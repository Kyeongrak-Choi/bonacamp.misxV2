import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/chart/analysis_graph.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_graph_type.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/datepicker/option_period_yearmonth_picker.dart';
import '../../../components/common/emptyWidget.dart';
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
              backgroundColor: context.theme.cardColor,
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
            color: context.theme.cardColor,
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
                    ],
                  ),
                ),
                Expanded(
                  child: setChild(),
                )
                // Expanded(
                //   child: SalesPersonContributeTable(),
                // ),
              ],
            ),
          ),
        ));
  }

  Widget setChild() {
    if (Get.find<AnalysisGraphController>().spotList.length > 0) {
      return AnalysisGraphComponent();
    } else {
      return EmptyWidget();
    }
  }
}

class AnalysisGraphController extends GetxController {
  var visible = true.obs;
  var controllerModel;
  List<FlSpot> spotList = [];

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    var paramClientCd = user.getClientCode;
    var paramNodeCd = Get.find<CbBranchController>().paramBranchCode;
    var paramFromYearmonth = setFirstDay(Get.find<PeriodYearmonthPickerController>().fromYearMonth.value);
    var paramToYearmonth = setLastDay(Get.find<PeriodYearmonthPickerController>().toYearMonth.value);

    var graphType = Get.find<CbGraphTypeController>().paramGraphType;

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
        int index = 1;
        spotList.clear();
        switch (graphType) {
          case "SALES":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_SALES]) {
              spotList.add(FlSpot(double.tryParse(list['search-date']) ?? 0.0, double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            log('result : ' + spotList.toString());
            break;
          case "BOND":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_GRAPH_BOND]) {
              spotList.add(FlSpot(double.tryParse(list['search-date']) ?? 0.0, double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            log('result : ' + spotList.toString());
            break;
          case "PURCHASE":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_PURCHASE]) {
              spotList.add(FlSpot(double.tryParse(list['search-date']) ?? 0.0, double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            log('result : ' + spotList.toString());
            break;
          case "DEBT":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_GRAPH_DEBT]) {
              spotList.add(FlSpot(double.tryParse(list['search-date']) ?? 0.0, double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            log('result : ' + spotList.toString());
            break;
          case "RENTAL":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RENTAL]) {
              spotList.add(FlSpot(double.tryParse(list['search-date']) ?? 0.0, double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            log('result : ' + spotList.toString());
            break;
          case "ASSET":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_ASSET]) {
              spotList.add(FlSpot(double.tryParse(list['search-date']) ?? 0.0, double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            log('result : ' + spotList.toString());
            break;
        }
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
