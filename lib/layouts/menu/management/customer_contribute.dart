import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/datatable/management/customer_contribute_table.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/button/option_btn_visible.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/datepicker/option_year_month_picker.dart';
import '../../../components/common/dialog/option_dialog.dart';
import '../../../models/menu/management/customer_contribute_model.dart';
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
              title: Text('menu_sub_customer_contribute'.tr),
              backgroundColor: context.theme.canvasColor,
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
            color: context.theme.canvasColor,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Column(
                children: [
                  Visibility(
                    visible: Get.find<CustomerContributeController>().visible.value,
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
                            OptionYearMonthPicker(),
                            OptionCbBranch(),
                            OptionDialog(SEARCH_DIALOG_CUST),
                            OptionBtnSearch(ROUTE_MENU_CONTRIBUTION_STATUS_CUSTOMER),
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
                        child: CustomerContributeTable(),
                      ),
                    ),
                  ),
                ],
              ),
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
    String tempCustomerCode = Get.find<OptionDialogController>().paramCustomerCode.value;

    var param = user.getClientCode;
    var parseCustomerContribute;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_CONTRIBUTIONCUSTOMER +
          '?branch-code=' +
          tempNodeCd +
          '&search-month=' +
          tempYM +
          '&customer-code=' +
          tempCustomerCode);

      if (response.statusCode == 200) {
        if (jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_OBJECT] != null) {
          parseCustomerContribute = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_OBJECT] ?? "";
          controllerCustomerContribute = CustomerContributeModel.fromJson(parseCustomerContribute);

          Get.find<CustomerContributeController>().setVisible();
          update();
        } else {
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
