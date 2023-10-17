import 'dart:convert';

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
import '../../../components/datatable/management/sales_daily_Item.dart';
import '../../../models/menu/management/sales_daily_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class SalesDaily extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesDailyController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_salesdaily'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: context.theme.canvasColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<SalesDailyController>().visible.value),
                  onPressed: () {
                    Get.find<SalesDailyController>().setVisible();
                  },
                ),
              ]),
          body: Container(
            color: context.theme.canvasColor,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Column(
                children: [
                  Visibility(
                      visible: Get.find<SalesDailyController>().visible.value,
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
                              OptionBtnSearch(ROUTE_MENU_SALES_DAILY),
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
    if (Get.find<SalesDailyController>().salesDailyList != null) {
      return SalesDailyItem(Get.find<SalesDailyController>().salesDailyList);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesDailyController extends GetxController {
  var visible = true.obs;
  var salesDailyList;
  var controllerModel;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;
    var parsedData;
    List dataObjsJson;

    String paramNodeCd = Get.find<CbBranchController>().paramBranchCode;
    String paramDt = DateFormat('yyyyMMdd').format(Get.find<DatePickerController>().date.value).toString();
    String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramTeamCode = Get.find<CbTeamController>().paramTeamCode;

    var param = user.getClientCode;
    var parsedDataSalesDaily;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_DAILYSTATUS +
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
        salesDailyList = dataObjsJson.map((dataJson) => SalesDailyModel.fromJson(dataJson)).toList();
        Get.find<SalesDailyController>().setVisible();
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
