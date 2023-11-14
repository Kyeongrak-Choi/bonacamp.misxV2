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
import '../../../utils/utility.dart';

class SalesLedger extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesLedgerController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_sales_ledger'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: context.theme.canvasColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<SalesLedgerController>().visible.value),
                  onPressed: () {
                    Get.find<SalesLedgerController>().setVisible();
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
                    visible: Get.find<SalesLedgerController>().visible.value,
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
                            OptionPeriodPicker(),
                            OptionTwoContent(OptionDialogCustomer(), OptionCbBranch()),
                            //OptionTwoContent(OptionCbEmployee(), OptionCbManager()),
                            OptionBtnSearch(ROUTE_MENU_SALES_LEDGER),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !Get.find<SalesLedgerController>().visible.value,
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
                            SumTitleTable('기간 매출 원장 합계'),
                            SumItemTable(
                                'BOX / EA',
                                numberFormat.format(Get.find<SalesLedgerController>().sumBoxQuantity) +
                                    ' / ' +
                                    numberFormat.format(Get.find<SalesLedgerController>().sumBottleQuantity),
                                '매출액',
                                numberFormat.format(Get.find<SalesLedgerController>().sumTotal)),
                            SumItemTable('공급가', numberFormat.format(Get.find<SalesLedgerController>().sumPrice), '합계',
                                numberFormat.format(Get.find<SalesLedgerController>().sumAmount)),
                            SumItemTable('보증금', numberFormat.format(Get.find<SalesLedgerController>().sumGuarantee), '입금액',
                                numberFormat.format(Get.find<SalesLedgerController>().sumDeposit)),
                            SumItemTable(null, null, '채권잔액', numberFormat.format(Get.find<SalesLedgerController>().sumBalance)),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
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
    if (Get.find<SalesLedgerController>().controllerSalesLedger != null) {
      return SalesLedgerItem(Get.find<SalesLedgerController>().controllerSalesLedger);
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
    String paramFromDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().fromDate.value).toString();
    String paramToDate = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().toDate.value).toString();
    String paramCustomerCode = Get.find<OptionDialogCustomerController>().paramCustomerCode.value;
    // String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    // String paramManagementCode = Get.find<CbManagerController>().paramManagerCode;

    if (paramCustomerCode == '') {
      ShowSnackBar(SNACK_TYPE.INFO, '거래처를 선택해주세요.');
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
        if ((parsedSalesLedger = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerSalesLedger = SalesLedgerModel.fromJson(parsedSalesLedger);

          for (SalesLedgerListModel listData in controllerSalesLedger.dateList) {
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
    sumTotal = 0;
    sumPrice = 0;
    sumAmount = 0;
    sumGuarantee = 0;
    sumDeposit = 0;
    sumBalance = 0;

    controllerSalesLedger = null;
  }
}
