import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:misxV2/assets/translations/strings.dart';
import 'package:misxV2/utils/theme/theme_manager.dart';
import 'package:misxV2/utils/utillity.dart';
import 'layouts/login/login.dart';
import 'layouts/navigation.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('OPTION');

  // init Theme Setting
  var optionBox = Hive.box('OPTION');
  Get.changeThemeMode(optionBox.get('isDark', defaultValue: GetSystemMode())
      ? ThemeMode.dark
      : ThemeMode.light);
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
  var optionBox = Hive.box('OPTION');
  var isDark;

  @override
  void onInit() {
    super.onInit();
    isDark = RxBool(optionBox.get('isDark', defaultValue: false));
  }

  Future<void> changeTheme(bool val) async {
    isDark = RxBool(val);
    await optionBox.put('isDark', val);
    Get.changeThemeMode(optionBox.get('isDark')
        ? ThemeMode.dark
        : ThemeMode.light);
  }
}
