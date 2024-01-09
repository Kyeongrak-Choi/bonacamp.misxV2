import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/dashboard/dashboard_current.dart';
import 'package:misxV2/components/dashboard/dashboard_month.dart';
import 'package:misxV2/utils/constants.dart';

import '../../utils/theme/color_manager.dart';

class DashBoardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardTabController());
    return GetBuilder<DashBoardTabController>(
        builder: (DashBoardTabController controller) {
      return Container(
        color: context.theme.canvasColor,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w,
              BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelStyle: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  labelColor: context.theme.colorScheme.onPrimary,
                  unselectedLabelStyle: context.textTheme.bodyLarge,
                  unselectedLabelColor: Colors.grey,
                  controller: controller.tabController,
                  indicatorColor: context.theme.colorScheme.onPrimary,
                  indicatorWeight: 4,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.grey,
                  //indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                      BASIC_PADDING * 2.w,
                      0.h,
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING.h),
                  tabs: [
                    Container(
                      child: Text(
                        'dashboard_today'.tr,
                      ),
                      alignment: Alignment.center,
                    ),
                    Container(
                      child: Text(
                        'dashboard_month'.tr,
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1.h,
                color: CommonColors.black,
              ),
              SizedBox(
                height: BASIC_PADDING * 28.h,
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
        ),
      );
    });
  }
}

class DashBoardTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 800), // 탭 변경 애니메이션 시간
  );
}
