import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

class IconTitleField extends StatelessWidget {
  String titleName;
  var value;
  IconData iconData;

  IconTitleField({required this.titleName, this.value, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.w, 0.h, 0.w, 0.h),
          child: Icon(
            iconData,
            size: 24.sp,
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0.h, 0.w, 0.h),
            child: Text(
              titleName,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.w, 0.h, 0.w, 0.h),
            child: Text(
              value,
              style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ]),
    );
  }
}
