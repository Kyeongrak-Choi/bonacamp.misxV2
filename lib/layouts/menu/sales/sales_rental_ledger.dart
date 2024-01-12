import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../../components/common/field/sum_one_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/sales/sales_rental_ledger_Item.dart';
import '../../../models/menu/sales/sales_rental_ledger_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class SalesRentalLedger extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesRentalLedgerController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_sales_rental_ledger'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h,
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h),
                          child: Column(
                            children: [
                              SumTitleTable('기간 매출 및 대여 합계', controller: Get.find<SalesRentalLedgerController>(),),
                              Visibility(
                                visible: Get.find<SalesRentalLedgerController>().sumTableVisible.value,
                                child: Column(
                                  children: [
                                    SumOneItemTable(
                                        '매출액',
                                        numberFormat.format(
                                            Get.find<SalesRentalLedgerController>()
                                                .sumTotal) + ' 원',
                                    ),
                                    SumOneItemTable(
                                        '공급가 + 부가세',
                                        numberFormat.format(
                                            Get.find<SalesRentalLedgerController>()
                                                .sumAmount) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '입금액',
                                        numberFormat.format(
                                            Get.find<SalesRentalLedgerController>()
                                                .sumDeposit) + ' 원',
                                    ),
                                    SumOneItemTable(
                                        '채권잔액',
                                        numberFormat.format(
                                            Get.find<SalesRentalLedgerController>()
                                                .sumBalance) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '대여금 (장기)',
                                        numberFormat.format(
                                            Get.find<SalesRentalLedgerController>()
                                                .sumLongRent) + ' 원',
                                    ),
                                    SumOneItemTable(
                                        '대여금 (단기)',
                                        numberFormat.format(
                                            Get.find<SalesRentalLedgerController>()
                                                .sumShortRent) + ' 원'
                                    ),
                                    SumOneItemTable(
                                        '대여금 (합계)',
                                        numberFormat.format(
                                            Get.find<SalesRentalLedgerController>()
                                                .sumTotalRent) + ' 원',
                                    ),
                                    SumOneItemTable(
                                        '채권 + 대여금',
                                        numberFormat.format(
                                            Get.find<SalesRentalLedgerController>()
                                                .sumTotalBalance) + ' 원'
                                    ),
                                  ],
                                )
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
                              visible: Get.find<SalesRentalLedgerController>()
                                  .visible
                                  .value,
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
                                      OptionTwoContent(OptionDialogCustomer(),
                                          OptionCbBranch()),
                                      OptionBtnSearch(
                                          ROUTE_MENU_SALES_RENTAL_LEDGER),
                                    ],
                                  ),
                                ),
                              )),
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
                      child: OptionBtnVisible(
                          visible: Get.find<SalesRentalLedgerController>()
                              .visible
                              .value),
                      onPressed: () {
                        Get.find<SalesRentalLedgerController>().setVisible();
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
  var sumTableVisible = true.obs;
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

  setSumTableVisible() async {
    sumTableVisible.value = !sumTableVisible.value;
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
