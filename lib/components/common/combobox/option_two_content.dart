import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_manager.dart';
import 'package:misxV2/components/common/emptyWidget.dart';
import 'package:misxV2/models/system/branch.dart';

import '../../../utils/constants.dart';

class OptionTwoContent extends StatelessWidget {
  Widget firstItem = EmptyWidget();
  Widget secondItem = EmptyWidget();

  OptionTwoContent(Widget first, Widget second){
    this.firstItem = first;
    this.secondItem = second;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: firstItem),
        SizedBox(width: 20),
        Expanded(flex: 1, child: secondItem),

      ],
    );
  }


}