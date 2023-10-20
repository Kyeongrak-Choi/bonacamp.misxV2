import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manager.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/datatable/management/sales_rank_Item.dart';
import '../../../models/menu/management/sales_rank_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class SalesRank extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesRankController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_sales_rank'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: context.theme.canvasColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<SalesRankController>().visible.value),
                  onPressed: () {
                    Get.find<SalesRankController>().setVisible();
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
                    visible: Get.find<SalesRankController>().visible.value,
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
                            OptionPeriodPicker(),
                            SizedBox(
                              height: 5,
                            ),
                            OptionCbBranch(),
                            SizedBox(
                              height: 5,
                            ),
                            OptionTwoContent(OptionCbEmployee(), OptionCbManager()),
                            SizedBox(
                              height: 5,
                            ),
                            OptionBtnSearch(ROUTE_MENU_RANKSTATUS),
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
    if (Get.find<SalesRankController>().controllerSalesRank != null) {
      return SalesRankItem(Get.find<SalesRankController>().controllerSalesRank);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesRankController extends GetxController {
  var controllerSalesRank;
  List<SalesRankModel> salesRankList = <SalesRankModel>[].obs;

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramFromDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().fromDate.value).toString();
    String paramToDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().toDate.value).toString();
    String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramManagementCode = Get.find<CbEmployeeController>().paramEmployeeCode;

    var param = user.getClientCode;
    List parsedDataSalesRank;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_RANKSTATUS +
          '?branch-code=' +
          paramBranchCode +
          '&from-date=' +
          paramFromDate +
          '&to-date=' +
          paramToDate +
          '&employee-code=' +
          paramEmployeeCode +
          '&management-code=' +
          paramManagementCode);

      if (response.statusCode == 200) {
        parsedDataSalesRank = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_LIST_OBJECT];
        salesRankList = parsedDataSalesRank.map((element) => SalesRankModel.fromJson(element)).toList();
        Get.find<SalesRankController>().setVisible();
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