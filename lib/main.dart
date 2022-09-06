import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renew_misx/assets/translations/strings.dart';
import 'package:renew_misx/theme.dart';
import 'package:renew_misx/utils/binding.dart';
import 'constants.dart';
import 'layouts/navigation.dart';
import 'layouts/login/login.dart';

void main() {
  runApp(Misx());
}

class Misx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // in emulator hide 'debug'
      translations:
          Strings(), // multi language (lib/assets/tranlations/strings.dart)
      locale: Get.deviceLocale,
      fallbackLocale: Locale('ko', 'KR'), // default locale set
      initialBinding: InitBinding(),
      theme: theme(), // theme (lib/theme.dart)
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.white),
      home: Login(),
    );
  }
}
