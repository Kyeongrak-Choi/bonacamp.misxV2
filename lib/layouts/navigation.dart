import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:renew_misx/layouts/dashboard.dart';
import 'package:renew_misx/layouts/purchase/purchase_menu.dart';
import 'package:renew_misx/layouts/sales/sales_menu.dart';
import 'package:renew_misx/layouts/stock/stock_menu.dart';
import 'package:renew_misx/layouts/support/support_menu.dart';
import '../components/menu/drawer_menu.dart';
import '../constants.dart';
import 'config.dart';
import 'funtion.dart';

class Navigation extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    controller.currentIndex.value = 0;

    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: Text('App_name'.tr),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            controller.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
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
            return StockMenu();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            backgroundColor: Color(AppColor),
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            onTap: controller.changeIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.withOpacity(.50),
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
