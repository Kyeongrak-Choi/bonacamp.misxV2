import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/layouts/appframe/dashboard.dart';
import 'package:misxV2/layouts/appframe/menu_list.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

import '../../components/common/field/icon_title_field.dart';
import '../../models/system/userinfo.dart';
import '../../utils/constants.dart';
import '../../utils/theme/text_theme.dart';
import '../../utils/utility.dart';
import '../config/config.dart';

class Navigation extends GetView<NavigationController> {
  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());
    Get.put(DashBoardController());
    return WillPopScope(
      onWillPop: () {
        // return Future(() => true); // HW Back key disenable
        DateTime now = DateTime.now();
        if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          ShowSnackBar(SNACK_TYPE.INFO, "'뒤로'버튼을 한 번 더 누르면 종료됩니다.");
          return Future.value(false);
        }
        exit(0);
      },
      child: Scaffold(
        // key: controller.scaffoldKey,
        appBar: AppBar(
          title: Text(
            '${Get.find<DashBoardController>().clientNm}' ?? '',
            style: context.textTheme.displayLarge,
          ),
          // title: Image.asset(
          //   'lib/assets/icons/logo.png',
          // ),
          automaticallyImplyLeading: false,
          // HW Back Key disenable
          leading: IconButton(
            icon: Icon(Icons.account_circle_sharp),
            color: context.theme.primaryColor,
            onPressed: () {
              ShowUserInfoDialog(context);
            },
          ),
          backgroundColor: context.theme.canvasColor,
          actions: [
            // IconButton(
            //     icon: Icon(Icons.notifications_none_outlined),
            //     color: context.theme.primaryColor,
            //     onPressed: () => ShowDialog(DIALOG_TYPE.NOTICE, '공지사항 예시', '리뉴얼 오픈\n1.\n2.\n3.\n4.\n5.\n6.', context)
            // ),
            IconButton(icon: Icon(Icons.settings), color: context.theme.primaryColor, onPressed: () => Get.toNamed(ROUTE_MENU_CONFIG)),
            // IconButton(
            //     icon: Icon(Icons.logout),
            //     color: context.theme.primaryColor,
            //     onPressed: () => ShowDialog(DIALOG_TYPE.SELECT, 'logout'.tr, 'logout_content'.tr, context)),
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
            case NAVIGATION_BAR_ITEM.CONFIG:
              return Config();
            // case NAVIGATION_BAR_ITEM.MY:
            //   return MyMenuList();
            // case NAVIGATION_BAR_ITEM.PREMIUM:
            //   //return PremiumList();
            //   return UtilFunction();
          }
        }),
        bottomNavigationBar: Obx(() {
          return CurvedNavigationBar(
            index: controller.currentIndex.value,
            height: 50,
            color: CommonColors.signature,
            backgroundColor: context.theme.canvasColor,
            buttonBackgroundColor: CommonColors.signature,
            items: [
              Container(
                //height: 40,
                child: NAVIGATION_BAR_ITEM.values[controller.currentIndex.value] != NAVIGATION_BAR_ITEM.MENU
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.menu, color: context.theme.primaryColorLight),
                          Text(
                            'nav_menu'.tr,
                            style: TextStyle(color: context.theme.primaryColorLight),
                          )
                        ],
                      )
                    : Icon(Icons.menu, color: context.theme.primaryColorLight),
              ),
              Container(
                //height: 40,
                child: NAVIGATION_BAR_ITEM.values[controller.currentIndex.value] != NAVIGATION_BAR_ITEM.HOME
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home, color: context.theme.primaryColorLight),
                          Text(
                            'nav_home'.tr,
                            style: TextStyle(color: context.theme.primaryColorLight),
                          )
                        ],
                      )
                    : Icon(Icons.home, color: context.theme.primaryColorLight),
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
                //height: 40,
                child: NAVIGATION_BAR_ITEM.values[controller.currentIndex.value] != NAVIGATION_BAR_ITEM.CONFIG
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.more_horiz_sharp, color: context.theme.primaryColorLight),
                          Text(
                            'nav_more'.tr,
                            style: TextStyle(color: context.theme.primaryColorLight),
                          )
                        ],
                      )
                    : Icon(Icons.more_horiz_sharp, color: context.theme.primaryColorLight),
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
          );
        }),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxInt currentIndex = 1.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    changeIndex();
    currentIndex.value = 1;
  }

  changeIndex() {
    currentIndex.value = 1;
  }
}

void ShowUserInfoDialog(context) {
  UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO);
  Get.defaultDialog(
    title: 'user_info'.tr,
    titleStyle: TextStyle(color: CommonColors.signature),
    content: Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(children: [
          IconTitleField(
            titleName: 'user_name'.tr,
            value: user.getUserName,
            iconData: Icons.person,
          ),
          IconTitleField(
            titleName: 'user_id'.tr,
            value: user.getUserId,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: 'business_name'.tr,
            value: user.getClientName,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: 'business_no'.tr,
            value: convertBusinessNo(user.getBusinessNo),
            iconData: Icons.label_outlined,
          ),
        ]),
      ),
    ),
    confirmTextColor: Colors.white,
  );
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
