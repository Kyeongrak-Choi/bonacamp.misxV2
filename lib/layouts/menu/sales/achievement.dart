import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/datepicker/option_period_yearmonth_picker.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/datatable/sales/achievement_item.dart';
import '../../../models/menu/sales/achievement/achievement_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class Achievement extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(AchievementController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_achievement'.tr),
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
                        visible: Get.find<AchievementController>().visible.value,
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
                                OptionPeriodYearmonthPicker(false),
                                OptionTwoContent(OptionCbBranch(), OptionCbEmployee()),
                                OptionBtnSearch(ROUTE_MENU_ACHIEVEMENT),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.find<AchievementController>().visible.value ? 20 : 0,
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
                      child: OptionBtnVisible(visible: Get.find<AchievementController>().visible.value),
                      onPressed: () {
                        Get.find<AchievementController>().setVisible();
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
    if (Get.find<AchievementController>().controllerAchievement != null) {
      return AchievementItem(Get.find<AchievementController>().controllerAchievement);
    } else {
      return EmptyWidget();
    }
  }
}

class AchievementController extends GetxController {
  var controllerAchievement;

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramFromYearmonth = setFirstDay(Get.find<PeriodYearmonthPickerController>().fromYearMonth.value);
    String paramToYearmonth = setLastDay(Get.find<PeriodYearmonthPickerController>().toYearMonth.value);
    String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;

    var param = user.getClientCode;
    var parsedAchievement;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_SALES +
          API_SALES_ACHIEVEMENT +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromYearmonth +
          '&to=' +
          paramToYearmonth +
          '&sales-rep=' +
          paramEmployeeCode);

      if (response.statusCode == 200) {
        if ((parsedAchievement = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerAchievement = parsedAchievement.map((dataJson) => AchievementModel.fromJson(dataJson)).toList();
        }
        Get.find<AchievementController>().setVisible();
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
    controllerAchievement = null;
  }
}
