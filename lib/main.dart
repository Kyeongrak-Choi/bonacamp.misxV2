import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:misxV2/assets/translations/strings.dart';
import 'package:misxV2/layouts/common/dialog/search_dialog.dart';
import 'package:misxV2/layouts/example/api_example.dart';
import 'package:misxV2/layouts/example/menu_example.dart';
import 'package:misxV2/layouts/login/privacy_policy.dart';
import 'package:misxV2/utils/theme/theme_manager.dart';

import 'layouts/config/config.dart';
import 'layouts/config/menu_config.dart';
import 'layouts/config/system_config.dart';
import 'layouts/login/login.dart';
import 'layouts/navigation.dart';
import 'utils/hive_init.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('SYSTEM');

  // init local db set
  SystemBoxInit();

  // init Theme Setting
  var systemBox = Hive.box('SYSTEM');
  Get.changeThemeMode(
      systemBox.get('isDark') ? ThemeMode.dark : ThemeMode.light);

  runApp(Misx());
}

class Misx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // in emulator hide 'debug'
      translations: Strings(), // multi language
      locale: Get.deviceLocale,
      fallbackLocale: Locale('ko', 'KR'), // default locale set
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
      ],
      // Route manage
      getPages: [
        // Layout
        GetPage(name: '/navigation', page: () => Navigation()), // Main
        GetPage(name: '/policy', page: () => PrivacyPolicy()), // Policy
        GetPage(name: '/config', page: () => Config()), // Config
        GetPage(
            name: '/systemConfig',
            page: () => SystemConfig()), // Config - SystemConfig
        GetPage(
            name: '/menuConfig',
            page: () => MenuConfig()), // Config - MenuConfig

        // Dialog
        GetPage(
            name: '/searchCustomer',
            page: () => SearchDialog('C')), // Search Customer Dialog
        GetPage(
            name: '/searchProduct',
            page: () => SearchDialog('P')), // Search Product Dialog

        // example
        GetPage(name: '/menuExample', page: () => MenuExample()),
        GetPage(name: '/apiExample', page: () => ApiExample()),
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

class ThemeModeController extends GetxController {
  var isDark;

  @override
  void onInit() {
    super.onInit();
    isDark = RxBool(Hive.box('SYSTEM').get('isDark'));
  }

  Future<void> changeTheme(bool val) async {
    isDark = RxBool(val);
    await Hive.box('SYSTEM').put('isDark', val);
    Get.changeThemeMode(
        Hive.box('SYSTEM').get('isDark') ? ThemeMode.dark : ThemeMode.light);
  }
}
