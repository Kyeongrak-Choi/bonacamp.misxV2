import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manage.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';
import 'package:misxV2/components/common/list/option_expansion_list.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../models/management/sales_rank_model.dart';
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
          title: Text('매출순위현황'),
          backgroundColor: context.theme.backgroundColor,
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
        color: context.theme.backgroundColor,
        child: Column(
          children: [
            Visibility(
              visible: Get.find<SalesRankController>().visible.value,
              child: Column(
                children: [
                  OptionPeriodPicker(),
                  OptionCbBranch(),
                  OptionCbEmployee(),
                  OptionCbManage(),
                  OptionBtnSearch(ROUTE_MENU_RANKSTATUS),
                ],
              ),
            ),
            Expanded(
              child: OptionExpansionList(ROUTE_MENU_RANKSTATUS),
            ),
          ],
        ),
      ),
    ));
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
    String paramEmployeeCode = Get.find<CbSaleController>().paramEmployeeCode;
    String paramManagementCode = Get.find<CbManageController>().paramManageCode;

    var param = user.getClientCode;
    List parsedDataSalesRank;


    try {
      dio = await reqApi(param);

      final response =
      await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_RANKSTATUS + ''
          '?branch-code=' +
          paramBranchCode +
          '&from-date=' +
          paramFromDate +
          '&to-date=' +
          paramToDate +
          '&employee-code=' +
          paramEmployeeCode +
          '&management-code=' +
          paramManagementCode
      );


      if (response.statusCode == 200) {
        parsedDataSalesRank = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_LIST_OBJECT];

        salesRankList = parsedDataSalesRank.map((element) => SalesRankModel.fromJson(element)).toList();


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
