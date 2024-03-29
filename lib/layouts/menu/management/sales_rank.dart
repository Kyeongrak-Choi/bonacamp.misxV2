import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manager.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/datatable/management/sales_rank_Item.dart';
import '../../../models/menu/management/sales_rank_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class SalesRank extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesRankController());
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text('menu_sub_sales_rank'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: Get.find<SalesRankController>().visible.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h,
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h),
                          child: Column(
                            children: [
                              OptionPeriodPicker(),
                              OptionCbBranch(),
                              OptionTwoContent(
                                  OptionCbEmployee(), OptionCbManager()),
                              OptionBtnSearch(ROUTE_MENU_RANKSTATUS),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.find<SalesRankController>().visible.value
                          ? BASIC_PADDING.h
                          : 0,
                    ),
                    Expanded(
                      child: Container(
                        child: ListView(
                          children: <Widget>[setChild()],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.w,
                        0.h,
                        BASIC_PADDING * 2.w,
                        0.h),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(
                          visible:
                              Get.find<SalesRankController>().visible.value),
                      onPressed: () {
                        Get.find<SalesRankController>().setVisible();
                      },
                      backgroundColor: context.theme.colorScheme.onTertiary,
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
    if (Get.find<SalesRankController>().controllerSalesRank != null) {
      return SalesRankItem(Get.find<SalesRankController>().controllerSalesRank);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesRankController extends GetxController {
  var controllerSalesRank;

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
    String paramEmployeeCode =
        Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramManagementCode =
        Get.find<CbManagerController>().paramManagerCode;

    var param = user.getClientCode;
    List parsedDataSalesRank;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_RANKSTATUS +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&sales-rep=' +
          paramEmployeeCode +
          '&view=' +
          paramManagementCode);

      if (response.statusCode == 200) {
        if ((parsedDataSalesRank =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerSalesRank = parsedDataSalesRank
              .map((element) => SalesRankModel.fromJson(element))
              .toList();
        }

        Get.find<SalesRankController>().setVisible();
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
    controllerSalesRank = null;
  }
}
