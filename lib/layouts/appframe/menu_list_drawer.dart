import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_inventory.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_location.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_purchase.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_sales.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_support.dart';

import '../../components/menu/card_title_menu.dart';
import '../../utils/menu_manager.dart';
import '../../utils/theme/text_theme.dart';
import '../config/config.dart';
import 'dashboard.dart';
import 'menu_list_content/menu_content_management.dart';

class MenuListDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(DrawerController());
    return Obx(() => Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ListTile(
                  title: Text('menu_main_managemnent'.tr, style: TextStyle(color: Colors.black),),
                  onTap: () {
                    _selectDrawerItem(0);
                  },
                ),
                ListTile(
                  title: Text('menu_main_sales'.tr, style: TextStyle(color: Colors.black),),
                  onTap: () {
                    _selectDrawerItem(1);
                  },
                ),
                ListTile(
                  title: Text('menu_main_purchase'.tr, style: TextStyle(color: Colors.black),),
                  onTap: () {
                    _selectDrawerItem(2);
                  },
                ),
                ListTile(
                  title: Text('menu_main_support'.tr, style: TextStyle(color: Colors.black),),
                  onTap: () {
                    _selectDrawerItem(3);
                  },
                ),
                ListTile(
                  title: Text('menu_main_location'.tr, style: TextStyle(color: Colors.black),),
                  onTap: () {
                    _selectDrawerItem(4);
                  },
                ),
                ListTile(
                  title: Text('menu_main_asset'.tr, style: TextStyle(color: Colors.black),),
                  onTap: () {
                    _selectDrawerItem(5);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: _buildSelectedScreen(Get.find<DrawerController>()._selectedIndex.value)
            ),
          ),
        ],
      ),
    ));
  }

  void _selectDrawerItem(int index) {
    Get.find<DrawerController>()._selectedIndex.value = index;
  }

  Widget _buildSelectedScreen(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return MenuContentManagemet();
      case 1:
        return MenuContentSales();
      case 2:
        return MenuContentPurchase();
      case 3:
        return MenuContentSupport();
      case 4:
        return MenuContentLocation();
      case 5:
        return MenuContentInventory();
      default:
        return Container();
    }
  }
}

class DrawerController extends GetxController {
  RxInt _selectedIndex = 0.obs;
}