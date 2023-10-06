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
import '../../../components/datatable/management/sales_daily_item.dart';
import '../../../models/management/sales_daily_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';
import '../../components/common/combobox/option_cb_customer_status.dart';
import '../../components/datatable/vendor_location_item.dart';

class VendorLocation extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(VendorLocationController());
    return Obx(() => Scaffold(
      appBar:
      AppBar(title: Text('menu_sub_vendor_location'.tr),
          backgroundColor: context.theme.cardColor,
          iconTheme: context.theme.iconTheme,
          actions: [
            IconButton(
              icon: OptionBtnVisible(visible: Get.find<VendorLocationController>().visible.value),
              onPressed: () {
                Get.find<VendorLocationController>().setVisible();
              },
            ),
          ]),
      body: Container(
        color: context.theme.cardColor,
        child: Column(
          children: [
            Visibility(
              visible: Get.find<VendorLocationController>().visible.value,
              child: Column(
                children: [
                  OptionDatePicker(),
                  OptionCbEmployee(),
                  OptionCbCustomerStatus(),
                  OptionCbTeam(),
                  OptionBtnSearch(ROUTE_MENU_VENDORLOCATION),
                ],
              ),
            ),
            Expanded(
              child: VendorLocationItem(),
            )
          ],
        ),
      ),
    ));
  }
}

class VendorLocationController extends GetxController {
  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    // UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    // var dio;
    // var parsedData;
    // List dataObjsJson;
    //
    // String paramNodeCd = Get.find<CbBranchController>().paramBranchCode;
    // String paramDt = DateFormat('yyyyMMdd').format(Get.find<DatePickerController>().date.value).toString();
    // String paramEmployeeCode = Get.find<CbSaleController>().paramEmployeeCode;
    // String paramTeamCode = Get.find<CbTeamController>().paramTeamCode;
    //
    // var param = user.getClientCode;
    // var parsedDataSalesDaily;
    //
    // try {
    //   dio = await reqApi(param);
    //   final response = await dio.get(API_MANAGEMENT +
    //       API_MANAGEMENT_DAILYSTATUS +
    //       '?branch-code=' +
    //       paramNodeCd +
    //       '&search-date=' +
    //       paramDt +
    //       '&employee-code=' +
    //       paramEmployeeCode +
    //       '&team-code=' +
    //       paramTeamCode);
    //
    //   if (response.statusCode == 200) {
    //     dataObjsJson = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_LIST_OBJECT] as List;
    //     salesDailyList = dataObjsJson.map((dataJson) => SalesDailyModel.fromJson(dataJson)).toList();
    //     //controllerModel = parsedData;
    //     update();
    //   }
    // } on DioException catch (e) {
    //   if (e.response != null) {
    //     ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
    //   }
    // } catch (e) {
    //   print("other error");
    // }
  }
}