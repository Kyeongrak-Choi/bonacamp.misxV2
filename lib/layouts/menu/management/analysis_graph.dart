import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/chart/analysis_graph.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_graph_type.dart';
import 'package:misxV2/models/common/chart_spot.dart';

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
              backgroundColor: context.theme.canvasColor,
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
            color: context.theme.canvasColor,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Column(
                children: [
                  Visibility(
                    visible: Get.find<AnalysisGraphController>().visible.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            OptionPeriodYearmonthPicker(),
                            OptionCbBranch(),
                            OptionCbGraphType(),
                            OptionBtnSearch(ROUTE_MENU_GRAPH),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: setChild(),
                      ),
                    ),
                  )
                ],
              ),
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
  List<ChartSpot> spotList = [];

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
              spotList.add(ChartSpot(list['date-name'].toString().substring(3,6),  double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            break;
          case "BOND":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_GRAPH_BOND]) {
              spotList.add(ChartSpot(list['date-name'].toString().substring(3,6),  double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            break;
          case "PURCHASE":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_PURCHASE]) {
              spotList.add(ChartSpot(list['date-name'].toString().substring(3,6),  double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            break;
          case "DEBT":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_GRAPH_DEBT]) {
              spotList.add(ChartSpot(list['date-name'].toString().substring(3,6),  double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            break;
          case "RENTAL":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RENTAL]) {
              spotList.add(ChartSpot(list['date-name'].toString().substring(3,6),  double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            break;
          case "ASSET":
            for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_ASSET]) {
              spotList.add(ChartSpot(list['date-name'].toString().substring(3,6),  double.tryParse(list['amount']) ?? 0.0));
              index++;
            }
            break;
        }
        Get.find<AnalysisGraphController>().setVisible();
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
