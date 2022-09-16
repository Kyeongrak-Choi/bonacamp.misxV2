import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/theme/text_theme.dart';
import '../../utils/theme/theme_manager.dart';
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
            padding: EdgeInsetsDirectional.all(10),
            child: Text(
              'title_rental'.tr,
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
                  child: DashBoardItem( '대여금액', '1,200,000'), // 매출
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: DashBoardItem( '회수금액', '850,000'), // 매출
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: DashBoardItem( '대여잔액', '700,000'), // 매출
                ),
              ],
            )
        ),
      ],
    );
  }
}
