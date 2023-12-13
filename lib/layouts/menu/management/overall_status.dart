import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/datatable/management/overall_table.dart';
import '../../../models/menu/management/overall/overallasset.dart';
import '../../../models/menu/management/overall/overalldeposit.dart';
import '../../../models/menu/management/overall/overallpurchase.dart';
import '../../../models/menu/management/overall/overallrental.dart';
import '../../../models/menu/management/overall/overallreturn.dart';
import '../../../models/menu/management/overall/overallsales.dart';
import '../../../models/menu/management/overall/overallwithdraw.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class OverallStatus extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(OverAllController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_total'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: APPBAR_BACKGROUND_COLOR,
              iconTheme: context.theme.iconTheme,
          ),
          body: Container(
            color: context.theme.canvasColor,
            child: Stack(
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child: Column(
                      children: [
                        Visibility(
                          visible: Get.find<OverAllController>().visible.value,
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
                                  OptionCbBranch(),
                                  OptionBtnSearch(ROUTE_MENU_OVERALL_STATUS),
                                ],
                              ),
                            ),
                          )),
                        SizedBox(
                          height: Get.find<OverAllController>().visible.value ? 20 : 0,
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
                              child: OverAllTable(),
                            ),
                          ),
                        ),
                      ],
                    )),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(visible: Get.find<OverAllController>().visible.value),
                      onPressed: () {
                        Get.find<OverAllController>().setVisible();
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
}

class OverAllController extends GetxController {
  var controllerOverAllModel;
  var controllerSalesModel;
  var controllerPurchaseModel;
  var controllerDepositModel;
  var controllerWithdrawModel;
  var controllerReturnModel;
  var controllerRentalModel;
  var controllerAssetModel;

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

    var param = user.getClientCode;
    var parsedDataSales;
    var parsedDataPurchase;
    var parsedDataDeposit;
    var parsedDataWithdraw;
    var parsedDataReturn;
    var parsedDataRental;
    var parsedDataAsset;

    try {
      dio = await reqApi(param);

      final response =
          await dio.get(API_MANAGEMENT + API_MANAGEMENT_OVERALL + '?branch=' + paramBranchCode + '&from=' + paramFromDate + '&to=' + paramToDate);

      if (response.statusCode == 200) {
        parsedDataSales = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_SALES];
        parsedDataPurchase = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_PURCHASE];
        parsedDataDeposit = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_DEPOSIT];
        parsedDataWithdraw = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_WITHDRAW];
        parsedDataReturn = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RETURN];
        parsedDataRental = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_RENTAL];
        parsedDataAsset = await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_ASSET];

        controllerSalesModel = OverAllSalesModel.fromJson(parsedDataSales);
        controllerPurchaseModel = OverAllPurchaseModel.fromJson(parsedDataPurchase);
        controllerDepositModel = OverAllDepositModel.fromJson(parsedDataDeposit);
        controllerWithdrawModel = OverAllWithdrawModel.fromJson(parsedDataWithdraw);
        controllerReturnModel = OverAllReturnModel.fromJson(parsedDataReturn);
        controllerRentalModel = OverAllRentalModel.fromJson(parsedDataRental);
        controllerAssetModel = OverAllAssetModel.fromJson(parsedDataAsset);

        Get.find<OverAllController>().setVisible();
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
}
