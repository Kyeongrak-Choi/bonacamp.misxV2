import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:misxV2/layouts/dashboard.dart';
import 'package:misxV2/layouts/menu/menu_list.dart';
import 'package:misxV2/layouts/mymenu/mymenu_list.dart';

import '../components/common/dialog/logout_check.dart';
import '../utils/constants.dart';
import 'config/config.dart';
import 'example/funtion.dart';

class Navigation extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    controller.currentIndex.value = 0;

    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          //title: Text('App_name'.tr),
          title: Image.asset(
            'lib/assets/icons/logo.png',
          ),
          automaticallyImplyLeading: false,
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
                onPressed: () => LogoutCheckDialog(context)),
          ],
        ),
        // Drawer Use X
        // drawer: Drawer(
        //   child: DrawerMenu(),
        // ),
        body: Obx(() {
          switch (NavigationItem.values[controller.currentIndex.value]) {
            case NavigationItem.HOME:
              return DashBoard();
            case NavigationItem.MY:
              return MyMenuList();
            case NavigationItem.MENU:
              return MenuList();
            case NavigationItem.PREMIUM:
              //return PremiumList();
              return UtilFunction();
            case NavigationItem.CONFIG:
              return Config();
          }
        }),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          color: context.theme.primaryColor,
          backgroundColor: context.theme.backgroundColor,
          buttonBackgroundColor: context.theme.backgroundColor,
          items: [
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.home, color: Colors.blueGrey),
                  Text(
                    'nav_home'.tr,
                    style: TextStyle(color: Colors.blueGrey),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.star_border, color: Colors.blueGrey),
                  Text(
                    'nav_mymenu'.tr,
                    style: TextStyle(color: Colors.blueGrey),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.menu, color: Colors.blueGrey),
                  Text(
                    'nav_menu'.tr,
                    style: TextStyle(color: Colors.blueGrey),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.workspace_premium, color: Colors.blueGrey),
                  Text(
                    'nav_premium'.tr,
                    style: TextStyle(color: Colors.blueGrey),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.more_horiz_sharp, color: Colors.blueGrey),
                  Text(
                    'nav_more'.tr,
                    style: TextStyle(color: Colors.blueGrey),
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
  static NavigationController get to => Get.find();
  RxInt currentIndex = 0.obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void changeIndex(int Index) {
    currentIndex(Index);
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
}
