import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/common/datepicker/option_date_picker.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/button/option_btn_visible.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_cb_team.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/common/field/sum_item_table.dart';
import '../../../components/common/field/sum_title_table.dart';
import '../../../components/datatable/management/sales_daily_Item.dart';
import '../../../models/menu/management/sales_daily_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class SalesDaily extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SalesDailyController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_salesdaily'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: context.theme.canvasColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<SalesDailyController>().visible.value),
                  onPressed: () {
                    Get.find<SalesDailyController>().setVisible();
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
                      visible: Get.find<SalesDailyController>().visible.value,
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
                              OptionTwoContent(OptionCbEmployee(), OptionCbTeam()),
                              OptionBtnSearch(ROUTE_MENU_SALES_DAILY),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: Get.find<SalesDailyController>().visible.value ? 20 : 0,
                  ),
                  Visibility(
                    visible: !Get.find<SalesDailyController>().visible.value,
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
                            SumTitleTable('일자 합계 (일/월)'),
                            SumItemTable(
                                '공급가',
                                numberFormat.format(Get.find<SalesDailyController>().sumPrice_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumPrice_M),
                                '부가세',
                                numberFormat.format(Get.find<SalesDailyController>().sumVat_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumVat_M)),
                            SumItemTable(
                                '보증금\n합계',
                                numberFormat.format(Get.find<SalesDailyController>().sumGuarantee_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumGuarantee_M),
                                '총합계',
                                numberFormat.format(Get.find<SalesDailyController>().sumTotal_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumTotal_M)),
                            SumItemTable(
                                '매출원가',
                                numberFormat.format(Get.find<SalesDailyController>().sumCost_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumCost_M),
                                '매출이익',
                                numberFormat.format(Get.find<SalesDailyController>().sumMargin_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumMargin_M)),
                            SumItemTable(
                                '입금소계',
                                numberFormat.format(Get.find<SalesDailyController>().sumDepositCash_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumDepositCash_M),
                                '용공입금',
                                numberFormat.format(Get.find<SalesDailyController>().sumDepositEtc_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumDepositEtc_M)),
                            SumItemTable(
                                '입금합계',
                                numberFormat.format(Get.find<SalesDailyController>().sumDeposit_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumDeposit_M),
                                '채권잔액',
                                numberFormat.format(Get.find<SalesDailyController>().sumBalance_D) +
                                    '\n' +
                                    numberFormat.format(Get.find<SalesDailyController>().sumBalance_M)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: !Get.find<SalesDailyController>().visible.value ? 20 : 0,
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
    if (Get.find<SalesDailyController>().salesDailyList != null) {
      return SalesDailyItem(Get.find<SalesDailyController>().salesDailyList);
    } else {
      return EmptyWidget();
    }
  }
}

class SalesDailyController extends GetxController {
  var visible = true.obs;
  var salesDailyList;

  int sumPrice_D = 0;
  int sumVat_D = 0;
  int sumGuarantee_D = 0;
  int sumTotal_D = 0;
  int sumCost_D = 0;
  int sumMargin_D = 0;
  int sumDepositCash_D = 0;
  int sumDepositEtc_D = 0;
  int sumDeposit_D = 0;
  int sumBalance_D = 0;

  int sumPrice_M = 0;
  int sumVat_M = 0;
  int sumGuarantee_M = 0;
  int sumTotal_M = 0;
  int sumCost_M = 0;
  int sumMargin_M = 0;
  int sumDepositCash_M = 0;
  int sumDepositEtc_M = 0;
  int sumDeposit_M = 0;
  int sumBalance_M = 0;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;
    var parsedSalesDaily;

    String paramBranchCd = Get.find<CbBranchController>().paramBranchCode;
    String paramDt = DateFormat('yyyyMMdd').format(Get.find<DatePickerController>().date.value).toString();
    String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramTeamCode = Get.find<CbTeamController>().paramTeamCode;

    var param = user.getClientCode;
    var parsedDataSalesDaily;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_MANAGEMENT +
          API_MANAGEMENT_DAILYSTATUS +
          '?branch=' +
          paramBranchCd +
          '&date=' +
          paramDt +
          '&sales-rep=' +
          paramEmployeeCode +
          '&team=' +
          paramTeamCode);

      if (response.statusCode == 200) {
        if ((parsedSalesDaily = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          salesDailyList = parsedSalesDaily.map((dataJson) => SalesDailyModel.fromJson(dataJson)).toList();

          for (int i = 0; i < salesDailyList.length; i++) {
            if (salesDailyList[i].dateType == '1') {
              // 일
              sumPrice_D += salesDailyList[i].price as int;
              sumVat_D += salesDailyList[i].vat as int;
              sumGuarantee_D += salesDailyList[i].guarantee as int;
              sumTotal_D += salesDailyList[i].total as int;
              sumCost_D += salesDailyList[i].cost as int;
              sumMargin_D += salesDailyList[i].margin as int;
              sumDepositCash_D += salesDailyList[i].depositCash as int;
              sumDepositEtc_D += salesDailyList[i].depositEtc as int;
              sumDeposit_D += salesDailyList[i].deposit as int;
              sumBalance_D += salesDailyList[i].balance as int;
            } else if (salesDailyList[i].dateType == '2') {
              // 월
              sumPrice_M += salesDailyList[i].price as int;
              sumVat_M += salesDailyList[i].vat as int;
              sumGuarantee_M += salesDailyList[i].guarantee as int;
              sumTotal_M += salesDailyList[i].total as int;
              sumCost_M += salesDailyList[i].cost as int;
              sumMargin_M += salesDailyList[i].margin as int;
              sumDepositCash_M += salesDailyList[i].depositCash as int;
              sumDepositEtc_M += salesDailyList[i].depositEtc as int;
              sumDeposit_M += salesDailyList[i].deposit as int;
              sumBalance_M += salesDailyList[i].balance as int;
            }
          }
        }

        Get.find<SalesDailyController>().setVisible();
        update();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    } catch (e) {
      print("other error");
    }
  }

  void clearValue() {
    sumPrice_D = 0;
    sumVat_D = 0;
    sumGuarantee_D = 0;
    sumTotal_D = 0;
    sumCost_D = 0;
    sumMargin_D = 0;
    sumDepositCash_D = 0;
    sumDepositEtc_D = 0;
    sumDeposit_D = 0;
    sumBalance_D = 0;
    sumPrice_M = 0;
    sumVat_M = 0;
    sumGuarantee_M = 0;
    sumTotal_M = 0;
    sumCost_M = 0;
    sumMargin_M = 0;
    sumDepositCash_M = 0;
    sumDepositEtc_M = 0;
    sumDeposit_M = 0;
    sumBalance_M = 0;

    salesDailyList = null;
  }
}
