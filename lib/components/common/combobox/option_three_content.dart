import 'package:flutter/material.dart';
import 'package:misxV2/components/common/emptyWidget.dart';

class OptionThreeContent extends StatelessWidget {
  Widget firstItem = EmptyWidget();
  Widget secondItem = EmptyWidget();
  Widget thirdItem = EmptyWidget();

  OptionThreeContent(Widget first, Widget second, Widget third){
    this.firstItem = first;
    this.secondItem = second;
    this.thirdItem = third;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: firstItem),
        SizedBox(width: 20),
        Expanded(flex: 1, child: secondItem),
        SizedBox(width: 20),
        Expanded(flex: 1, child: thirdItem),
      ],
    );
  }


}