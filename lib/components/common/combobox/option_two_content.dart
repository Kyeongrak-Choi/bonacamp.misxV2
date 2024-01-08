import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misxV2/components/common/emptyWidget.dart';
import 'package:misxV2/utils/constants.dart';

class OptionTwoContent extends StatelessWidget {
  Widget firstItem = EmptyWidget();
  Widget secondItem = EmptyWidget();

  OptionTwoContent(Widget first, Widget second) {
    this.firstItem = first;
    this.secondItem = second;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: firstItem),
        SizedBox(width: BASIC_PADDING * 3.w),
        Expanded(flex: 1, child: secondItem),
      ],
    );
  }
}
