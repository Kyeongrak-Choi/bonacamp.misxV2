import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:renew_misx/components/dashboard/dashboard_chart.dart';
import 'package:renew_misx/components/dashboard/dashboard_purchase.dart';
import 'package:renew_misx/components/dashboard/dashboard_sales.dart';
import 'package:renew_misx/layouts/dashboard.dart';
import 'package:renew_misx/layouts/salesmenu.dart';
import '../constants.dart';
import 'config.dart';
import 'funtion.dart';

class Navigation extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    controller.currentIndex.value=0;
    return Scaffold(
      appBar: AppBar(
        title: Text('App_name'.tr),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [          //actions -> 복수의 아이콘 버튼 등을 오른쪽에 배치할 때 사용
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Get.to(Config()),
          ),
        ],
      ),
      body: Obx(() {
        switch (NavigationItem.values[controller.currentIndex.value]) {
          case NavigationItem.HOME:
            return DashBoard();
          case NavigationItem.FIRST:
            return SalesMenu();
          case NavigationItem.SECOND:
            return DashBoardPurchase();
          case NavigationItem.THIRD:
            return DashBoardChart();
          case NavigationItem.FOURTH:
            return Menu();
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
                label: 'nav_home'.tr, // Home화면
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.point_of_sale),
                activeIcon: Icon(Icons.point_of_sale_outlined),
                label: 'nav_sale'.tr, // 영업관리
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.airport_shuttle),
                activeIcon: Icon(Icons.airport_shuttle_outlined),
                label: 'nav_purc'.tr, // 매입관리
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.back_hand),
                activeIcon: Icon(Icons.back_hand_outlined),
                label: 'nav_supp'.tr, // 지원관리
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.warehouse),
                activeIcon: Icon(Icons.warehouse_outlined),
                label: 'nav_stoc'.tr, // 재고관리
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