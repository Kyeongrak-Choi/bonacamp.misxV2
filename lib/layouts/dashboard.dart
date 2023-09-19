import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/dashboard/dashboard_admob.dart';
import 'package:misxV2/components/dashboard/dashboard_asset.dart';
import 'package:misxV2/components/dashboard/dashboard_deposit.dart';
import 'package:misxV2/components/dashboard/dashboard_purchase.dart';
import 'package:misxV2/components/dashboard/dashboard_rental.dart';
import 'package:misxV2/components/dashboard/dashboard_return.dart';
import 'package:misxV2/components/dashboard/dashboard_sales.dart';
import 'package:misxV2/components/dashboard/dashboard_withdraw.dart';
import 'package:misxV2/models/management/overall/overallsales.dart';
import 'package:misxV2/models/system/branch.dart';
import 'package:misxV2/models/system/common.dart';
import 'package:misxV2/models/system/team.dart';
import 'package:misxV2/models/system/warehouse.dart';
import 'package:misxV2/utils/utility.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart' as sn;

import '../models/management/overall/overallasset.dart';
import '../models/management/overall/overalldeposit.dart';
import '../models/management/overall/overallpurchase.dart';
import '../models/management/overall/overallrental.dart';
import '../models/management/overall/overallreturn.dart';
import '../models/management/overall/overallwithdraw.dart';
import '../models/system/employee.dart';
import '../models/system/userinfo.dart';
import '../utils/constants.dart';
import '../utils/network/network_manager.dart';
import '../utils/theme/color_manager.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NetworkManager());
    Get.put(DashBoardController());
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: RefreshIndicator(
          onRefresh: () async {
            //await Get.find<NetworkManager>().requestApi(API_URL_DEV, '', context);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsDirectional.all(5),
                  child: DashBoardAdmob(), // 광고
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: DashBoardSales(), // 매출
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: DashBoardPurchase(), // 매입
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: DashBoardDeposit(), // 회수
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: DashBoardWithdraw(), // 출금
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: DashBoardReturn(), // 반납
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: DashBoardRental(), // 대여
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 30),
                        child: DashBoardAsset(), // 자산
                      ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      //   child: DashBoardChart2(), // 차트
                      // ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class DashBoardController extends GetxController {
  var controllerOverAllModel;
  var controllerSalesModel;
  var controllerPurchaseModel;
  var controllerDepositModel;
  var controllerWithdrawModel;
  var controllerReturnModel;
  var controllerRentalModel;
  var controllerAssetModel;

  @override
  void onInit() async {
    super.onInit();

    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var param = user.getClientCode;
    var dio;
    var parsedData;

    try {
      dio = await reqApi(param);

      // get Employees
      final resEmployee = await dio.get(API_SYSTEM_MASTER + '$param' + API_SYSTEM_EMPLOYEES);
      if (resEmployee.statusCode == 200) {
        parsedData = await jsonDecode(jsonEncode(resEmployee.data))[TAG_DATA] as List;
        await Hive.box(LOCAL_DB).put(KEY_EMPLOYEE, parsedData.map((dataJson) => EmployeeModel.fromJson(dataJson)).toList());
      }

      // get Branches
      final resBranches = await dio.get(API_SYSTEM_MASTER + '$param' + API_SYSTEM_BRANCHES);
      if (resBranches.statusCode == 200) {
        parsedData = await jsonDecode(jsonEncode(resBranches.data))[TAG_DATA] as List;
        await Hive.box(LOCAL_DB).put(KEY_BRANCH, parsedData.map((dataJson) => BranchModel.fromJson(dataJson)).toList());
      }

      // get Teams
      final resTeams = await dio.get(API_SYSTEM_MASTER + '$param' + API_SYSTEM_TEAMS);
      if (resTeams.statusCode == 200) {
        parsedData = await jsonDecode(jsonEncode(resTeams.data))[TAG_DATA] as List;
        await Hive.box(LOCAL_DB).put(KEY_TEAM, parsedData.map((dataJson) => TeamModel.fromJson(dataJson)).toList());
      }

      // get Warehouses
      final resWarehouses = await dio.get(API_SYSTEM_MASTER + '$param' + API_SYSTEM_WAREHOUSES);
      if (resWarehouses.statusCode == 200) {
        parsedData = await jsonDecode(jsonEncode(resWarehouses.data))[TAG_DATA] as List;
        await Hive.box(LOCAL_DB).put(KEY_WH, parsedData.map((dataJson) => WarehouseModel.fromJson(dataJson)).toList());
      }

      // get System Common
      final resSystem = await dio.get(API_SYSTEM_COMMON + '?codes=' + API_SYSTEM_COMMON_PARAM, data: param);
      if (resSystem.statusCode == 200) {
        parsedData = await jsonDecode(jsonEncode(resSystem.data))[TAG_DATA] as List;
        await Hive.box(LOCAL_DB).put(KEY_COMMON, parsedData.map((dataJson) => CommonModel.fromJson(dataJson)).toList());
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    }

    // //get overall - dashboard
    // sn.ProgressDialog pd = sn.ProgressDialog(context: Get.context);
    // try {
    //   pd.show(max: 100, msg: 'progress_loading'.tr, backgroundColor: CommonColors.bluesky);
    //   BranchModel branch = await Hive.box(LOCAL_DB).get(KEY_BRANCH).elementAt(0); // USER_INFO save
    //   var branchCode = branch.getBranchCode;
    //   final resOverall = await dio
    //       .get(API_MANAGEMENT + API_MANAGEMENT_OVERALL + '?nodeCd=' + branchCode! + '&fromDt=' + getFirstDay() + '&toDt=' + getToday(), data: param);
    //
    //   if (resOverall.statusCode == 200) {
    //     parsedData = await jsonDecode(jsonEncode(resOverall.data))[TAG_DATA][TAG_SALES];
    //     controllerSalesModel = OverAllSalesModel.fromJson(parsedData);
    //     parsedData = await jsonDecode(jsonEncode(resOverall.data))[TAG_DATA][TAG_PURCHASE];
    //     controllerPurchaseModel = OverAllPurchaseModel.fromJson(parsedData);
    //     parsedData = await jsonDecode(jsonEncode(resOverall.data))[TAG_DATA][TAG_DEPOSIT];
    //     controllerDepositModel = OverAllDepositModel.fromJson(parsedData);
    //     parsedData = await jsonDecode(jsonEncode(resOverall.data))[TAG_DATA][TAG_WITHDRAW];
    //     controllerWithdrawModel = OverAllWithdrawModel.fromJson(parsedData);
    //     parsedData = await jsonDecode(jsonEncode(resOverall.data))[TAG_DATA][TAG_RETURN];
    //     controllerReturnModel = OverAllReturnModel.fromJson(parsedData);
    //     parsedData = await jsonDecode(jsonEncode(resOverall.data))[TAG_DATA][TAG_RENTAL];
    //     controllerRentalModel = OverAllRentalModel.fromJson(parsedData);
    //     parsedData = await jsonDecode(jsonEncode(resOverall.data))[TAG_DATA][TAG_ASSET];
    //     controllerAssetModel = OverAllAssetModel.fromJson(parsedData);
    //
    //     update();
    //   }
    //   pd.close();
    // } on DioException catch (e) {
    //   pd.close();
    //   if (e.response != null) {
    //     ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
    //   }
    // }
  }
}
