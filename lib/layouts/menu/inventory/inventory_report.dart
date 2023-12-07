import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_sales_class.dart';
import 'package:misxV2/components/common/combobox/option_cb_warehouses.dart';
import 'package:misxV2/components/common/datepicker/option_date_picker.dart';
import 'package:misxV2/components/common/dialog/item/option_dialog_item.dart';
import 'package:misxV2/components/common/dialog/purchase/option_dialog_purchase.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/inventory/inventory_report_item.dart';
import '../../../models/menu/inventory/inventory_report_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class InventoryReport extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(InventoryReportController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_inventory_report'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: APPBAR_BACKGROUND_COLOR,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<InventoryReportController>().visible.value),
                  onPressed: () {
                    Get.find<InventoryReportController>().setVisible();
                  },
                ),
              ]),
          body: Container(
            color: context.theme.canvasColor,
            child: Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Column(
                children: [
                  Visibility(
                    visible: Get.find<InventoryReportController>().visible.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: Column(
                          children: [
                            OptionTwoContent(OptionDatePicker(), OptionCbBranch()),
                            OptionTwoContent(OptionDialogItem(), OptionCbWarehouses()),
                            OptionTwoContent(OptionDialogPurchase(), OptionCbSalesClass()),
                            OptionBtnSearch(ROUTE_MENU_INVENTORY_REPORT),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !Get.find<InventoryReportController>().visible.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Column(
                          children: [
                            SumTitleTable('기간 채권 및 대여 합계'),
                            SumItemTable(
                              'BOX',
                              numberFormat.format(Get.find<InventoryReportController>().sumBoxQuantity),
                              'EA',
                              numberFormat.format(Get.find<InventoryReportController>().sumBottleQuantity),
                            ),
                            SumItemTable(null, null, '금액', numberFormat.format(Get.find<InventoryReportController>().sumAmount)),
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
                        padding: EdgeInsetsDirectional.all(20),
                        child: ListView(
                          children: <Widget>[setChild()],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget setChild() {
    if (Get.find<InventoryReportController>().controllerInventoryReport != null) {
      return InventoryReportItem(Get.find<InventoryReportController>().controllerInventoryReport);
    } else {
      return EmptyWidget();
    }
  }
}

class InventoryReportController extends GetxController {
  var controllerInventoryReport;
  int sumBoxQuantity = 0;
  int sumBottleQuantity = 0;
  int sumAmount = 0;

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramDt = DateFormat('yyyyMMdd').format(Get.find<DatePickerController>().date.value).toString();
    String paramPurchaseCode = Get.find<OptionDialogPurchaseController>().paramCode;
    String paramItemCode = Get.find<OptionDialogItemController>().paramItemCode.value;
    String paramWarehouseCode = Get.find<CbWarehousesController>().paramWarehouseCode;
    String paramSalesClassCode = Get.find<CbSalesClassController>().paramSalesClassCode;

    var param = user.getClientCode;
    var parsedInventoryReportSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_INVENTORY +
          API_INVENTORY_REPORT +
          '?branch=' +
          paramBranchCode +
          '&date=' +
          paramDt +
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
        if ((parsedInventoryReportSales = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          controllerInventoryReport = parsedInventoryReportSales.map((dataJson) => InventoryReportModel.fromJson(dataJson)).toList();

          for (InventoryReportModel calData in controllerInventoryReport) {
            sumBoxQuantity += calData.boxQuantity as int;
            sumBottleQuantity += calData.bottleQuantity as int;
            sumAmount += calData.amount as int;
          }
        }

        Get.find<InventoryReportController>().setVisible();
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
    sumBoxQuantity = 0;
    sumBottleQuantity = 0;
    sumAmount = 0;

    controllerInventoryReport = null;
  }
}
