import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowListHeaderRow extends StatelessWidget {
  String titleName;
  var value;

  ShowListHeaderRow({required this.titleName, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(30, 10, 10, 0),
      child: Text(
        titleName,
        style: TextStyle(color: context.theme.focusColor, fontSize: 16.sp),
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
