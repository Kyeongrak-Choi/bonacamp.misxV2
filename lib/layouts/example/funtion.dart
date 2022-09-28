import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/constants.dart';

class UtilFunction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Get.toNamed(ROUTE_DIALOG_CUSTOMER),
                child: Text('title_search_customer'.tr)),
            ElevatedButton(
                onPressed: () => Get.toNamed(ROUTE_DIALOG_PRODUCT),
                child: Text('title_search_product'.tr)),
            ElevatedButton(
                onPressed: () => Get.toNamed(ROUTE_MENU_EXAMPLE),
                child: Text('매출원장 exam')),
            ElevatedButton(
                onPressed: () => Get.toNamed(ROUTE_API_EXAMPLE),
                child: Text('Api Call exam')),
          ],
        ),
      ),
    );
  }
}
