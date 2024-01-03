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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          titleName,
          style: TextStyle(fontSize: 14.sp, color: context.theme.focusColor),
        ),
        Container(
          child: Row(
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: context.theme.focusColor),
              ),
              Text(
                ' 원',
                style: TextStyle(fontSize: 14.sp, color: context.theme.focusColor),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
