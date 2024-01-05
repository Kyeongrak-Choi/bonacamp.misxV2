import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IconTitleFieldConfig extends StatelessWidget {
  String titleName;
  var value;

  IconTitleFieldConfig({required this.titleName, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 15),
          child: Text(
            titleName,
            // style: context.textTheme.titleLarge,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: context.theme.focusColor),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 15),
          child: Text(
            value,
            style: TextStyle(fontSize: 16.sp, color: context.theme.focusColor),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
