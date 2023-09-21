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
import '../../../components/common/list/option_expansion_list.dart';
import '../../../models/management/sales_daily_model.dart';
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
              title: Text('appbar_title_overall_status'.tr),
              backgroundColor: context.theme.backgroundColor,
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
            color: context.theme.backgroundColor,
            child: Column(
              children: [
                Visibility(
                  visible: Get.find<SalesDailyController>().visible.value,
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
                Expanded(
                  child: OptionExpansionList(ROUTE_MENU_SALES_DAILY),
                ),
              ],
            ),
          ),
        ));
  }
}

class SalesDailyController extends GetxController {
  var visible = true.obs;
  List<SalesDailyModel> salesDailyList = <SalesDailyModel>[
    SalesDailyModel('2022-09-01', '[15001]참이슬 361ml', '매출', '1', '2', '7000', '3000', '2000', '12000', '80000', '2000', '2000', '2000', '2000',
        '2000', '2000', '2000'),
    SalesDailyModel('2022-09-02', '[15001]참이슬 362ml', '매출', '1', '2', '7000', '3000', '2000', '12000', '80000', '2000', '2000', '2000', '2000',
        '2000', '2000', '2000'),
    SalesDailyModel('2022-09-03', '[15001]참이슬 363ml', '매출', '1', '2', '7000', '3000', '2000', '12000', '80000', '2000', '2000', '2000', '2000',
        '2000', '2000', '2000'),
    SalesDailyModel('2022-09-04', '[15001]참이슬 364ml', '매출', '1', '2', '7000', '3000', '2000', '12000', '80000', '2000', '2000', '2000', '2000',
        '2000', '2000', '2000'),
    SalesDailyModel('2022-09-05', '[15001]참이슬 365ml', '매출', '1', '2', '7000', '3000', '2000', '12000', '80000', '2000', '2000', '2000', '2000',
        '2000', '2000', '2000'),
    SalesDailyModel('2022-09-06', '[15001]참이슬 366ml', '매출', '1', '2', '7000', '3000', '2000', '12000', '80000', '2000', '2000', '2000', '2000',
        '2000', '2000', '2000'),
    SalesDailyModel('2022-09-07', '[15001]참이슬 367ml', '매출', '1', '2', '7000', '3000', '2000', '12000', '80000', '2000', '2000', '2000', '2000',
        '2000', '2000', '2000'),
  ];

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String tempNodeCd = Get.find<CbBranchController>().paramBranchCode;
    String tempDt = DateFormat('yyyyMMdd').format(Get.find<DatePickerController>().date.value).toString();
    String tempEmployeeCode = Get.find<CbSaleController>().paramEmployeeCode;
    String tempTeamCode = Get.find<CbTeamController>().paramTeamCode;

    var param = user.getClientCode;
    var parsedDataSalesDaily;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_MANAGEMENT_DAILYSTATUS +
          '?branch-code=' +
          tempNodeCd +
          '&search-date=' +
          tempDt +
          '&employee-code=' +
          tempEmployeeCode +
          '&team-code=' +
          tempTeamCode);

      if (response.statusCode == 200) {
        parsedDataSalesDaily = await jsonDecode(response)[TAG_DATA][TAG_SALESDAILY_LIST];

        //salesDailyList.add(SalesDailyModel.fromJson(parsedDataSalesDaily));

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
