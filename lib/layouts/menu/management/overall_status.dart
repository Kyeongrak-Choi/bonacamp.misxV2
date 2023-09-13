import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/button/option_btn_search_overall.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/datatable/overall_table.dart';
import '../../../models/management/overall/overall.dart';
import '../../../models/management/overall/overallasset.dart';
import '../../../models/management/overall/overalldeposit.dart';
import '../../../models/management/overall/overallpurchase.dart';
import '../../../models/management/overall/overallrental.dart';
import '../../../models/management/overall/overallreturn.dart';
import '../../../models/management/overall/overallsales.dart';
import '../../../models/management/overall/overallwithdraw.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';


class OverallStatus extends StatelessWidget {
  @override
  Widget build(context) {
    //Get.put(OverAllController());
    return Scaffold(
        appBar: AppBar(
            title: Text('종합 현황'),
            backgroundColor: context.theme.backgroundColor,
            iconTheme: context.theme.iconTheme,
          ),
        body: Container(
          color: context.theme.backgroundColor,
          child: Column(
            children: [
              Column(
                children: [
                  OptionPeriodPicker(),
                  OptionCbBranch(),
                  OptionBtnSearchOverAll(),
                ],
              ),
              Expanded(
                child: OverAllTable(),
              ),
            ],
          ),
        ),
    );
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

  Future showResult() async {

    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save

    String tempNodeCd = Get.find<CbBranchController>().paramBranchCode;
    String tempFromDt = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().fromDate.value).toString();
    String tempToDt = DateFormat('yyyyMMdd').format(Get.find<PeriodPickerController>().toDate.value).toString();

    var param = user.getClientCode;
    var response;
    var parsedDataSales;
    var parsedDataPurchase;
    var parsedDataDeposit;
    var parsedDataWithdraw;
    var parsedDataReturn;
    var parsedDataRental;
    var parsedDataAsset;

    //response = await reqApi(API_SALES_OVERALL + '?nodeCd=0000&fromDt=20230912&toDt=20230912', param, API_REQ_GET);
    try {
      response = await reqApiThrow(API_SALES_OVERALL + '?nodeCd=' + tempNodeCd + '&fromDt=' + tempFromDt + '&toDt=' + tempToDt, param, API_REQ_GET);

      parsedDataSales     = await jsonDecode(response)[TAG_DATA]['sales'];
      parsedDataPurchase  = await jsonDecode(response)[TAG_DATA]['purchase'];
      parsedDataDeposit   = await jsonDecode(response)[TAG_DATA]['deposit'];
      parsedDataWithdraw  = await jsonDecode(response)[TAG_DATA]['withdraw'];
      parsedDataReturn    = await jsonDecode(response)[TAG_DATA]['return'];
      parsedDataRental   = await jsonDecode(response)[TAG_DATA]['rental'];
      parsedDataAsset     = await jsonDecode(response)[TAG_DATA]['asset'];

      //controllerOverAllModel = OverAllModel.fromJson(parsedData);

      controllerSalesModel = OverAllSalesModel.fromJson(parsedDataSales);

      controllerPurchaseModel  = OverAllPurchaseModel.fromJson(parsedDataPurchase);
      controllerDepositModel   = OverAllDepositModel.fromJson(parsedDataDeposit);
      controllerWithdrawModel  = OverAllWithdrawModel.fromJson(parsedDataWithdraw);
      controllerReturnModel    = OverAllReturnModel.fromJson(parsedDataReturn);
      controllerRentalModel    = OverAllRentalModel.fromJson(parsedDataRental);
      controllerAssetModel     = OverAllAssetModel.fromJson(parsedDataAsset);

      update();

    }
    on DioException catch(e){
      if(e.response != null){
        if(e.response?.statusCode == 500){
          print("Server Error");  // 추후 메세지 제작
        }
      }
    }
    catch(e){
      print("other error");
    }
  }

}
