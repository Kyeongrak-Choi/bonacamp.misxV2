import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../layouts/example/menu_example.dart';
import '../../../utils/theme/color_manager.dart';

class OptionBtnSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MenuExampleController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Container(
            color: context.theme.backgroundColor,
            child: ElevatedButton(
                onPressed: () {
                  //ShowProgress(context);
                  Get.find<MenuExampleController>().setVisible();
                  //HideProgess(context);
                },
                child: Icon(Icons.search, color: context.theme.primaryColor),
                style: ElevatedButton.styleFrom(
                  foregroundColor: CommonColors.white,
                  backgroundColor: context.theme.canvasColor,
                )),
          ),
        )),
      ],
    );
  }
}
