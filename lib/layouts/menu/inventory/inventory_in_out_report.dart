import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_sales_class.dart';
import 'package:misxV2/components/common/combobox/option_cb_warehouses.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';
import 'package:misxV2/components/common/dialog/item/option_dialog_item.dart';
import 'package:misxV2/components/common/dialog/purchase/option_dialog_purchase.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/inventory/inventory_in_out_report_item.dart';
import '../../../models/menu/inventory/inventory_in_out_report_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class InventoryInOutReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(InventoryInOutReportController());
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text('menu_sub_inventory_in_out_report'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: !Get.find<InventoryInOutReportController>().visible.value,
                      child: Container(
                        color: context.theme.canvasColor,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
                          child: Column(
                            children: [
                              SumTitleTable('기간 채권 및 대여 합계',sub: '(BOX/EA)', controller: Get.find<InventoryInOutReportController>()),
                              Visibility(
                                visible: Get.find<InventoryInOutReportController>().sumTableVisible.value,
                                child: Column(
                                  children: [
                                    SumItemTable('전일재고',  numberFormat.format(Get.find<InventoryInOutReportController>().sumLastBoxQuantity) + ' 원',
                                        numberFormat.format(Get.find<InventoryInOutReportController>().sumLastBottleQuantity) + ' 원'),
                                    SumItemTable('금일재고', numberFormat.format(Get.find<InventoryInOutReportController>().sumCurrentBoxQuantity) + ' 원',
                                        numberFormat.format(Get.find<InventoryInOutReportController>().sumCurrentBottleQuantity) + ' 원'),
                                    SumItemTable('입고',  numberFormat.format(Get.find<InventoryInOutReportController>().sumInBoxQuantity) + ' 원',
                                        numberFormat.format(Get.find<InventoryInOutReportController>().sumInBottleQuantity) + ' 원'),
                                    SumItemTable('출고', numberFormat.format(Get.find<InventoryInOutReportController>().sumOutBoxQuantity) + ' 원',
                                        numberFormat.format(Get.find<InventoryInOutReportController>().sumOutBottleQuantity) + ' 원'),
                                    SumItemTable('실사', numberFormat.format(Get.find<InventoryInOutReportController>().sumPhysicalBoxQuantity) + ' 원',
                                        numberFormat.format(Get.find<InventoryInOutReportController>().sumPhysicalBottleQuantity) + ' 원'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Visibility(
                            visible: Get.find<InventoryInOutReportController>().visible.value,
                            child: Container(
                              color: context.theme.canvasColor,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
                                child: Column(
                                  children: [
                                    OptionPeriodPicker(),
                                    OptionDialogItem(),
                                    OptionTwoContent(OptionDialogPurchase(), OptionCbBranch()),
                                    OptionTwoContent(OptionCbWarehouses(), OptionCbSalesClass()),
                                    OptionBtnSearch(ROUTE_MENU_INVENTORY_INOUT_REPORT),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: BASIC_PADDING.h,
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
                      child: OptionBtnVisible(visible: Get.find<InventoryInOutReportController>().visible.value),
                      onPressed: () {
                        Get.find<InventoryInOutReportController>().setVisible();
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
    if (Get.find<InventoryInOutReportController>().controllerInventoryInOutReport != null) {
      return InventoryInOutReportItem(Get.find<InventoryInOutReportController>().controllerInventoryInOutReport);
    } else {
      return EmptyWidget();
    }
  }
}

class InventoryInOutReportController extends GetxController {
  var controllerInventoryInOutReport;

  int sumCurrentBoxQuantity = 0;
  int sumCurrentBottleQuantity = 0;
  int sumLastBoxQuantity = 0;
  int sumLastBottleQuantity = 0;
  int sumPhysicalBoxQuantity = 0;
  int sumPhysicalBottleQuantity = 0;
  int sumInBoxQuantity = 0;
  int sumInBottleQuantity = 0;
  int sumOutBoxQuantity = 0;
  int sumOutBottleQuantity = 0;

  var visible = true.obs;
  var sumTableVisible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  setSumTableVisible() async {
    sumTableVisible.value = !sumTableVisible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramFromDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().fromDate.value).toString();
    String paramToDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().toDate.value).toString();
    String paramPurchaseCode = Get.find<OptionDialogPurchaseController>().paramCode;
    String paramItemCode = Get.find<OptionDialogItemController>().paramItemCode.value;
    String paramWarehouseCode = Get.find<CbWarehousesController>().paramWarehouseCode;
    String paramSalesClassCode = Get.find<CbSalesClassController>().paramSalesClassCode;

    var param = user.getClientCode;
    var parsedInventoryInOutReportSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_INVENTORY +
          API_INVENTORY_INOUT_REPORT +
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
          paramItemCode +
          '&sales-type=' +
          paramSalesClassCode +
          '&use=' +
          '');

      if (response.statusCode == 200) {
        if ((parsedInventoryInOutReportSales = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerInventoryInOutReport = parsedInventoryInOutReportSales.map((dataJson) => InventoryInOutReportModel.fromJson(dataJson)).toList();

          for (InventoryInOutReportModel calData in controllerInventoryInOutReport) {
            sumCurrentBoxQuantity += calData.current.box as int;
            sumCurrentBottleQuantity += calData.current.bottle as int;
            sumLastBoxQuantity += calData.last.box as int;
            sumLastBottleQuantity += calData.last.bottle as int;
            sumPhysicalBoxQuantity += calData.physical.box as int;
            sumPhysicalBottleQuantity += calData.physical.bottle as int;
            sumInBoxQuantity += calData.inventoryIn.box as int;
            sumInBottleQuantity += calData.inventoryIn.bottle as int;
            sumOutBoxQuantity += calData.inventoryOut.box as int;
            sumOutBottleQuantity += calData.inventoryOut.bottle as int;
          }
        }

        Get.find<InventoryInOutReportController>().setVisible();
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
    sumCurrentBoxQuantity = 0;
    sumCurrentBottleQuantity = 0;
    sumLastBoxQuantity = 0;
    sumLastBottleQuantity = 0;
    sumPhysicalBoxQuantity = 0;
    sumPhysicalBottleQuantity = 0;
    sumInBoxQuantity = 0;
    sumInBottleQuantity = 0;
    sumOutBoxQuantity = 0;
    sumOutBottleQuantity = 0;

    controllerInventoryInOutReport = null;
  }
}
