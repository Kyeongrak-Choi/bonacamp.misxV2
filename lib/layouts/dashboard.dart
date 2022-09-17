import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/dashboard/dashboard_admob.dart';
import 'package:misxV2/components/dashboard/dashboard_chart.dart';
import 'package:misxV2/components/dashboard/dashboard_purchase.dart';
import 'package:misxV2/components/dashboard/dashboard_rental.dart';
import 'package:misxV2/components/dashboard/dashboard_sales.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
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
                      child: DashBoardChart(), // 차트
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
