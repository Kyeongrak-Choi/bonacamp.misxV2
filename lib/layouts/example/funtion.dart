import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            ElevatedButton(onPressed: () => Get.toNamed(ROUTE_DIALOG_CUSTOMER), child: Text('title_search_customer'.tr)),
            ElevatedButton(onPressed: () => Get.toNamed(ROUTE_DIALOG_ITEM), child: Text('title_search_item'.tr)),
            ElevatedButton(onPressed: () => Get.toNamed(ROUTE_DIALOG_LENDITM), child: Text('title_search_lenditem'.tr)),
            ElevatedButton(onPressed: () => Get.toNamed(ROUTE_MENU_EXAMPLE), child: Text('매출원장 exam')),
            ElevatedButton(onPressed: () => Get.toNamed(ROUTE_API_EXAMPLE), child: Text('Api Call exam')),
          ],
        ),
      ),
    );
  }
}
