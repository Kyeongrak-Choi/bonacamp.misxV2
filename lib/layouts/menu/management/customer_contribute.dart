import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/datatable/management/customer_contribute_table.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/button/option_btn_visible.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/datepicker/option_year_month_picker.dart';
import '../../../components/common/dialog/customer/option_dialog_customer.dart';
import '../../../models/menu/management/customer_contribute_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class CustomerContribute extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(CustomerContributeController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_customer_contribute'.tr), actions: []),
          body: Container(
            color: context.theme.canvasColor,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.all(15),
                  child: Column(
                    children: [
                      Visibility(
                        visible: Get.find<CustomerContributeController>()
                            .visible
                            .value,
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.all(15),
                            child: Column(
                              children: [
                                OptionTwoContent(
                                    OptionYearMonthPicker(), OptionCbBranch()),
                                OptionDialogCustomer(),
                                OptionBtnSearch(
                                    ROUTE_MENU_CONTRIBUTION_STATUS_CUSTOMER),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.find<CustomerContributeController>()
                                .visible
                                .value
                            ? 20
                            : 0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.all(15),
                            child: CustomerContributeTable(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(
                          visible: Get.find<CustomerContributeController>()
                              .visible
                              .value),
                      onPressed: () {
                        Get.find<CustomerContributeController>().setVisible();
                      },
                      splashColor: CommonColors.primary,
                      backgroundColor: Colors.white,
                      elevation: 1,
                    ),
                  ),
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
    String tempYM = DateFormat('yyyyMM')
        .format(Get.find<MonthPickerController>().yearMonth.value)
        .toString();
    String tempCustomerCode =
        Get.find<OptionDialogCustomerController>().paramCustomerCode.value;

    var param = user.getClientCode;
    var parseCustomerContribute;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_CONTRIBUTIONCUSTOMER +
          '?branch=' +
          tempNodeCd +
          '&month=' +
          tempYM +
          '&customer=' +
          tempCustomerCode);

      if (response.statusCode == 200) {
        if ((parseCustomerContribute =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerCustomerContribute =
              CustomerContributeModel.fromJson(parseCustomerContribute);
        }

        Get.find<CustomerContributeController>().setVisible();
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
    controllerCustomerContribute = null;
  }
}
