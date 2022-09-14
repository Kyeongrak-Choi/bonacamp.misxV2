import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../layouts/menu_example.dart';

class OptionBtnSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MenuExampleController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  Get.find<MenuExampleController>().setVisible();
                },
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                )))
      ],
    );
  }
}
