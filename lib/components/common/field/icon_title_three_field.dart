import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

class IconTitleThreeField extends StatelessWidget {
  String titleName;
  var value1;
  var value2;
  var value3;
  IconData iconData;

  IconTitleThreeField(
      {required this.titleName,
      this.value1,
      this.value2,
      this.value3,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(iconData,size: 14.sp,),
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
          child: Text(
            titleName,
            style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
          child: Text(
            value1,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
          child: Text(
            value2,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
          child: Text(
            value3,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
