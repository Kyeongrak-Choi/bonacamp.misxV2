import 'package:flutter/material.dart';
import 'package:misxV2/components/common/emptyWidget.dart';

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
        SizedBox(width: 50),
        Expanded(flex: 1, child: secondItem),
      ],
    );
  }
}
