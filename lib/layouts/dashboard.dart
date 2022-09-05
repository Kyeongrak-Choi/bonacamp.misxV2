import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:renew_misx/components/dashboard/dashboard_chart.dart';
import 'package:renew_misx/components/dashboard/dashboard_purchase.dart';
import 'package:renew_misx/components/dashboard/dashboard_rental.dart';
import 'package:renew_misx/components/dashboard/dashboard_sales.dart';
import '../constants.dart';
import 'funtion.dart';

class DashBoard extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App_name'.tr),
      ),
      body: Obx(() {
        switch (Navigation.values[controller.currentIndex.value]) {
          case Navigation.SALE:
            return DashBoardSales();
          case Navigation.SALE2:
            return Menu();
          case Navigation.HOME:
            return DashBoardPurchase();
          case Navigation.SALE3:
            return DashBoardRental();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            onTap: controller.changeIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home),
                label: '1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings),
                label: '2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings),
                label: '3',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings),
                label: '4',
              ),
            ]),
      ),
    );
  }
}

class NavigationController extends GetxService {
  static NavigationController get to => Get.find();
  RxInt currentIndex = 0.obs;
  void changeIndex(int Index) {
    currentIndex(Index);
  }
}
