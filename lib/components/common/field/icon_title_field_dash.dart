import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IconTitleFieldDash extends StatelessWidget {
  String titleName;
  var value;
  IconData iconData;

  IconTitleFieldDash({required this.titleName, this.value, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 15),
          child: Text(
            titleName,
            // style: context.textTheme.titleLarge,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 10,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 15),
          child: Text(
            value,
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 15),
          child: Text(
            '원',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
