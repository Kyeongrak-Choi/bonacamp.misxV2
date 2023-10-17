import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/layouts/appframe/dashboard.dart';
import 'package:misxV2/layouts/appframe/menu_list.dart';

import '../../models/system/userinfo.dart';
import '../../utils/constants.dart';
import '../../utils/utility.dart';
import '../config/config.dart';

class Navigation extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());
    return WillPopScope(
      onWillPop: () {
        return Future(() => false); // HW Back key disenable
      },
      child: Scaffold(
        // key: controller.scaffoldKey,
        appBar: AppBar(
          title: Text('${Get.find<NavigationController>().clientNm.value}' ?? '', style: context.textTheme.displayLarge),
          // title: Image.asset(
          //   'lib/assets/icons/logo.png',
          // ),
          automaticallyImplyLeading: false,
          // HW Back Key disenable
          leading: IconButton(
            icon: Icon(Icons.account_circle_sharp),
            color: context.theme.primaryColor,
            onPressed: () {
              ShowDialog(DIALOG_TYPE.MSG, '사용자정보', '아이디:', Get.context);
            },
          ),
          backgroundColor: context.theme.canvasColor,
          actions: [
            IconButton(icon: Icon(Icons.settings), color: context.theme.primaryColor, onPressed: () => Get.toNamed(ROUTE_MENU_CONFIG)),
            IconButton(
                icon: Icon(Icons.logout),
                color: context.theme.primaryColor,
                onPressed: () => ShowDialog(DIALOG_TYPE.SELECT, 'logout'.tr, 'logout_content'.tr, context)),
          ],
        ),
        // drawer: Drawer(
        //   child: DrawerMenu(),
        // ),
        body: Obx(() {
          switch (NAVIGATION_BAR_ITEM.values[controller.currentIndex.value]) {
            case NAVIGATION_BAR_ITEM.MENU:
              return MenuList();
            case NAVIGATION_BAR_ITEM.HOME:
              return DashBoard();
            // case NAVIGATION_BAR_ITEM.MY:
            //   return MyMenuList();
            // case NAVIGATION_BAR_ITEM.PREMIUM:
            //   //return PremiumList();
            //   return UtilFunction();
            case NAVIGATION_BAR_ITEM.CONFIG:
              return Config();
          }
        }),
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          height: 50,
          color: context.theme.cardColor,
          backgroundColor: context.theme.canvasColor,
          buttonBackgroundColor: context.theme.canvasColor,
          items: [
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.more_horiz_sharp, color: context.theme.primaryColor),
                  Text(
                    'nav_more'.tr,
                    style: TextStyle(color: context.theme.primaryColor),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.home, color: context.theme.primaryColor),
                  Text(
                    'nav_home'.tr,
                    style: TextStyle(color: context.theme.primaryColor),
                  )
                ],
              ),
            ),
            // Container(
            //   height: 50,
            //   child: Column(
            //     children: [
            //       Icon(Icons.star_border, color: CommonColors.navigation),
            //       Text(
            //         'nav_mymenu'.tr,
            //         style: TextStyle(color: CommonColors.navigation),
            //       )
            //     ],
            //   ),
            // ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.menu, color: context.theme.primaryColor),
                  Text(
                    'nav_menu'.tr,
                    style: TextStyle(color: context.theme.primaryColor),
                  )
                ],
              ),
            ),
            // Container(
            //   height: 50,
            //   child: Column(
            //     children: [
            //       Icon(Icons.workspace_premium, color: CommonColors.navigation),
            //       Text(
            //         'nav_premium'.tr,
            //         style: TextStyle(color: CommonColors.navigation),
            //       )
            //     ],
            //   ),
            // ),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxString clientNm = ''.obs;
  RxInt currentIndex = 1.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setUserinfo();
    changeIndex();
    currentIndex.value = 1;
  }

  Future<void> setUserinfo() async {
    await Hive.openBox(
      LOCAL_DB,
    );
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO);
    clientNm.value = user.getClientName;
  }

  changeIndex() {
    currentIndex.value = 1;
  }
}

// class NavigationController extends GetxService {
//   RxInt currentIndex = 1.obs;
//   var clientName;
//
//   changeIndex() {
//     currentIndex.value = 1;
//   }
//
//   Future<void> setUserinfo() async {
//     await Hive.openBox(
//       LOCAL_DB,
//     );
//     UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO);
//
//     clientName.value = user.getClientName;
//   }
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     setUserinfo();
//   }
//
// // local db Setting
//
// drawer not use
// var scaffoldKey = GlobalKey<ScaffoldState>();
// void openDrawer() {
//   scaffoldKey.currentState?.openDrawer();
// }
//
// void closeDrawer() {
//   scaffoldKey.currentState?.openEndDrawer();
// }
// }
