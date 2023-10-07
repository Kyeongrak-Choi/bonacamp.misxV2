import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/datepicker/option_date_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/button/option_btn_visible.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_cb_team.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/show_double_value_field.dart';
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
              title: Text('menu_sub_salesdaily_division'.tr),
              backgroundColor: context.theme.canvasColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: divisionController.visible.value),
                  onPressed: () {
                    divisionController.setVisible();
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
                    visible: divisionController.visible.value,
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
                            OptionDatePicker(),
                            OptionCbBranch(),
                            OptionCbEmployee(),
                            OptionCbTeam(),
                            OptionBtnSearch(ROUTE_MENU_DIVISIONSTATUS),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: divisionController.visible.value == true ? 1 : 2,
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
                            child: ListView(
                              children: <Widget>[setChild()],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
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
                        child: Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                child: ShowDoubleValueField(null, '수량\n(BOX/EA)', '금액'),
                              ),
                              Expanded(
                                child: ShowDoubleValueField('유흥합계', divisionController.pleasureBoxSum + ' / ' + divisionController.pleasureBottleSum,
                                    divisionController.pleasureAmountSum),
                              ),
                              Expanded(
                                child: ShowDoubleValueField(
                                    '일반합계', divisionController.normalBoxSum + ' / ' + divisionController.normalBottleSum, divisionController.normalAmountSum),
                              ),
                              Expanded(
                                child: ShowDoubleValueField(
                                    '합 계', divisionController.totBoxSum + ' / ' + divisionController.totBottleSum, divisionController.totAmountSum),
                              ),
                              Expanded(
                                child: ShowDoubleValueField(
                                    '유흥누계',
                                    divisionController.pleasureBoxQuantity + ' / ' + divisionController.pleasureBottleQuantity,
                                    divisionController.pleasureAmountQuantity),
                              ),
                              Expanded(
                                child: ShowDoubleValueField('일반누계', divisionController.normalBoxQuantity + ' / ' + divisionController.normalBottleQuantity,
                                    divisionController.normalAmountQuantity),
                              ),
                              Expanded(
                                child: ShowDoubleValueField('누계', divisionController.totBoxQuantity + ' / ' + divisionController.totBottleQuantity,
                                    divisionController.totAmountQuantity),
                              ),
                            ],
                          ),
                        ),
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
    if (Get.find<SalesDailyDivisionController>().salesDailyDivisionList != null) {
      log('check : ' + Get.find<SalesDailyDivisionController>().salesDailyDivisionList.toString());
      return SalesDailyDivisionItem(Get.find<SalesDailyDivisionController>().salesDailyDivisionList);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesDailyDivisionController extends GetxController {
  var visible = true.obs;
  var salesDailyDivisionList;

  String pleasureBoxSum = '0';
  String pleasureBottleSum = '0';
  String pleasureAmountSum = '0';
  String normalBoxSum = '0';
  String normalBottleSum = '0';
  String normalAmountSum = '0';
  String totBoxSum = '0';
  String totBottleSum = '0';
  String totAmountSum = '0';

  String pleasureBoxQuantity = '0';
  String pleasureBottleQuantity = '0';
  String pleasureAmountQuantity = '0';
  String normalBoxQuantity = '0';
  String normalBottleQuantity = '0';
  String normalAmountQuantity = '0';
  String totBoxQuantity = '0';
  String totBottleQuantity = '0';
  String totAmountQuantity = '0';

  setVisible() async {
    visible.value = !visible.value;
  }

  Future calBoxBottleSum() async {
    var f = NumberFormat('###,###,###,###');
    if (salesDailyDivisionList == null) {
      pleasureBoxSum = '0';
      pleasureBottleSum = '0';
      pleasureAmountSum = '0';
      normalBoxSum = '0';
      normalBottleSum = '0';
      normalAmountSum = '0';
      totBoxSum = '0';
      totBottleSum = '0';
      totAmountSum = '0';
      pleasureBoxQuantity = '0';
      pleasureBottleQuantity = '0';
      pleasureAmountQuantity = '0';
      normalBoxQuantity = '0';
      normalBottleQuantity = '0';
      normalAmountQuantity = '0';
      totBoxQuantity = '0';
      totBottleQuantity = '0';
      totAmountQuantity = '0';
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
        tmpNormalBoxSum += int.parse(tmpObject.boxQuantity ?? '0');
        tmpNormalBottleSum += int.parse(tmpObject.bottleQuantity ?? '0');
        tmpNormalAmountSum += int.parse(tmpObject.amount ?? '0');
      } else if (tmpObject.usageCode == '2') {
        tmpPleasureBoxSum += int.parse(tmpObject.boxQuantity ?? '0');
        tmpPleasureBottleSum += int.parse(tmpObject.bottleQuantity ?? '0');
        tmpPleasureAmountSum += int.parse(tmpObject.amount ?? '0');
      }
    }

    pleasureBoxSum = tmpPleasureBoxSum.toString();
    pleasureBottleSum = tmpPleasureBottleSum.toString();
    pleasureAmountSum = f.format(tmpPleasureAmountSum);
    normalBoxSum = tmpNormalBoxSum.toString();
    normalBottleSum = tmpNormalBottleSum.toString();
    normalAmountSum = f.format(tmpNormalAmountSum);

    totBoxSum = (tmpPleasureBoxSum + tmpNormalBoxSum).toString();
    totBottleSum = (tmpPleasureBottleSum + tmpNormalBottleSum).toString();
    totAmountSum = f.format((tmpPleasureAmountSum + tmpNormalAmountSum));

    pleasureBoxQuantity = salesDailyDivisionList[0].pleasureBoxTotalQuantity ?? '0';
    pleasureBottleQuantity = salesDailyDivisionList[0].pleasureBottleTotalQuantity ?? '0';
    pleasureAmountQuantity = f.format(int.parse(salesDailyDivisionList[0].pleasureTotalAmount ?? '0'));
    normalBoxQuantity = salesDailyDivisionList[0].normalBoxTotalQuantity ?? '0';
    normalBottleQuantity = salesDailyDivisionList[0].normalBottleTotalQuantity ?? '0';
    normalAmountQuantity = f.format(int.parse(salesDailyDivisionList[0].normalTotalAmount ?? '0'));
    totBoxQuantity = salesDailyDivisionList[0].boxTotalQuantity ?? '0';
    totBottleQuantity = salesDailyDivisionList[0].bottleTotalQuantity ?? '0';
    totAmountQuantity = f.format(int.parse(salesDailyDivisionList[0].totalAmount ?? '0'));

    update();
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;
    var parsedData;
    List dataObjsJson;

    String paramNodeCd = Get.find<CbBranchController>().paramBranchCode;
    String paramDt = DateFormat('yyyyMMdd').format(Get.find<DatePickerController>().date.value).toString();
    String paramEmployeeCode = Get.find<CbSaleController>().paramEmployeeCode;
    String paramTeamCode = Get.find<CbTeamController>().paramTeamCode;

    var param = user.getClientCode;
    var parsedDataSalesDaily;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_DIVISIONSTATUS +
          '?branch-code=' +
          paramNodeCd +
          '&search-date=' +
          paramDt +
          '&employee-code=' +
          paramEmployeeCode +
          '&team-code=' +
          paramTeamCode);

      if (response.statusCode == 200) {
        dataObjsJson = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_LIST_OBJECT] as List;
        salesDailyDivisionList = dataObjsJson.map((dataJson) => SalesDailyDivisionModel.fromJson(dataJson)).toList();
        Get.find<SalesDailyDivisionController>().setVisible();
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
