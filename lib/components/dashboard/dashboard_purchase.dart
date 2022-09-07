import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import 'dashboard_item.dart';

class DashBoardPurchase extends StatelessWidget {
  const DashBoardPurchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
            child: Text(
              'title_purcahse'.tr,
              textAlign: TextAlign.start,
              style: textTheme().headline2,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
            child: Column(
              children: [
                // dummy
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: DashBoardItem( '매입금액', '157,380'), // 매출
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: DashBoardItem( '공급금액', '143,520'), // 매출
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: DashBoardItem( '채무잔액', '5,123,346'), // 매출
                ),
              ],
            )
        ),
      ],
    );
  }
}
