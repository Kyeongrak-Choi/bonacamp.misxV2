import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:misxV2/layouts/dashboard.dart';
import 'package:misxV2/layouts/menu/menu_list.dart';
import 'package:misxV2/layouts/mymenu/mymenu_list.dart';

import '../utils/constants.dart';
import '../utils/theme/color_manager.dart';
import '../utils/utility.dart';
import 'config/config.dart';
import 'example/funtion.dart';

class Navigation extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    controller.currentIndex.value = 0;

    return WillPopScope(
      onWillPop: () {
        return Future(() => false); // HW Back key disenable
      },
      child: Scaffold(
        //key: controller.scaffoldKey,
        appBar: AppBar(
          //title: Text('App_name'.tr),
          title: Image.asset(
            'lib/assets/icons/logo.png',
          ),
          automaticallyImplyLeading: false, // HW Back Key disenable
          // leading: IconButton(
          //   icon: Icon(Icons.account_circle_sharp),
          //   color: context.theme.primaryColor,
          //   onPressed: () {
          //     //controller.openDrawer();
          //   },
          // ),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                color: context.theme.primaryColor,
                onPressed: () => ShowDialog(DIALOG_TYPE_SELECT, 'logout'.tr,
                    'logout_content'.tr, context)),
          ],
        ),
        // drawer: Drawer(
        //   child: DrawerMenu(),
        // ),
        body: Obx(() {
          switch (NAVIGATION_BAR_ITEM.values[controller.currentIndex.value]) {
            case NAVIGATION_BAR_ITEM.HOME:
              return DashBoard();
            case NAVIGATION_BAR_ITEM.MY:
              return MyMenuList();
            case NAVIGATION_BAR_ITEM.MENU:
              return MenuList();
            case NAVIGATION_BAR_ITEM.PREMIUM:
              //return PremiumList();
              return UtilFunction();
            case NAVIGATION_BAR_ITEM.CONFIG:
              return Config();
          }
        }),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          color: CommonColors.bluesky,
          backgroundColor: context.theme.backgroundColor,
          buttonBackgroundColor: context.theme.backgroundColor,
          items: [
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.home, color: CommonColors.navigation),
                  Text(
                    'nav_home'.tr,
                    style: TextStyle(color: CommonColors.navigation),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.star_border, color: CommonColors.navigation),
                  Text(
                    'nav_mymenu'.tr,
                    style: TextStyle(color: CommonColors.navigation),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.menu, color: CommonColors.navigation),
                  Text(
                    'nav_menu'.tr,
                    style: TextStyle(color: CommonColors.navigation),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.workspace_premium, color: CommonColors.navigation),
                  Text(
                    'nav_premium'.tr,
                    style: TextStyle(color: CommonColors.navigation),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.more_horiz_sharp, color: CommonColors.navigation),
                  Text(
                    'nav_more'.tr,
                    style: TextStyle(color: CommonColors.navigation),
                  )
                ],
              ),
            ),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
      ),
    );
  }
}

class NavigationController extends GetxService {
  RxInt currentIndex = 0.obs;

  changeIndex() {
    currentIndex.value = 4;
  }

  // drawer not use
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  // void openDrawer() {
  //   scaffoldKey.currentState?.openDrawer();
  // }
  //
  // void closeDrawer() {
  //   scaffoldKey.currentState?.openEndDrawer();
  // }
}
