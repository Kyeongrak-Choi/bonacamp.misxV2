import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class SumOneItemTable extends StatelessWidget {
  var titleName;
  var value;

  SumOneItemTable(titleName, value) {
    this.titleName = titleName;
    this.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.fromSTEB(0, BASIC_PADDING.h, 0, 0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                titleName ?? ' ',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      value ?? ' ',
                      style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
