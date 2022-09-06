import 'package:flutter/cupertino.dart';
import '../components/dashboard/dashboard_chart.dart';
import '../components/dashboard/dashboard_purchase.dart';
import '../components/dashboard/dashboard_rental.dart';
import '../components/dashboard/dashboard_sales.dart';
import '../components/submenuitem.dart';

class SalesMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
          child: SubMenuItem(), // 매출
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
    );
  }
}
