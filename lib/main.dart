import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:misxV2/assets/translations/language_manager.dart';
import 'package:misxV2/layouts/common/search_customer_dialog.dart';
import 'package:misxV2/layouts/menu/management/overall_status.dart';
import 'package:misxV2/layouts/menu/management/sales_class_status.dart';
import 'package:misxV2/layouts/menu/management/sales_rank.dart';
import 'package:misxV2/layouts/menu/management/salesperson_contribute.dart';
import 'package:misxV2/layouts/menu/purchase/purchase_report.dart';
import 'package:misxV2/layouts/menu/sales/achievement.dart';
import 'package:misxV2/layouts/menu/sales/customer_report.dart';
import 'package:misxV2/layouts/menu/sales/salesperson_report_monthly.dart';
import 'package:misxV2/utils/constants.dart';
import 'package:misxV2/utils/database/hive_manager.dart';
import 'package:misxV2/utils/theme/theme_manager.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'layouts/appframe/navigation.dart';
import 'layouts/common/search_item_dialog.dart';
import 'layouts/common/search_lenditem_dialog.dart';
import 'layouts/common/search_purchase_dialog.dart';
import 'layouts/config/config.dart';
import 'layouts/config/menu_config.dart';
import 'layouts/config/notice.dart';
import 'layouts/config/system_config.dart';
import 'layouts/login/login.dart';
import 'layouts/login/privacy_policy.dart';
import 'layouts/menu/location/vendor_location.dart';
import 'layouts/menu/management/analysis_graph.dart';
import 'layouts/menu/management/customer_contribute.dart';
import 'layouts/menu/management/sales_daily.dart';
import 'layouts/menu/management/sales_daily_division.dart';
import 'layouts/menu/sales/balance_rental_report.dart';
import 'layouts/menu/sales/balance_report.dart';
import 'layouts/menu/sales/customer_info.dart';
import 'layouts/menu/sales/customer_report_monthly.dart';
import 'layouts/menu/sales/sales_ledger.dart';
import 'layouts/menu/sales/salesperson_report.dart';

void main() async {
  // init Hive
  await Hive.initFlutter();
  // Hive Adapter Regist
  RegisterAdapter();
  await Hive.openBox(LOCAL_DB);
  // init Theme Setting
  Get.changeThemeMode(Hive.box(LOCAL_DB).get(KEY_THEME_MODE, defaultValue: false) ? ThemeMode.dark : ThemeMode.light);

  runApp(Misx());
}

class Misx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // in emulator hide 'debug'
      translations: LanguageManager(),
      // multi language
      locale: Get.deviceLocale,
      fallbackLocale: Locale('ko', 'KR'),
      // default locale set
      initialBinding: InitBinding(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      // Route manage
      getPages: [
        // Layout
        GetPage(name: ROUTE_LOGIN, page: () => Login()), // Login
        GetPage(name: ROUTE_NATIGATION, page: () => Navigation()), // Main
        GetPage(name: ROUTE_POLICY, page: () => PrivacyPolicy()), // Policy
        GetPage(name: ROUTE_CONFIG, page: () => Config()), // Config
        GetPage(name: ROUTE_SYSTEM_CONFIG, page: () => SystemConfig()), // Config - SystemConfig
        GetPage(name: ROUTE_MENU_CONFIG, page: () => MenuConfig()), // Config - MenuConfig
        GetPage(name: ROUTE_NOTICE, page: () => Notice()), // Notice - MenuConfig

        // Dialog
        GetPage(name: ROUTE_DIALOG_CUSTOMER, page: () => SearchCustomerDialog()), // Search Customer Dialog
        GetPage(name: ROUTE_DIALOG_PURCHASE, page: () => SearchPurchaseDialog()), // Search Purchase Dialog
        GetPage(name: ROUTE_DIALOG_ITEM, page: () => SearchItemDialog()), // Search item Dialog
        GetPage(name: ROUTE_DIALOG_LENDITM, page: () => SearchLendItemDialog()), // Search lendItem Dialog

        // 경영분석
        GetPage(name: ROUTE_MENU_OVERALL_STATUS, page: () => OverallStatus()), // 종합현황
        GetPage(name: ROUTE_MENU_SALES_DAILY, page: () => SalesDaily()), // 영업일보
        GetPage(name: ROUTE_MENU_SALESPERSON_CONTRIBUTE, page: () => SalesPersonContribute()), // 영업사원별 기여현황
        GetPage(name: ROUTE_MENU_CONTRIBUTION_STATUS_CUSTOMER, page: () => CustomerContribute()), // 매출처별 기여현황
        GetPage(name: ROUTE_MENU_CLASSSTATUS, page: () => SalesClassStatus()), // 판매분류별 현황
        GetPage(name: ROUTE_MENU_RANKSTATUS, page: () => SalesRank()), // 매출순위현황
        GetPage(name: ROUTE_MENU_GRAPH, page: () => AnalysisGraph()), // 분석 그래프
        GetPage(name: ROUTE_MENU_DIVISIONSTATUS, page: () => SalesDailyDivision()), // 영업일보-용도별

        // 영업분석
        GetPage(name: ROUTE_MENU_CUSTOMER_INFO, page: () => CustomerInfo()), // 거래처 현황
        GetPage(name: ROUTE_MENU_SALESPERSON_REPORT, page: () => SalesPersonReport()), // 영업사원별 매출현황
        GetPage(name: ROUTE_MENU_SALESPERSON_REPORT_MONTHLY, page: () => SalesPersonReportMonthly()), // 영업사원별 월별 매출현황
        GetPage(name: ROUTE_MENU_CUSTOMER_REPORT, page: () => CustomerReport()), // 매출현황
        GetPage(name: ROUTE_MENU_CUSTOMER_REPORT_MONTHLY, page: () => CustomerReportMonthly()), // 월별 매출현황
        GetPage(name: ROUTE_MENU_SALES_LEDGER, page: () => SalesLedger()), // 매출원장
        GetPage(name: ROUTE_MENU_ACHIEVEMENT, page: () => Achievement()), // 목표대비 실적현황
        GetPage(name: ROUTE_MENU_BALANCE_REPORT, page: () => BanlanceReport()), // 채권현황
        GetPage(name: ROUTE_MENU_BALANCE_RENTAL_REPORT, page: () => BanlanceRentalReport()), // 채권 및 대여 현황
        // GetPage(name: , page: () =>), // 매출 및 대여 원장

        // 매입분석
        GetPage(name: ROUTE_MENU_PURCHASE_REPORT, page: () => PurchaseReport()), // 매입현황
        // GetPage(name: , page: () =>), // 매입원장

        // 지원현황
        // GetPage(name: , page: () =>), // 대여금 현황
        // GetPage(name: , page: () =>), // 대여자산 현황
        // GetPage(name: , page: () =>), // 대여자산 현황(이력)

        // 위치조회
        GetPage(name: ROUTE_MENU_VENDORLOCATION, page: () => VendorLocation()), // 매출처 위치조회

        // 재고분석
        // GetPage(name: , page: () =>), // 재고현황
        // GetPage(name: , page: () =>), // 재고수불현황
        // GetPage(name: , page: () =>), // 용공수불(창고)
        // GetPage(name: , page: () =>), // 용공수불현황(거래처)
        // GetPage(name: , page: () =>), // 용공수불현황(영업담당)
      ],
      home: Login(),
    );
  }
}

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
  }
}
