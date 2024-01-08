import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

class IconTitleTwoField extends StatelessWidget {
  String titleName;
  var value1;
  var value2;
  IconData iconData;

  IconTitleTwoField(
      {required this.titleName,
      this.value1,
      this.value2,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.background,
      padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w, BASIC_PADDING.h, BASIC_PADDING * 2.w, BASIC_PADDING.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(iconData, color: context.theme.colorScheme.onSurface),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0, 0, 0),
          child: Text(
            titleName,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  value1 + ' 원',
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.end,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  value2 + ' 원',
                  style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
