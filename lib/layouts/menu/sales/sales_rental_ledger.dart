import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/button/option_btn_visible.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/dialog/customer/option_dialog_customer.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/sales/sales_rental_ledger_Item.dart';
import '../../../models/menu/sales/sales_rental_ledger_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class SalesRentalLedger extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesRentalLedgerController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_sales_rental_ledger'.tr), actions: []),
          body: Container(
            color: context.theme.canvasColor,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: !Get.find<SalesRentalLedgerController>()
                          .visible
                          .value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.all(15),
                          child: Column(
                            children: [
                              SumTitleTable('기간 매출 및 대여 합계'),
                              SumItemTable(
                                  '매출액',
                                  numberFormat.format(
                                      Get.find<SalesRentalLedgerController>()
                                          .sumTotal),
                                  '공급가\n+부가세',
                                  numberFormat.format(
                                      Get.find<SalesRentalLedgerController>()
                                          .sumAmount)),
                              SumItemTable(
                                  '입금액',
                                  numberFormat.format(
                                      Get.find<SalesRentalLedgerController>()
                                          .sumDeposit),
                                  '채권잔액',
                                  numberFormat.format(
                                      Get.find<SalesRentalLedgerController>()
                                          .sumBalance)),
                              SumItemTable(
                                  '대여금\n(장기)',
                                  numberFormat.format(
                                      Get.find<SalesRentalLedgerController>()
                                          .sumLongRent),
                                  '대여금\n(단기)',
                                  numberFormat.format(
                                      Get.find<SalesRentalLedgerController>()
                                          .sumShortRent)),
                              SumItemTable(
                                  '대여금\n(합계)',
                                  numberFormat.format(
                                      Get.find<SalesRentalLedgerController>()
                                          .sumTotalRent),
                                  '채권\n+대여금',
                                  numberFormat.format(
                                      Get.find<SalesRentalLedgerController>()
                                          .sumTotalBalance)),
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
                                visible: Get.find<SalesRentalLedgerController>()
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
                                        OptionBtnSearch(
                                            ROUTE_MENU_SALES_RENTAL_LEDGER),
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: Get.find<SalesRentalLedgerController>()
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
                          visible: Get.find<SalesRentalLedgerController>()
                              .visible
                              .value),
                      onPressed: () {
                        Get.find<SalesRentalLedgerController>().setVisible();
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
    if (Get.find<SalesRentalLedgerController>().salesRentalLedgerList != null) {
      return SalesRentalLedgerItem(
          Get.find<SalesRentalLedgerController>().salesRentalLedgerList);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesRentalLedgerController extends GetxController {
  var visible = true.obs;
  var salesRentalLedgerList;

  int sumTotal = 0;
  int sumPrice = 0;
  int sumAmount = 0;
  int sumDeposit = 0;
  int sumBalance = 0;
  int sumMargin = 0;
  int sumLongRent = 0;
  int sumShortRent = 0;
  int sumTotalRent = 0;
  int sumTotalBalance = 0;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCd = Get.find<CbBranchController>().paramBranchCode;
    String paramFromDate = DateFormat('yyyyMMdd')
        .format(Get.find<PeriodPickerController>().fromDate.value)
        .toString();
    String paramToDate = DateFormat('yyyyMMdd')
        .format(Get.find<PeriodPickerController>().toDate.value)
        .toString();
    String paramCustomerCode =
        Get.find<OptionDialogCustomerController>().paramCustomerCode.value;

    if (paramCustomerCode == '') {
      ShowSnackBar(SNACK_TYPE.INFO, 'must_select_customer'.tr);
      return;
    }

    var param = user.getClientCode;
    var parsedsalesRentalLedger;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_SALES +
          API_SALES_SALESRENTALLEDGER +
          '?branch=' +
          paramBranchCd +
          '&from=' +
          paramFromDate +
          '&to=' +
          paramToDate +
          '&code=' +
          paramCustomerCode);

      if (response.statusCode == 200) {
        if ((parsedsalesRentalLedger =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          salesRentalLedgerList = parsedsalesRentalLedger
              .map((dataJson) => SalesRentalLedgerModel.fromJson(dataJson))
              .toList();

          for (SalesRentalLedgerModel calData in salesRentalLedgerList) {
            sumTotal += calData.total as int;
            sumPrice += calData.price as int;
            sumAmount += calData.amount as int;
            sumDeposit += calData.deposit as int;
            sumBalance = calData.balance as int;
            sumLongRent = calData.longRent as int;
            sumShortRent = calData.shortRent as int;
            sumTotalRent = calData.totalRent as int;
            sumTotalBalance = calData.totalBalance as int;
          }
        }

        Get.find<SalesRentalLedgerController>().setVisible();
        update();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO,
            e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    } catch (e) {
      print("other error");
    }
  }

  void clearValue() {
    sumTotal = 0;
    sumPrice = 0;
    sumAmount = 0;
    sumDeposit = 0;
    sumBalance = 0;
    sumMargin = 0;
    sumLongRent = 0;
    sumShortRent = 0;
    sumTotalRent = 0;
    sumTotalBalance = 0;

    salesRentalLedgerList = null;
  }
}
