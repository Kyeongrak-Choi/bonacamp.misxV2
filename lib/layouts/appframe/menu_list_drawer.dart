import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_inventory.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_location.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_purchase.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_sales.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_support.dart';

import '../../utils/theme/color_manager.dart';
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
                    Container(
                      height: 56,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_managemnent'.tr,
                          style: TextStyle(fontSize: 14.sp, color: context.theme.focusColor, fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[0],
                        tileColor: context.theme.canvasColor,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(0);
                        },
                      ),
                    ),
                    Container(
                      height: 56,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_sales'.tr,
                          style: TextStyle(fontSize: 14.sp, color: context.theme.focusColor, fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[1],
                        tileColor: context.theme.canvasColor,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(1);
                        },
                      ),
                    ),
                    Container(
                      height: 56,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_purchase'.tr,
                          style: TextStyle(fontSize: 14.sp, color: context.theme.focusColor, fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[2],
                        tileColor: context.theme.canvasColor,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(2);
                        },
                      ),
                    ),
                    Container(
                      height: 56,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_support'.tr,
                          style: TextStyle(fontSize: 14.sp, color: context.theme.focusColor, fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[3],
                        tileColor: context.theme.canvasColor,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(3);
                        },
                      ),
                    ),
                    Container(
                      height: 56,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_location'.tr,
                          style: TextStyle(fontSize: 14.sp, color: context.theme.focusColor, fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[4],
                        tileColor: context.theme.canvasColor,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(4);
                        },
                      ),
                    ),
                    Container(
                      height: 56,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_asset'.tr,
                          style: TextStyle(fontSize: 14.sp, color: context.theme.focusColor, fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[5],
                        tileColor: context.theme.canvasColor,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(5);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(child: _buildSelectedScreen(Get.find<DrawerController>()._selectedIndex.value)),
              ),
            ],
          ),
        ));
  }

  void _selectDrawerItem(int index) {
    Get.find<DrawerController>()._selectedIndex.value = index;

    for (int i = 0; i < Get.find<DrawerController>()._bSelected.length; i++) {
      if (i == index)
        Get.find<DrawerController>()._bSelected[i] = true;
      else
        Get.find<DrawerController>()._bSelected[i] = false;
    }
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

  //List<bool> _bSelected = <bool>[true, false, false, false, false, false].obs;
  RxList _bSelected = [true, false, false, false, false, false].obs;
}
