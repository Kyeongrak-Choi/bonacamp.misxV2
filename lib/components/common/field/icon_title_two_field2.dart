import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

class IconTitleTwoField2 extends StatelessWidget {
  String titleName;
  var value1;
  var value2;
  IconData iconData;

  IconTitleTwoField2({required this.titleName, this.value1, this.value2, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(
        iconData,
        size: 24.sp,
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
          child: Text(
            titleName,
            style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
          child: Text(
            value1,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
          child: Text(
            value2,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
