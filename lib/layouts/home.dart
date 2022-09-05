import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:renew_misx/components/dashboard/dashboard_chart.dart';
import 'package:renew_misx/components/dashboard/dashboard_purchase.dart';
import 'package:renew_misx/components/dashboard/dashboard_sales.dart';
import 'package:renew_misx/layouts/dashboard.dart';
import '../constants.dart';
import 'config.dart';
import 'funtion.dart';

class Home extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    controller.currentIndex.value=2;
    return Scaffold(
      appBar: AppBar(
        title: Text('App_name'.tr),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('menu butten is clicked');
          },
        ),
        actions: [          //actions -> 복수의 아이콘 버튼 등을 오른쪽에 배치할 때 사용
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Get.to(Config()),
          ),
        ],
      ),
      body: Obx(() {
        switch (Navigation.values[controller.currentIndex.value]) {
          case Navigation.FIRST:
            return DashBoardSales();
          case Navigation.SECOND:
            return DashBoardPurchase();
          case Navigation.HOME:
            return DashBoard();
          case Navigation.THIRD:
            return DashBoardChart();
          case Navigation.FOURTH:
            return Menu();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            onTap: controller.changeIndex,
            backgroundColor: Color(AppColor),
            fixedColor: Color(AppColor),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings),
                label: 'FIRST',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings),
                label: 'SECOND',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings),
                label: 'THIRD',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings),
                label: 'FOURTH',
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