import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/dashboard/dashboard_current.dart';
import 'package:misxV2/components/dashboard/dashboard_month.dart';

import 'dashboard_graph.dart';

class DashBoardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardTabController());
    return GetBuilder<DashBoardTabController>(builder: (DashBoardTabController controller) {
      return Container(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  // 선택된 탭의 색상
                  unselectedLabelColor: Colors.grey,
                  // 선택되지 않은 택의 색상
                  controller: controller.tabController,
                  indicatorColor: Colors.black,
                  indicatorWeight: 5,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.black,
                  indicatorPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  //unselectedLabelStyle: TextStyle(fontSize: 18.sp,color: Colors.grey,fontWeight: FontWeight.bold),

                  labelStyle: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  tabs: [
                    Container(
                      child: Text(
                        'title_current'.tr,
                      ),
                      alignment: Alignment.center,
                    ),
                    Container(
                      child: Text(
                        'title_month'.tr,
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: 240.h,
                //height: mainAxisSize: MainAxisSize.max,
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    DashBoardCurrent(),
                    DashBoardMonth(),
                  ],
                ),
              ),
              DashboardGraph(),
            ],
          ),



        ),
      );
    });
  }
}

class DashBoardTabController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 800), // 탭 변경 애니메이션 시간
  );
}
