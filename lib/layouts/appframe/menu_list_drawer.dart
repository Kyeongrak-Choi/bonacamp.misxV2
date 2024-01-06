import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_inventory.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_location.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_purchase.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_sales.dart';
import 'package:misxV2/layouts/appframe/menu_list_content/menu_content_support.dart';
import 'package:misxV2/utils/constants.dart';

import 'menu_list_content/menu_content_management.dart';

class MenuListDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DrawerController());
    return Obx(() => Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      height: BASIC_PADDING * 7.h,
                      alignment: Alignment.center,
                     // color: context.theme.colorScheme.background,
                      child: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Text(
                          'menu_main_managemnent'.tr,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[0],
                        tileColor: context.theme.colorScheme.background,
                        selectedTileColor: context.theme.canvasColor,
                        onTap: () {
                          _selectDrawerItem(0);
                        },
                      ),
                    ),
                    Container(
                      height: BASIC_PADDING * 7.h,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_sales'.tr,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[1],
                        tileColor: context.theme.colorScheme.background,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(1);
                        },
                      ),
                    ),
                    Container(
                      height: BASIC_PADDING * 7.h,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_purchase'.tr,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[2],
                        tileColor: context.theme.colorScheme.background,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(2);
                        },
                      ),
                    ),
                    Container(
                      height: BASIC_PADDING * 7.h,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_support'.tr,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[3],
                        tileColor: context.theme.colorScheme.background,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(3);
                        },
                      ),
                    ),
                    Container(
                      height: BASIC_PADDING * 7.h,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_location'.tr,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[4],
                        tileColor: context.theme.colorScheme.background,
                        selectedTileColor: context.theme.hoverColor,
                        onTap: () {
                          _selectDrawerItem(4);
                        },
                      ),
                    ),
                    Container(
                      height: BASIC_PADDING * 7.h,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          'menu_main_asset'.tr,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        selected: Get.find<DrawerController>()._bSelected[5],
                        tileColor: context.theme.colorScheme.background,
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
                child: _buildSelectedScreen(
                    Get.find<DrawerController>()._selectedIndex.value),
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
  RxList _bSelected = [true, false, false, false, false, false].obs;
}
