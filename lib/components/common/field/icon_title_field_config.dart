import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

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
          padding: EdgeInsetsDirectional.fromSTEB(
              0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
          child: Text(
            titleName,
            // style: context.textTheme.titleLarge,
            style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
          child: Text(
            value,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
