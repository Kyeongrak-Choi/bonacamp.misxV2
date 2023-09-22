import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';
import 'package:misxV2/components/common/dialog/option_dialog.dart';
import 'package:misxV2/components/common/emptyWidget.dart';
import 'package:misxV2/components/datatable/management/sales_class_status_item.dart';
import 'package:misxV2/models/management/sales_class_status.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class SalesClassStatus extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesClassStatusController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_sales_class_status'.tr),
              backgroundColor: context.theme.backgroundColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<SalesClassStatusController>().visible.value),
                  onPressed: () {
                    Get.find<SalesClassStatusController>().setVisible();
                  },
                ),
              ]),
          body: Container(
            color: context.theme.backgroundColor,
            child: Column(
              children: [
                Visibility(
                  visible: Get.find<SalesClassStatusController>().visible.value,
                  child: Column(
                    children: [
                      OptionPeriodPicker(),
                      OptionCbBranch(),
                      OptionDialog(SEARCH_DIALOG_PRCH),
                      OptionBtnSearch(ROUTE_MENU_CLASSSTATUS),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[setChild()],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget setChild() {
    if (Get.find<SalesClassStatusController>().controllerModel != null) {
      log('check : ' + Get.find<SalesClassStatusController>().controllerModel.toString());
      return SalesClassStatusItem(Get.find<SalesClassStatusController>().controllerModel);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesClassStatusController extends GetxController {
  var visible = true.obs;
  var controllerModel;

  @override
  void onInit() {
    super.onInit();
  }

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;
    var parsedData;
    var dataObjsJson;

    var paramClientCd = user.getClientCode;
    var paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    var paramFromDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().fromDate.value).toString();
    var paramToDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().toDate.value).toString();
    var paramCode = Get.find<OptionDialogController>().paramCode;

    try {
      dio = await reqApi(paramClientCd);

      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_CLASSSTATUS +
          '?branch-code=' +
          paramBranchCode +
          '&from-date=' +
          paramFromDate +
          '&to-date=' +
          paramToDate +
          '&customer-code=' +
          paramCode);

      if (response.statusCode == 200) {
        dataObjsJson = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN_LIST_OBJECT] as List;
        parsedData = dataObjsJson.map((dataJson) => SalesClassStatusModel.fromJson(dataJson)).toList();
        controllerModel = parsedData;
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
