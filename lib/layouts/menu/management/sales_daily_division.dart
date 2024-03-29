import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/common/datepicker/option_date_picker.dart';
import 'package:misxV2/components/common/field/icon_title_three_field.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/button/option_btn_visible.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_cb_team.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/management/sales_daily_division_item.dart';
import '../../../models/menu/management/sales_daily_division_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class SalesDailyDivision extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesDailyDivisionController());
    var divisionController = Get.find<SalesDailyDivisionController>();
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_salesdaily_division'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: !divisionController.visible.value,
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
                              SumTitleTable('일자 합계', controller: Get.find<SalesDailyDivisionController>(),),
                              Visibility(
                                visible: Get.find<SalesDailyDivisionController>().sumTableVisible.value,
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
                                              child: Text(
                                                '',
                                                style: context.textTheme.bodyMedium,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
                                              child: Text(
                                                'BOX',
                                                style: context.textTheme.bodyMedium,
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
                                              child: Text(
                                                'EA',
                                                style: context.textTheme.bodyMedium,
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
                                              child: Text(
                                                '금액',
                                                style: context.textTheme.bodyMedium,
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ),
                                        ]),
                                    IconTitleThreeField(
                                      titleName: '유흥합계',
                                      iconData: Icons.label_outlined,
                                      value1: numberFormat
                                          .format(divisionController.pleasureBoxSum),
                                      value2: numberFormat.format(
                                          divisionController.pleasureBottleSum),
                                      value3: numberFormat.format(
                                          divisionController.pleasureAmountSum) + ' 원',
                                    ),
                                    IconTitleThreeField(
                                      titleName: '일반합계',
                                      iconData: Icons.label_outlined,
                                      value1: numberFormat
                                          .format(divisionController.normalBoxSum),
                                      value2: numberFormat
                                          .format(divisionController.normalBottleSum),
                                      value3: numberFormat
                                          .format(divisionController.normalAmountSum) + ' 원',
                                    ),
                                    IconTitleThreeField(
                                      titleName: '합     계',
                                      iconData: Icons.label_outlined,
                                      value1: numberFormat
                                          .format(divisionController.totBoxSum),
                                      value2: numberFormat
                                          .format(divisionController.totBottleSum),
                                      value3: numberFormat
                                          .format(divisionController.totAmountSum) + ' 원',
                                    ),
                                    IconTitleThreeField(
                                      titleName: '유흥누계',
                                      iconData: Icons.label_outlined,
                                      value1: numberFormat.format(
                                          divisionController.pleasureBoxQuantity),
                                      value2: numberFormat.format(
                                          divisionController.pleasureBottleQuantity),
                                      value3: numberFormat.format(
                                          divisionController.pleasureAmountQuantity) + ' 원',
                                    ),
                                    IconTitleThreeField(
                                      titleName: '일반누계',
                                      iconData: Icons.label_outlined,
                                      value1: numberFormat.format(
                                          divisionController.normalBoxQuantity),
                                      value2: numberFormat.format(
                                          divisionController.normalBottleQuantity),
                                      value3: numberFormat.format(
                                          divisionController.normalAmountQuantity) + ' 원',
                                    ),
                                    IconTitleThreeField(
                                      titleName: '누     계',
                                      iconData: Icons.label_outlined,
                                      value1: numberFormat
                                          .format(divisionController.totBoxQuantity),
                                      value2: numberFormat.format(
                                          divisionController.totBottleQuantity),
                                      value3: numberFormat.format(
                                          divisionController.totAmountQuantity) + ' 원',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Visibility(
                            visible: divisionController.visible.value,
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
                                    OptionTwoContent(
                                        OptionDatePicker(), OptionCbBranch()),
                                    OptionTwoContent(
                                        OptionCbEmployee(), OptionCbTeam()),
                                    OptionBtnSearch(
                                        ROUTE_MENU_DIVISIONSTATUS),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: BASIC_PADDING.h,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: ListView(
                                children: <Widget>[setChild()],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          visible: Get.find<SalesDailyDivisionController>()
                              .visible
                              .value),
                      onPressed: () {
                        Get.find<SalesDailyDivisionController>().setVisible();
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
    if (Get.find<SalesDailyDivisionController>().salesDailyDivisionList !=
        null) {
      return SalesDailyDivisionItem(
          Get.find<SalesDailyDivisionController>().salesDailyDivisionList);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesDailyDivisionController extends GetxController {
  var visible = true.obs;
  var sumTableVisible = true.obs;
  var salesDailyDivisionList;

  int pleasureBoxSum = 0;
  int pleasureBottleSum = 0;
  int pleasureAmountSum = 0;
  int normalBoxSum = 0;
  int normalBottleSum = 0;
  int normalAmountSum = 0;
  int totBoxSum = 0;
  int totBottleSum = 0;
  int totAmountSum = 0;

  int pleasureBoxQuantity = 0;
  int pleasureBottleQuantity = 0;
  int pleasureAmountQuantity = 0;
  int normalBoxQuantity = 0;
  int normalBottleQuantity = 0;
  int normalAmountQuantity = 0;
  int totBoxQuantity = 0;
  int totBottleQuantity = 0;
  int totAmountQuantity = 0;

  setVisible() async {
    visible.value = !visible.value;
  }

  setSumTableVisible() async {
    sumTableVisible.value = !sumTableVisible.value;
  }

  Future calBoxBottleSum() async {
    if (salesDailyDivisionList == null) {
      pleasureBoxSum = 0;
      pleasureBottleSum = 0;
      pleasureAmountSum = 0;
      normalBoxSum = 0;
      normalBottleSum = 0;
      normalAmountSum = 0;
      totBoxSum = 0;
      totBottleSum = 0;
      totAmountSum = 0;
      pleasureBoxQuantity = 0;
      pleasureBottleQuantity = 0;
      pleasureAmountQuantity = 0;
      normalBoxQuantity = 0;
      normalBottleQuantity = 0;
      normalAmountQuantity = 0;
      totBoxQuantity = 0;
      totBottleQuantity = 0;
      totAmountQuantity = 0;
      return;
    }

    int tmpPleasureBoxSum = 0;
    int tmpPleasureBottleSum = 0;
    int tmpPleasureAmountSum = 0;
    int tmpNormalBoxSum = 0;
    int tmpNormalBottleSum = 0;
    int tmpNormalAmountSum = 0;

    for (SalesDailyDivisionModel tmpObject in salesDailyDivisionList) {
      if (tmpObject.itemCode == null) {
        continue;
      }
      if (tmpObject.usageCode == '1') {
        tmpNormalBoxSum += tmpObject.boxQuantity as int;
        tmpNormalBottleSum += tmpObject.bottleQuantity as int;
        tmpNormalAmountSum += tmpObject.amount as int;
      } else if (tmpObject.usageCode == '2') {
        tmpPleasureBoxSum += tmpObject.boxQuantity as int;
        tmpPleasureBottleSum += tmpObject.bottleQuantity as int;
        tmpPleasureAmountSum += tmpObject.amount as int;
      }
    }

    pleasureBoxSum = tmpPleasureBoxSum;
    pleasureBottleSum = tmpPleasureBottleSum;
    pleasureAmountSum = tmpPleasureAmountSum;
    normalBoxSum = tmpNormalBoxSum;
    normalBottleSum = tmpNormalBottleSum;
    normalAmountSum = tmpNormalAmountSum;

    totBoxSum = tmpPleasureBoxSum + tmpNormalBoxSum;
    totBottleSum = tmpPleasureBottleSum + tmpNormalBottleSum;
    totAmountSum = tmpPleasureAmountSum + tmpNormalAmountSum;

    pleasureBoxQuantity = salesDailyDivisionList[0].pleasureBoxTotalQuantity;
    pleasureBottleQuantity =
        salesDailyDivisionList[0].pleasureBottleTotalQuantity;
    pleasureAmountQuantity = salesDailyDivisionList[0].pleasureTotalAmount;
    normalBoxQuantity = salesDailyDivisionList[0].normalBoxTotalQuantity;
    normalBottleQuantity = salesDailyDivisionList[0].normalBottleTotalQuantity;
    normalAmountQuantity = salesDailyDivisionList[0].normalTotalAmount;
    totBoxQuantity = salesDailyDivisionList[0].boxTotalQuantity;
    totBottleQuantity = salesDailyDivisionList[0].bottleTotalQuantity;
    totAmountQuantity = salesDailyDivisionList[0].totalAmount;

    update();
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;
    List dataObjsJson;

    String paramNodeCd = Get.find<CbBranchController>().paramBranchCode;
    String paramDt = DateFormat('yyyyMMdd')
        .format(Get.find<DatePickerController>().date.value)
        .toString();
    String paramEmployeeCode =
        Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramTeamCode = Get.find<CbTeamController>().paramTeamCode;

    var param = user.getClientCode;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_DIVISIONSTATUS +
          '?branch=' +
          paramNodeCd +
          '&search=' +
          paramDt +
          '&sales-rep=' +
          paramEmployeeCode +
          '&team=' +
          paramTeamCode);

      if (response.statusCode == 200) {
        if ((dataObjsJson =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          salesDailyDivisionList = dataObjsJson
              .map((dataJson) => SalesDailyDivisionModel.fromJson(dataJson))
              .toList();
        }

        Get.find<SalesDailyDivisionController>().setVisible();
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
    salesDailyDivisionList = null;
  }
}
