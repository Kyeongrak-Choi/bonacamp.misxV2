import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renew_misx/components/dashboard/dashboard_chart.dart';
import 'package:renew_misx/components/dashboard/dashboard_purchase.dart';
import 'package:renew_misx/components/dashboard/dashboard_rental.dart';
import 'package:renew_misx/components/dashboard/dashboard_sales.dart';
import 'package:renew_misx/constants.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('App_name'.tr),
        // ),
        backgroundColor: Color(AppColor),
        body: Container(
          child: GestureDetector(
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: DashBoardSales(), // 매출
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: DashBoardPurchase(), // 매입
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: DashBoardRental(), // 대여
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: DashBoardChart(), // 차트
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
