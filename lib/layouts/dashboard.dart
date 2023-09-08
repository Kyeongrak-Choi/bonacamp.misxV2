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

import '../models/system/salchrg.dart';
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
    // System data Save
    //await reqSystem(API_SYSTEM_MASTER + '$param' + API_SYSTEM_EMPLOYEES,'');

    var res = await reqApi(API_SYSTEM_MASTER + '$param' + API_SYSTEM_EMPLOYEES, '', API_REQ_GET);

    log('res1 : $res');

    var parsedData = await jsonDecode(res)[TAG_DATA] as List;
     await Hive.box(LOCAL_DB).put(KEY_SALCHRG, parsedData.map((dataJson) => SalChrgModel.fromJson(dataJson)).toList());

    log('res2 : $res');
  }
}