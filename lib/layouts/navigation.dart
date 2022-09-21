import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:misxV2/layouts/dashboard.dart';
import 'package:misxV2/layouts/example/menu_example.dart';
import 'package:misxV2/layouts/purchase/purchase_menu.dart';
import 'package:misxV2/layouts/sales/sales_menu.dart';
import 'package:misxV2/layouts/stock/stock_menu.dart';
import 'package:misxV2/layouts/support/support_menu.dart';
import '../components/menu/drawer_menu.dart';
import '../utils/constants.dart';
import 'config.dart';
import 'funtion.dart';

class Navigation extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    controller.currentIndex.value = 0;

    return WillPopScope(
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          title: Text('App_name'.tr),
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: context.theme.primaryColor,
            onPressed: () {
              controller.openDrawer();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              color: context.theme.primaryColor,
              onPressed: () => Get.to(Config()),
            ),
          ],
        ),
        drawer: Drawer(
          child: DrawerMenu(),
        ),
        body: Obx(() {
          switch (NavigationItem.values[controller.currentIndex.value]) {
            case NavigationItem.HOME:
              return DashBoard();
            case NavigationItem.SALES:
              return SalesMenu();
            case NavigationItem.PURCHASE:
              return PurchaseMenu();
            case NavigationItem.SUPPORT:
              return SupportMenu();
            case NavigationItem.STOCK:
              //return StockMenu();
              return UtilFunction();
          }
        }),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              backgroundColor: context.theme.backgroundColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex.value,
              showSelectedLabels: true,
              onTap: controller.changeIndex,
              selectedItemColor: context.theme.primaryColor,
              unselectedItemColor: context.theme.primaryColor.withOpacity(.30),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home_outlined),
                  label: 'nav_home'.tr, // Home
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.point_of_sale),
                  activeIcon: Icon(Icons.point_of_sale_outlined),
                  label: 'nav_sales'.tr, // 영업관리
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.airport_shuttle),
                  activeIcon: Icon(Icons.airport_shuttle_outlined),
                  label: 'nav_purchase'.tr, // 매입관리
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.back_hand),
                  activeIcon: Icon(Icons.back_hand_outlined),
                  label: 'nav_support'.tr, // 지원관리
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.warehouse),
                  activeIcon: Icon(Icons.warehouse_outlined),
                  label: 'nav_stock'.tr, // 재고관리
                ),
              ]),
        ),
      ),
      onWillPop: () {
        // 홈화면에서 back button 비활성화
        return Future(() => false);
      },
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
