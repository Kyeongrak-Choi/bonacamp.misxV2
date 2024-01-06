import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

class IconTitleFieldDash extends StatelessWidget {
  String titleName;
  var value;
  IconData iconData;

  IconTitleFieldDash(
      {required this.titleName, this.value, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w,
          BASIC_PADDING.h, BASIC_PADDING * 2.w, BASIC_PADDING.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          titleName,
          style: context.textTheme.bodyLarge,
        ),
        Container(
          child: Row(
            children: [
              Text(
                value,
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                ' 원',
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
