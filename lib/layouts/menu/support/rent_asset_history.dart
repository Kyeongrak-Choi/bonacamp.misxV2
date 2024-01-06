import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_asset_status.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/datatable/support/rent_asset_history_item.dart';
import '../../../models/menu/support/rent_asset_history_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class RentAssetHistory extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(RentAssetHistoryController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_support_rent_asset_history'.tr),
              actions: []),
          body: Container(
            color: context.theme.canvasColor,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.all(15),
                  child: Column(
                    children: [
                      Visibility(
                        visible: Get.find<RentAssetHistoryController>()
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
                                OptionPeriodPicker(),
                                OptionTwoContent(
                                    OptionCbBranch(), OptionCbAssetStatus()),
                                OptionDialogCustomer(),
                                OptionBtnSearch(
                                    ROUTE_MENU_SUPPORT_RENT_ASSET_HISTORY),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:
                            Get.find<RentAssetHistoryController>().visible.value
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
                            child: ListView(
                              children: <Widget>[setChild()],
                            ),
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
                          visible: Get.find<RentAssetHistoryController>()
                              .visible
                              .value),
                      onPressed: () {
                        Get.find<RentAssetHistoryController>().setVisible();
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

  Widget setChild() {
    if (Get.find<RentAssetHistoryController>().controllerAchievement != null) {
      return RentAssetHistoryItem(
          Get.find<RentAssetHistoryController>().controllerAchievement);
    } else {
      return EmptyWidget();
    }
  }
}

class RentAssetHistoryController extends GetxController {
  var controllerAchievement;

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramFromDate = DateFormat('yyyyMMdd')
        .format(Get.find<PeriodPickerController>().fromDate.value)
        .toString();
    String paramToDate = DateFormat('yyyyMMdd')
        .format(Get.find<PeriodPickerController>().toDate.value)
        .toString();
    String paramCustomerCode =
        Get.find<OptionDialogCustomerController>().paramCustomerCode.value;
    String paramAssetStatus =
        Get.find<CbAssetStatusController>().paramAssetStatusCode;

    var param = user.getClientCode;
    var parsedRentAssetHistory;

    if (paramCustomerCode == '') {
      ShowSnackBar(SNACK_TYPE.INFO, 'must_select_customer'.tr);
      return;
    }

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_SUPPORT +
          API_SUPPORT_RENT_ASSET_HISTORY +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&code=' +
          paramCustomerCode +
          '&type=' +
          paramAssetStatus);

      if (response.statusCode == 200) {
        if ((parsedRentAssetHistory =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerAchievement = parsedRentAssetHistory
              .map((dataJson) => RentAssetHistoryModel.fromJson(dataJson))
              .toList();
        }
        Get.find<RentAssetHistoryController>().setVisible();
        update();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO,
            e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    } catch (e) {
      print(e.toString());
      print("other error");
    }
  }

  void clearValue() {
    controllerAchievement = null;
  }
}
