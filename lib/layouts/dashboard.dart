import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/dashboard/dashboard_admob.dart';
import 'package:misxV2/components/dashboard/dashboard_chart2.dart';
import 'package:misxV2/components/dashboard/dashboard_purchase.dart';
import 'package:misxV2/components/dashboard/dashboard_rental.dart';
import 'package:misxV2/components/dashboard/dashboard_sales.dart';
import 'package:misxV2/models/management/overall/overallsales.dart';
import 'package:misxV2/models/system/common.dart';
import 'package:misxV2/models/system/team.dart';
import 'package:misxV2/models/system/warehouse.dart';

import '../models/management/overall/overall.dart';
import '../models/system/employee.dart';
import '../models/system/userinfo.dart';
import '../utils/constants.dart';
import '../utils/network/network_manager.dart';

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
                        child: DashBoardRental(), // 대여
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: DashBoardChart2(), // 차트
                      ),
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

  @override
  void onInit() async {
    super.onInit();

    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var param = user.getClientCode;
    var response;
    var parsedData;

    // get Employees
    response = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_EMPLOYEES, null, API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA] as List;
    await Hive.box(LOCAL_DB).put(KEY_EMPLOYEE, parsedData.map((dataJson) => EmployeeModel.fromJson(dataJson)).toList());

    // get Branches
    response = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_BRANCHES, null, API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA] as List;
    await Hive.box(LOCAL_DB).put(KEY_EMPLOYEE, parsedData.map((dataJson) => EmployeeModel.fromJson(dataJson)).toList());

    // get Teams
    response = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_TEAMS, null, API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA] as List;
    await Hive.box(LOCAL_DB).put(KEY_TEAM, parsedData.map((dataJson) => TeamModel.fromJson(dataJson)).toList());

    // get Warehouses
    response = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_WAREHOUSES, null, API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA] as List;
    await Hive.box(LOCAL_DB).put(KEY_WH, parsedData.map((dataJson) => WarehouseModel.fromJson(dataJson)).toList());

    // get Common
    response = await reqApi(API_SYSTEM_COMMON + '?codes=' +API_SYSTEM_COMMON_PARAM, param, API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA] as List;
    await Hive.box(LOCAL_DB).put(KEY_COMMON, parsedData.map((dataJson) => CommonModel.fromJson(dataJson)).toList());

    //get overall - dashboard
    response = await reqApi(API_SALES_OVERALL + '?nodeCd=0000&fromDt=20230905&toDt=20230905', param, API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA]['sales'];

    OverAllSalesModel salesModel = OverAllSalesModel.fromJson(parsedData);

    log('check 2 : ' + salesModel.getGrntAmt.toString());

  }
}