import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/datatable/customer_contribute_table.dart';
import 'package:misxV2/models/management/customer_contribute_model.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/button/option_btn_visible.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_cb_customer.dart';
import '../../../components/common/combobox/option_cb_customer_status.dart';
import '../../../components/common/datepicker/option_year_month_picker.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class CustomerContribute extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(CustomerContributeController());

    return Obx(() => Scaffold(
      appBar: AppBar(
          title: Text('매출처별 기여현황'),
          backgroundColor: context.theme.backgroundColor,
          iconTheme: context.theme.iconTheme,
          actions: [
            IconButton(
              icon: OptionBtnVisible(visible: Get.find<CustomerContributeController>().visible.value),
              onPressed: () {
                Get.find<CustomerContributeController>().setVisible();
              },
            ),
          ]),
      body: Container(
        color: context.theme.backgroundColor,
        child: Column(
          children: [
            Visibility(
              visible: Get.find<CustomerContributeController>().visible.value,
              child: Column(
                children: [
                  OptionYearMonthPicker(),
                  OptionCbBranch(),
                  //OptionDialogCustomer(),
                  OptionBtnSearch(ROUTE_MENU_CONTRIBUTION_STATUS_CUSTOMER),
                ],
              ),
            ),
            Expanded(
              child: CustomerContributeTable(),
            ),
          ],
        ),
      ),
    ));
  }
}

class CustomerContributeController extends GetxController {
  var visible = true.obs;
  var controllerCustomerContribute;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String tempNodeCd = Get.find<CbBranchController>().paramBranchCode;
    String tempYM = DateFormat('yyyyMM').format(Get.find<MonthPickerController>().yearMonth.value).toString();
    String tempCustomerCode = Get.find<CbCustomerController>().paramCustomerCode.value;

    var param = user.getClientCode;
    var parseCustomerContribute;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_MANAGEMENT + API_MANAGEMENT_CONTRIBUTIONCUSTOMER + '?branch-code=' + tempNodeCd + '&search-month=' + tempYM + '&customer-code=' + tempCustomerCode);

      if (response.statusCode == 200) {
        if(jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_OBJECT] != null){
          parseCustomerContribute = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_OBJECT] ?? "";
          controllerCustomerContribute = CustomerContributeModel.fromJson(parseCustomerContribute);

          update();
        }
        else{
          controllerCustomerContribute = null;
        }
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