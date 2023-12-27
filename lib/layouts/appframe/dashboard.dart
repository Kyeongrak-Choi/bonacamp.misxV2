import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/dashboard/dashboard_Tab.dart';
import 'package:misxV2/components/dashboard/dashboard_admob.dart';
import 'package:misxV2/models/system/branch.dart';
import 'package:misxV2/models/system/common.dart';
import 'package:misxV2/models/system/dashboard_status.dart';
import 'package:misxV2/models/system/team.dart';
import 'package:misxV2/models/system/warehouse.dart';
import 'package:misxV2/utils/utility.dart';

import '../../components/dashboard/dashboard_graph.dart';
import '../../models/common/chart_spot.dart';
import '../../models/system/employee.dart';
import '../../models/system/userinfo.dart';
import '../../utils/constants.dart';
import '../../utils/database/hive_manager.dart';
import '../../utils/network/network_manager.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    Get.put(NetworkManager());
    Get.put(DashBoardController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
          onRefresh: () async {
            Get.find<DashBoardController>().getDashBoard();
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: getHiveBool(Hive.box(LOCAL_DB).get(KEY_SHOW_ADMOB, defaultValue: false))
                      ? EdgeInsetsDirectional.all(15)
                      : EdgeInsetsDirectional.all(0),
                  child: Container(
                    child: setChild(),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: DashBoardTab(),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      DashboardGraph(),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget? setChild() {
    if (getHiveBool(Hive.box(LOCAL_DB).get(KEY_SHOW_ADMOB, defaultValue: false))) {
      return DashBoardAdmob();
    } else {
      return null;
    }
  }
}

class DashBoardController extends GetxController {
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

    getDashBoard();
  }

  Future<void> getDashBoard() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;
    var parsedData;
    var param = user.getClientCode;

    dio = await reqApi(param);

    // sn.ProgressDialog pd = sn.ProgressDialog(context: Get.context);
    try {
      // pd.show(
      //   max: 1000,
      //   msg: 'Searching',
      //   cancel: Cancel(),
      //   backgroundColor: CommonColors.white,
      //   progressValueColor: CommonColors.primary,
      //   msgColor: CommonColors.primary,
      // );
      ShowProgress(Get.context);
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
      Navigator.pop(Get.context!);
      //ShowDialog(DIALOG_TYPE.NOTICE, '공지사항', '경영관리 리뉴얼 오픈', Get.context);
    } on DioException catch (e) {
      Navigator.pop(Get.context!);
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    }
  }
}
