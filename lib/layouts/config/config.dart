import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/field/icon_title_field_config.dart';
import 'package:misxV2/components/menu/card_icon_menu.dart';
import 'package:misxV2/utils/database/hive_manager.dart';

import '../../models/system/userinfo.dart';
import '../../utils/constants.dart';
import '../../utils/menu_manager.dart';
import '../../utils/utility.dart';
import '../appframe/navigation.dart';

// 더보기 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionController());
    return GetBuilder<OptionController>(builder: (OptionController controller) {
      return Scaffold(
        body: Container(
          color: context.theme.canvasColor,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.background,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h,
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h),
                  child: Column(
                    children: [
                      IconTitleFieldConfig(
                        titleName: 'user_id'.tr,
                        value: controller.userId,
                      ),
                      IconTitleFieldConfig(
                        titleName: 'business_name'.tr,
                        value: controller.clientNm,
                      ),
                      IconTitleFieldConfig(
                        titleName: 'business_no'.tr,
                        value: controller.businessNo,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h,
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h),
                  child: Column(
                    children: [
                      CardIconMenu(iconMenuList: noticeMaster),
                      CardIconMenu(iconMenuList: systemMaster),
                      CardIconMenu(iconMenuList: menuMaster),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h,
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('logout'.tr, style: context.textTheme.bodyLarge),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () async {
                            Get.offAllNamed(ROUTE_LOGIN);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class OptionController extends GetxController {
  var clientNm;
  var businessNo;
  var userId;
  var userNm;

  RxBool isDark =
      getHiveBool(Hive.box(LOCAL_DB).get(KEY_THEME_MODE, defaultValue: false))
          .obs; // 다크모드
  RxBool isShowAdmob =
      getHiveBool(Hive.box(LOCAL_DB).get(KEY_SHOW_ADMOB, defaultValue: true))
          .obs; // 광고 보기
  RxBool isCustomFilter = getHiveBool(
          Hive.box(LOCAL_DB).get(KEY_CUSTOM_FILTER, defaultValue: false))
      .obs; // 거래처 필터링 사용
  RxBool isIncludeSalChrgCd = getHiveBool(
          Hive.box(LOCAL_DB).get(KEY_INCLUDE_SALCHRG, defaultValue: true))
      .obs; // 영업사원 선택시 관리사원 포함
  RxBool isCompareFirst = getHiveBool(
          Hive.box(LOCAL_DB).get(KEY_COMPARE_FIRST, defaultValue: false))
      .obs; // 초성검색시 첫글자부터 비교

  @override
  void onInit() {
    super.onInit();
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO);

    clientNm = user.getClientName;
    businessNo = convertBusinessNo(user.getBusinessNo.toString());
    userId = user.getUserId.toString();
    userNm = user.getUserName.toString();
  }

  Future<void> changeTheme(bool val) async {
    Get.put(NavigationController());
    isDark.value = val;

    await Hive.box(LOCAL_DB).put(KEY_THEME_MODE, val);
    Get.changeThemeMode(Hive.box(LOCAL_DB).get(KEY_THEME_MODE)
        ? ThemeMode.dark
        : ThemeMode.light);

    Get.find<NavigationController>().changeIndex();
  }

  Future<void> changeOption(String id, bool val) async {
    switch (id) {
      case KEY_CUSTOM_FILTER:
        isCustomFilter.value = val;
        break;
      case KEY_INCLUDE_SALCHRG:
        isIncludeSalChrgCd.value = val;
        break;
      case KEY_COMPARE_FIRST:
        isCompareFirst.value = val;
        break;
      case KEY_SHOW_ADMOB:
        isShowAdmob.value = val;
        break;
    }
    await Hive.box(LOCAL_DB).put(id, val);
  }
}
