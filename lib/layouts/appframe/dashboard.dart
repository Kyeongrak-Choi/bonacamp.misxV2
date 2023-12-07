import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/dashboard/dashboard_admob.dart';
import 'package:misxV2/components/dashboard/dashboard_current.dart';
import 'package:misxV2/components/dashboard/dashboard_month.dart';
import 'package:misxV2/models/system/branch.dart';
import 'package:misxV2/models/system/common.dart';
import 'package:misxV2/models/system/dashboard_status.dart';
import 'package:misxV2/models/system/team.dart';
import 'package:misxV2/models/system/warehouse.dart';
import 'package:misxV2/utils/utility.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart' as sn;

import '../../components/common/emptyWidget.dart';
import '../../components/dashboard/dashboard_graph.dart';
import '../../models/common/chart_spot.dart';
import '../../models/system/employee.dart';
import '../../models/system/userinfo.dart';
import '../../utils/constants.dart';
import '../../utils/database/hive_manager.dart';
import '../../utils/network/network_manager.dart';
import '../../utils/theme/color_manager.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NetworkManager());
    Get.put(DashBoardController());
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
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
                  //child: DashBoardAdmob(), // 광고
                  child: setChild(),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                      //   child: DashBoardSales(), // 매출
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      //   child: DashBoardPurchase(), // 매입
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      //   child: DashBoardDeposit(), // 회수
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      //   child: DashBoardWithdraw(), // 출금
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      //   child: DashBoardReturn(), // 반납
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      //   child: DashBoardRental(), // 대여
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                      //   child: DashBoardAsset(), // 자산
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.all(20),
                      //   child: DashBoardChart2(), // 차트
                      // ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: DashBoardCurrent(), // 당일 현황
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: DashBoardMonth(), // 당원 현황
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: DashboardGraph(), // 차트
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget setChild() {
    if (getHiveBool(Hive.box(LOCAL_DB).get(KEY_SHOW_ADMOB, defaultValue: false))) {
      return DashBoardAdmob();
    } else {
      return EmptyWidget();
    }
  }
}

class DashBoardController extends GetxController {
  // var controllerSalesModel;
  //  var controllerPurchaseModel;
  //  var controllerDepositModel;
  //  var controllerWithdrawModel;
  //  var controllerReturnModel;
  //  var controllerRentalModel;
  //  var controllerAssetModel;

  var controllerCurrentModel;
  var controllerMonthModel;

  List<ChartSpot> salesList = [];
  List<ChartSpot> bondList = [];

  var clientNm;

  @override
  void onInit() async {
    super.onInit();

    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var param = user.getClientCode;
    var dio;
    var parsedData;

    clientNm = user.getClientName;

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

    //get dashboard
    sn.ProgressDialog pd = sn.ProgressDialog(context: Get.context);
    try {
      pd.show(
        max: 1000,
        msg: '',
        backgroundColor: CommonColors.signature,
        progressValueColor: CommonColors.white,
        msgColor: CommonColors.white,
      );
      BranchModel branch = await Hive.box(LOCAL_DB).get(KEY_BRANCH).elementAt(0); // USER_INFO save
      var branchCode = branch.getBranchCode;
      final resDashboard = await dio
          .get(API_MANAGEMENT + API_SYSTEM_DASHBOARD + '?branch=' + branchCode! + '&from=' + getFirstDay() + '&to=' + getToday(), data: param);

      if (resDashboard.statusCode == 200) {
        parsedData = await jsonDecode(jsonEncode(resDashboard.data))[TAG_DATA][TAG_CURRENT];
        controllerCurrentModel = DashboardStatusModel.fromJson(parsedData);
        parsedData = await jsonDecode(jsonEncode(resDashboard.data))[TAG_DATA][TAG_MONTH];
        controllerMonthModel = DashboardStatusModel.fromJson(parsedData);

        salesList.clear();
        bondList.clear();

        for (var list in await jsonDecode(jsonEncode(resDashboard.data))[TAG_DATA][TAG_SALES]) {
          salesList.add(ChartSpot(list['date-name'].toString().substring(3, 6), list['total']));
        }

        for (var list in await jsonDecode(jsonEncode(resDashboard.data))[TAG_DATA][TAG_GRAPH_BOND]) {
          bondList.add(ChartSpot(list['date-name'].toString().substring(3, 6), list['amount']));
        }

        update();
      }
      pd.close();
      ShowDialog(DIALOG_TYPE.NOTICE, '공지사항', '경영관리 리뉴얼 오픈', Get.context);
    } on DioException catch (e) {
      pd.close();
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    }
  }
}
