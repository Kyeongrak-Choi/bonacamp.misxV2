import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/dialog/customer/option_dialog_customer.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/sales/sales_ledger_item.dart';
import '../../../models/menu/sales/sales_ledger/sales_ledger_details_model.dart';
import '../../../models/menu/sales/sales_ledger/sales_ledger_list_model.dart';
import '../../../models/menu/sales/sales_ledger/sales_ledger_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class SalesLedger extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesLedgerController());
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text('menu_sub_sales_ledger'.tr), actions: []),
          body: Container(
            color: context.theme.canvasColor,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: !Get.find<SalesLedgerController>().visible.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.all(15),
                          child: Column(
                            children: [
                              SumTitleTable('기간 매출 원장 합계'),
                              SumItemTable(
                                'BOX',
                                numberFormat.format(
                                    Get.find<SalesLedgerController>()
                                        .sumBoxQuantity),
                                'EA',
                                numberFormat.format(
                                    Get.find<SalesLedgerController>()
                                        .sumBottleQuantity),
                              ),
                              SumItemTable(
                                '매출액',
                                numberFormat.format(
                                    Get.find<SalesLedgerController>().sumTotal),
                                '공급가',
                                numberFormat.format(
                                    Get.find<SalesLedgerController>().sumPrice),
                              ),
                              SumItemTable(
                                '합계',
                                numberFormat.format(
                                    Get.find<SalesLedgerController>()
                                        .sumAmount),
                                '보증금',
                                numberFormat.format(
                                    Get.find<SalesLedgerController>()
                                        .sumGuarantee),
                              ),
                              SumItemTable(
                                  '입금액',
                                  numberFormat.format(
                                      Get.find<SalesLedgerController>()
                                          .sumDeposit),
                                  '채권잔액',
                                  numberFormat.format(
                                      Get.find<SalesLedgerController>()
                                          .sumBalance)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: Column(
                          children: [
                            Visibility(
                              visible: Get.find<SalesLedgerController>()
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
                                      OptionTwoContent(OptionDialogCustomer(),
                                          OptionCbBranch()),
                                      //OptionTwoContent(OptionCbEmployee(), OptionCbManager()),
                                      OptionBtnSearch(ROUTE_MENU_SALES_LEDGER),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.find<SalesLedgerController>()
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
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(
                          visible:
                              Get.find<SalesLedgerController>().visible.value),
                      onPressed: () {
                        Get.find<SalesLedgerController>().setVisible();
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
    if (Get.find<SalesLedgerController>().controllerSalesLedger != null) {
      return SalesLedgerItem(
          Get.find<SalesLedgerController>().controllerSalesLedger);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesLedgerController extends GetxController {
  var controllerSalesLedger;

  var visible = true.obs;

  int sumBoxQuantity = 0;
  int sumBottleQuantity = 0;
  int sumTotal = 0;
  int sumPrice = 0;
  int sumAmount = 0;
  int sumGuarantee = 0;
  int sumDeposit = 0;
  int sumBalance = 0;

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
    // String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    // String paramManagementCode = Get.find<CbManagerController>().paramManagerCode;

    if (paramCustomerCode == '') {
      ShowSnackBar(SNACK_TYPE.INFO, 'must_select_customer'.tr);
      return;
    }

    var param = user.getClientCode;
    var parsedSalesLedger;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_SALES +
              API_SALES_SALESLEDGER +
              '?branch=' +
              paramBranchCode +
              '&from=' +
              paramFromDate +
              '&to=' +
              paramToDate +
              '&customer=' +
              paramCustomerCode
          // '&sales-rep=' +
          // paramEmployeeCode +
          // '&manager=' +
          // paramManagementCode
          );

      if (response.statusCode == 200) {
        if ((parsedSalesLedger =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerSalesLedger = SalesLedgerModel.fromJson(parsedSalesLedger);

          for (SalesLedgerListModel listData
              in controllerSalesLedger.dateList) {
            for (SalesLedgerDetailsModel detailData in listData.details) {
              sumBoxQuantity += detailData.boxQuantity as int;
              sumBottleQuantity += detailData.bottleQuantity as int;
              sumTotal += detailData.total as int;
              sumPrice += detailData.price as int;
              sumAmount += detailData.amount as int;
              sumGuarantee += detailData.guarantee as int;
              sumDeposit += detailData.deposit as int;
              sumBalance = detailData.balance as int;
            }
          }
        }

        Get.find<SalesLedgerController>().setVisible();
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
    sumBoxQuantity = 0;
    sumBottleQuantity = 0;
    sumTotal = 0;
    sumPrice = 0;
    sumAmount = 0;
    sumGuarantee = 0;
    sumDeposit = 0;
    sumBalance = 0;

    controllerSalesLedger = null;
  }
}
