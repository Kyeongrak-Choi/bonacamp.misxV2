import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/dashboard/dashboard_current.dart';
import 'package:misxV2/components/dashboard/dashboard_month.dart';

import '../../utils/theme/color_manager.dart';
import 'dashboard_graph.dart';

class DashBoardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardTabController());
    return GetBuilder<DashBoardTabController>(builder: (DashBoardTabController controller) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
         // mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelColor: context.theme.focusColor,
                // 선택된 탭의 색상
                unselectedLabelColor: Colors.grey,
                // 선택되지 않은 택의 색상
                controller: controller.tabController,
                indicatorColor: Colors.black,
                indicatorWeight: 4,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.grey,
                //indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                labelPadding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
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
            Divider(
              height: 1,
              color: CommonColors.black,
            ),
            SizedBox(
              height: 160.h,
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  DashBoardCurrent(),
                  DashBoardMonth(),
                ],
              ),
            ),

          ],
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
