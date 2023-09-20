import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:misxV2/assets/translations/language_manager.dart';
import 'package:misxV2/layouts/common/dialog/search_dialog.dart';
import 'package:misxV2/layouts/example/menu_example.dart';
import 'package:misxV2/layouts/menu/management/overall_status.dart';
import 'package:misxV2/layouts/menu/management/salesperson_contribute.dart';
import 'package:misxV2/utils/constants.dart';
import 'package:misxV2/utils/database/hive_manager.dart';
import 'package:misxV2/utils/theme/theme_manager.dart';
import 'package:misxV2/utils/utility.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'layouts/config/config.dart';
import 'layouts/config/menu_config.dart';
import 'layouts/config/system_config.dart';
import 'layouts/login/login.dart';
import 'layouts/login/privacy_policy.dart';
import 'layouts/menu/management/customer_contribute.dart';
import 'layouts/menu/management/sales_daily.dart';
import 'layouts/navigation.dart';

void main() async {
  // init Hive
  await Hive.initFlutter();
  // Hive Adapter Regist
  RegisterAdapter();
  await Hive.openBox(LOCAL_DB);
  // init Theme Setting
  Get.changeThemeMode(Hive.box(LOCAL_DB).get(KEY_THEME_MODE, defaultValue: GetSystemMode()) ? ThemeMode.dark : ThemeMode.light);

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
        //GetPage(name: ROUTE_NOTICE, page: () => ), // Config
        GetPage(name: ROUTE_SYSTEM_CONFIG, page: () => SystemConfig()), // Config - SystemConfig
        GetPage(name: ROUTE_MENU_CONFIG, page: () => MenuConfig()), // Config - MenuConfig

        // Dialog
        GetPage(name: ROUTE_DIALOG_CUSTOMER, page: () => SearchDialog(SEARCH_DIALOG_CUST)), // Search Customer Dialog
        GetPage(name: ROUTE_DIALOG_PURCHASE, page: () => SearchDialog(SEARCH_DIALOG_PRCH)), // Search Purchase Dialog
        GetPage(name: ROUTE_DIALOG_ITEM, page: () => SearchDialog(SEARCH_DIALOG_ITEM)), // Search item Dialog
        GetPage(name: ROUTE_DIALOG_LENDITM, page: () => SearchDialog(SEARCH_DIALOG_LEND)), // Search lendItem Dialog

        // example
        GetPage(name: ROUTE_MENU_EXAMPLE, page: () => MenuExample()),

        // 경영분석
        GetPage(name: ROUTE_MENU_OVERALL_STATUS, page: () => OverallStatus()), // 종합현황
        GetPage(name: ROUTE_MENU_SALES_DAILY, page: () => SalesDaily()), // 종합현황
        GetPage(name: ROUTE_MENU_SALESPERSON_CONTRIBUTE, page: () => SalesPersonContribute()), // 영업사원별 기여현황
        GetPage(name: ROUTE_MENU_CUSTOMER_CONTRIBUTE, page: () => CustomerContribute()), // 매출처별 기여현황
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
