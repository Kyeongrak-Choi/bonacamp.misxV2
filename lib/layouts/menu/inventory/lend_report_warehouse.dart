import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_warehouses.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';
import 'package:misxV2/components/common/dialog/lenditem/option_dialog_lenditem.dart';
import 'package:misxV2/components/common/dialog/purchase/option_dialog_purchase.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_cb_lend_division.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/datatable/inventory/lend_report_warehouse_item.dart';
import '../../../models/menu/inventory/lend_report_warehouse_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class LendReportWarehouse extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(LendReportWarehouseController());
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text('menu_sub_lend_report_warehouse'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: Get.find<LendReportWarehouseController>().visible.value,
                      child: Container(
                        color: context.theme.canvasColor,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h,
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h),
                          child: Column(
                            children: [
                              OptionPeriodPicker(),
                              OptionDialogLendItem(),
                              OptionTwoContent(OptionDialogPurchase(), OptionCbBranch()),
                              OptionTwoContent(OptionCbWarehouses(), OptionCbLendDivision()),
                              OptionBtnSearch(ROUTE_MENU_LEND_REPORT_WAREHOUSE),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: BASIC_PADDING,
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
                    padding: EdgeInsetsDirectional.fromSTEB(0.w, 0.h, BASIC_PADDING * 2.w, 0.h),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(visible: Get.find<LendReportWarehouseController>().visible.value),
                      onPressed: () {
                        Get.find<LendReportWarehouseController>().setVisible();
                      },
                      backgroundColor: context.theme.colorScheme.background,
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
    if (Get.find<LendReportWarehouseController>().controllerLendReportWarehouse != null) {
      return LendReportWarehouseItem(Get.find<LendReportWarehouseController>().controllerLendReportWarehouse);
    } else {
      return EmptyWidget();
    }
  }
}

class LendReportWarehouseController extends GetxController {
  var controllerLendReportWarehouse;

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramFromDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().fromDate.value).toString();
    String paramToDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().toDate.value).toString();
    String paramPurchaseCode = Get.find<OptionDialogPurchaseController>().paramCode;
    String paramLendItemCode = Get.find<OptionDialogLendItemController>().paramLendItemCode.value;
    String paramWarehouseCode = Get.find<CbWarehousesController>().paramWarehouseCode;
    String paramLendDivisionCode = Get.find<CbLendDivisionController>().paramLendDivisionCode;

    var param = user.getClientCode;
    var parsedLendReportWarehouseSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_INVENTORY +
          API_LEND_REPORT_WAREHOUSE +
          '?branch=' +
          paramBranchCode +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&warehouse=' +
          paramWarehouseCode +
          '&customer=' +
          paramPurchaseCode +
          '&item=' +
          paramLendItemCode +
          '&case=' +
          paramLendDivisionCode +
          '&use=' +
          '');

      if (response.statusCode == 200) {
        if ((parsedLendReportWarehouseSales = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerLendReportWarehouse = parsedLendReportWarehouseSales.map((dataJson) => LendReportWarehouseModel.fromJson(dataJson)).toList();
        }

        Get.find<LendReportWarehouseController>().setVisible();
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
    controllerLendReportWarehouse = null;
  }
}
