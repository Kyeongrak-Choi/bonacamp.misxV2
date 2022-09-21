import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../layouts/example/menu_example.dart';
import '../../../utils/constants.dart';

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
                  Get.find<MenuExampleController>().setVisible();
                },
                child: Icon(Icons.search, color: context.theme.primaryColor),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: context.theme.canvasColor,
                )),
          ),
        )),
      ],
    );
  }
}
