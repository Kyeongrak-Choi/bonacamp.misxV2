import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/dashboard/dashboard_item.dart';

class DashBoardSales extends StatelessWidget {
  const DashBoardSales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.all(10),
            child: Text(
              'title_sales'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.headline3,
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: context.theme.canvasColor,
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                // dummy
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: DashBoardItem('매출금액', '890,380'),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: DashBoardItem('공급금액', '805,800'),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: DashBoardItem('채권잔액', '4,636,346'),
                ),
              ],
            )),
      ],
    );
  }
}
