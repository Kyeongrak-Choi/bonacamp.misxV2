import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme.dart';
import 'dashboard_item.dart';

class DashBoardRental extends StatelessWidget {
  const DashBoardRental({Key? key}) : super(key: key);

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
              'title_rental'.tr,
              textAlign: TextAlign.start,
              style: textTheme().subtitle2,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: DashBoardItem( '대여금액', '1,200,000'), // 매출
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: DashBoardItem( '회수금액', '850,000'), // 매출
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: DashBoardItem( '대여잔액', '700,000'), // 매출
                ),
              ],
            )
        ),
      ],
    );
  }
}
