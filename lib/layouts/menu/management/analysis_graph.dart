import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          appBar:
              AppBar(title: Text('menu_sub_analysis_graph'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible:
                          Get.find<AnalysisGraphController>().visible.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h,
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h),
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
                      height:
                          Get.find<AnalysisGraphController>().visible.value
                              ? BASIC_PADDING.h
                              : 0,
                    ),
                    Expanded(
                      child: Container(
                        child: setChild(),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.w,
                        0.h,
                        BASIC_PADDING * 2.w,
                        0.h),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(
                          visible: Get.find<AnalysisGraphController>()
                              .visible
                              .value),
                      onPressed: () {
                        Get.find<AnalysisGraphController>().setVisible();
                      },
                      //splashColor: CommonColors.primary,
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
    var paramFromYearmonth = setFirstDay(
        Get.find<PeriodYearmonthPickerController>().fromYearMonth.value);
    var paramToYearmonth = setLastDay(
        Get.find<PeriodYearmonthPickerController>().toYearMonth.value);
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

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA]
            [TAG_SALES]) {
          salesList.add(ChartSpot(
              list['date-name'].toString().substring(3, 6), list['total']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA]
            [TAG_GRAPH_BOND]) {
          bondList.add(ChartSpot(
              list['date-name'].toString().substring(3, 6), list['amount']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA]
            [TAG_PURCHASE]) {
          purchaseList.add(ChartSpot(
              list['date-name'].toString().substring(3, 6),
              list['total-supply']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA]
            [TAG_GRAPH_DEBT]) {
          debtList.add(ChartSpot(
              list['date-name'].toString().substring(3, 6), list['amount']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA]
            [TAG_RENTAL]) {
          rentalList.add(ChartSpot(
              list['date-name'].toString().substring(3, 6), list['amount']));
        }

        for (var list in await jsonDecode(jsonEncode(response.data))[TAG_DATA]
            [TAG_ASSET]) {
          assetList.add(ChartSpot(
              list['date-name'].toString().substring(3, 6), list['amount']));
        }

        Get.find<AnalysisGraphController>().setVisible();
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
}
