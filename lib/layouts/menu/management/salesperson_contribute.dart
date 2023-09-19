
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_customer.dart';
import 'package:misxV2/components/common/combobox/option_cb_customer_status.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';

import 'package:misxV2/components/common/datepicker/option_year_month_picker.dart';
import 'package:misxV2/models/management/salesperson_contribute.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/datatable/overall_table.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';


class SalesPersonContribute extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesPersonContributeController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_salesperson_contribute'.tr),
              backgroundColor: context.theme.backgroundColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<SalesPersonContributeController>().visible.value),
                  onPressed: () {
                    Get.find<SalesPersonContributeController>().setVisible();
                  },
                ),
              ]),
          body: Container(
            color: context.theme.backgroundColor,
            child: Column(
              children: [
                Visibility(
                  visible: Get.find<SalesPersonContributeController>().visible.value,
                  child: Column(
                    children: [
                      OptionYearMonthPicker(),
                      OptionCbBranch(),
                      OptionCbEmployee(),
                      OptionCbCustomerStatus(),
                      OptionBtnSearch(ROUTE_MENU_OVERALL_STATUS),
                    ],
                  ),
                ),
                Expanded(
                  child: OverAllTable(),
                ),
              ],
            ),
          ),
        ));
  }
}

class SalesPersonContributeController extends GetxController {

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    var paramClientCd = user.getClientCode;
    var paramNodeCd = Get.find<CbBranchController>().paramBranchCode;
    var paramYM = DateFormat('yyyyMM').format(Get.find<MonthPickerController>().yearMonth.value).toString();
    var paramSalChrgCd = Get.find<CbSaleController>().paramEmployeeCode;
    var paramCustStat = Get.find<CbCustomerStatusController>().paramCustStat;

    var controllerModel;

    try {
      dio = await reqApi(paramClientCd);
      final response = await dio.get(API_MANAGEMENT_SALESPERSONCONTRIBUTE
          + '?nodeCd=' + paramNodeCd
          + '&month=' + paramYM
          + '&salChrgCd=' + paramSalChrgCd
          + '&custStat=' + paramCustStat);

      if (response.statusCode == 200) {
        controllerModel = SalesPersonContributeModel.fromJson(await jsonDecode(response)[TAG_DATA][TAG_DATA]);
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
