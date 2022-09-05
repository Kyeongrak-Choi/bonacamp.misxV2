import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renew_misx/assets/translations/strings.dart';
import 'constants.dart';
import 'layouts/dashboard.dart';
import 'layouts/login.dart';

void main() {
  runApp(Misx());
}

class Misx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Strings(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('ko', 'KR'), // default locale set
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(AppColor),
            systemOverlayStyle: Get.isDarkMode
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
          ),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.white),
      home: Login(),
      initialBinding: InitBinding(),
    );
  }
}

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
  }
}
