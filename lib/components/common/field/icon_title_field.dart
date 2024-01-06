import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IconTitleField extends StatelessWidget {
  String titleName;
  var value;
  IconData iconData;

  IconTitleField({required this.titleName, this.value, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 16.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(
          iconData,
          size: 24.sp,
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.w, 0, 0, 0),
            child: Text(
              titleName,
              style: context.textTheme.bodyLarge!
                  .merge(TextStyle(fontWeight: FontWeight.bold)),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Text(
              value,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ]),
    );
  }
}
