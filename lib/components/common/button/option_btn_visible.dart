import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../layouts/menu_example.dart';

class OptionBtnVisible extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(MenuExampleController());
    return TextButton(
      onPressed: () {
        Get.find<MenuExampleController>().setVisible();
      },
      child: Get.find<MenuExampleController>().visible == true
          ? Icon(
              Icons.arrow_circle_up_outlined,
              color: Colors.white,
            )
          : Icon(Icons.arrow_circle_down, color: Colors.white),
    );
  }
}
