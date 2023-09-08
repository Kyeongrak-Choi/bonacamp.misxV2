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
import 'package:misxV2/models/system/team.dart';
import 'package:misxV2/models/system/warehouse.dart';

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
    response = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_EMPLOYEES, '', API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA] as List;
    await Hive.box(LOCAL_DB).put(KEY_EMPLOYEE, parsedData.map((dataJson) => EmployeeModel.fromJson(dataJson)).toList());

    // get Branches
    response = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_BRANCHES, '', API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA] as List;
    await Hive.box(LOCAL_DB).put(KEY_EMPLOYEE, parsedData.map((dataJson) => EmployeeModel.fromJson(dataJson)).toList());

    // get Teams
    response = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_TEAMS, '', API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA] as List;
    await Hive.box(LOCAL_DB).put(KEY_TEAM, parsedData.map((dataJson) => TeamModel.fromJson(dataJson)).toList());

    // get Warehouses
    response = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_WAREHOUSES, '', API_REQ_GET);
    parsedData = await jsonDecode(response)[TAG_DATA] as List;
    await Hive.box(LOCAL_DB).put(KEY_WH, parsedData.map((dataJson) => WarehouseModel.fromJson(dataJson)).toList());

    // get Common
    // response = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_BRANCHES, '', API_REQ_GET);
    // parsedData = await jsonDecode(response)[TAG_DATA] as List;
    // await Hive.box(LOCAL_DB).put(KEY_EMPLOYEE, parsedData.map((dataJson) => EmployeeModel.fromJson(dataJson)).toList());


  }
}