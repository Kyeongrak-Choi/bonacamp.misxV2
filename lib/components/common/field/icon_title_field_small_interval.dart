import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

class IconTitleFieldSmallInterval extends StatelessWidget {
  String titleName;
  var value;
  IconData iconData;

  IconTitleFieldSmallInterval(
      {required this.titleName, this.value, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(iconData, color: context.theme.colorScheme.onPrimary),
      Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
          child: Text(
            titleName,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
          child: Text(
            value,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
