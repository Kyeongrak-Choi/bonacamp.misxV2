import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_customer_status.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/common/datepicker/option_year_month_picker.dart';
import 'package:misxV2/components/datatable/management/salesperson_contribute_table.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../models/menu/management/salesperson_contribute.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class SalesPersonContribute extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesPersonContributeController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_salesperson_contribute'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: APPBAR_BACKGROUND_COLOR,
              iconTheme: context.theme.iconTheme,
              actions: [
              ]),
          body: Container(
            color: context.theme.canvasColor,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.all(15),
                  child: Column(
                    children: [
                      Visibility(
                        visible: Get.find<SalesPersonContributeController>().visible.value,
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.all(15),
                            child: Column(
                              children: [
                                OptionTwoContent(OptionYearMonthPicker(), OptionCbBranch()),
                                OptionTwoContent(OptionCbEmployee(), OptionCbCustomerStatus()),
                                OptionBtnSearch(ROUTE_MENU_SALESPERSON_CONTRIBUTE),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.find<SalesPersonContributeController>().visible.value ? 20 : 0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.all(15),
                            child: SalesPersonContributeTable(),
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
                      child: OptionBtnVisible(visible: Get.find<SalesPersonContributeController>().visible.value),
                      onPressed: () {
                        Get.find<SalesPersonContributeController>().setVisible();
                      },
                      splashColor: CommonColors.signature,
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

class SalesPersonContributeController extends GetxController {
  var visible = true.obs;
  var controllerModel;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;
    var parsedData;

    var paramClientCd = user.getClientCode;
    var paramNodeCd = Get.find<CbBranchController>().paramBranchCode;
    var paramYM = DateFormat('yyyyMM').format(Get.find<MonthPickerController>().yearMonth.value).toString();
    var paramSalChrgCd = Get.find<CbEmployeeController>().paramEmployeeCode;
    var paramCustStat = Get.find<CbCustomerStatusController>().paramCustomerStatusCode;

    try {
      dio = await reqApi(paramClientCd);

      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_SERVE +
          '?branch=' +
          paramNodeCd +
          '&month=' +
          paramYM +
          '&sales-rep=' +
          paramSalChrgCd +
          '&status=' +
          paramCustStat);

      log('paramNodeCd :' + paramNodeCd);

      if (response.statusCode == 200) {
        if ((parsedData = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerModel = SalesPersonContributeModel.fromJson(parsedData);
        }

        Get.find<SalesPersonContributeController>().setVisible();
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

  void clearValue() {
    controllerModel = null;
  }
}
