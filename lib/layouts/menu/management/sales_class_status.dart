import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';
import 'package:misxV2/components/common/emptyWidget.dart';
import 'package:misxV2/components/datatable/management/sales_class_status_item.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../models/menu/management/sales_class_status.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class SalesClassStatus extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesClassStatusController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_sales_class_status'.tr),
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
                        visible: Get.find<SalesClassStatusController>().visible.value,
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
                                OptionPeriodPicker(),
                                OptionCbBranch(),
                                OptionBtnSearch(ROUTE_MENU_CLASSSTATUS),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.find<SalesClassStatusController>().visible.value ? 20 : 0,
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
                            child: ListView(
                              children: <Widget>[setChild()],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(visible: Get.find<SalesClassStatusController>().visible.value),
                      onPressed: () {
                        Get.find<SalesClassStatusController>().setVisible();
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

  Widget setChild() {
    if (Get.find<SalesClassStatusController>().controllerModel != null) {
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

    try {
      dio = await reqApi(paramClientCd);

      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_CLASSSTATUS +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&customer=' +
          '');

      if (response.statusCode == 200) {
        if ((dataObjsJson = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerModel = dataObjsJson.map((dataJson) => SalesClassStatusModel.fromJson(dataJson)).toList();
        }

        Get.find<SalesClassStatusController>().setVisible();
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

  void clearValue() {
    controllerModel = null;
  }
}
