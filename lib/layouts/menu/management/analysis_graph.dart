import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/chart/analysis_graph.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
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
              titleTextStyle: context.textTheme.displayLarge,
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
              padding: EdgeInsetsDirectional.all(20),
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
                        padding: EdgeInsetsDirectional.all(20),
                        child: Column(
                          children: [
                            OptionPeriodYearmonthPicker(true),
                            OptionCbBranch(),
                            OptionBtnSearch(ROUTE_MENU_GRAPH),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.find<AnalysisGraphController>().visible.value ? 20 : 0,
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
    if (Get.find<AnalysisGraphController>().salesList.length > 0) {
      return AnalysisGraphComponent();
    } else {
      return EmptyWidget();
    }
  }
}

class AnalysisGraphController extends GetxController {
  var visible = true.obs;
  var controllerModel;

  List<ChartSpot> salesList = [];
  List<ChartSpot> bondList = [];
  List<ChartSpot> purchaseList = [];
  List<ChartSpot> debtList = [];
  List<ChartSpot> rentalList = [];
  List<ChartSpot> assetList = [];

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
    //var graphType = Get.find<CbGraphTypeController>().paramGraphType;

    try {
      dio = await reqApi(paramClientCd);

      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_GRAPH +
          '?branch=' +
          paramNodeCd +
          '&from=' +
          paramFromYearmonth +
          '&to=' +
          paramToYearmonth);

      if (response.statusCode == 200) {
        salesList.clear();
        bondList.clear();
        purchaseList.clear();
        debtList.clear();
        rentalList.clear();
        assetList.clear();

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_SALES]) {
          salesList.add(ChartSpot(list['date-name'].toString().substring(3, 6), list['total']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_GRAPH_BOND]) {
          bondList.add(ChartSpot(list['date-name'].toString().substring(3, 6), list['amount']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_PURCHASE]) {
          purchaseList.add(ChartSpot(list['date-name'].toString().substring(3, 6), list['total-supply']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_GRAPH_DEBT]) {
          debtList.add(ChartSpot(list['date-name'].toString().substring(3, 6), list['amount']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RENTAL]) {
          rentalList.add(ChartSpot(list['date-name'].toString().substring(3, 6), list['amount']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_ASSET]) {
          assetList.add(ChartSpot(list['date-name'].toString().substring(3, 6), list['amount']));
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
