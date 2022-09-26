import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layouts/example/menu_example.dart';

class OptionBtnMyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MenuExampleController());
    return TextButton(
      onPressed: () {
        //Get.find<MenuExampleController>().setVisible();
      },
      child: Get.find<MenuExampleController>().visible == true
          ? Icon(
              Icons.star_border,
              color: Colors.amber,
            )
          : Icon(
              Icons.star,
              color: Colors.amber,
            ),
    );
  }
}
