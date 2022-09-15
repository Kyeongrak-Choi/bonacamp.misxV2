import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:renew_misx/assets/translations/strings.dart';
import 'package:renew_misx/theme.dart';
import 'package:renew_misx/utils/binding.dart';
import 'layouts/login/login.dart';

void main() {
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
      theme: theme(),
      //darkTheme: ThemeData.light().copyWith(primaryColor: Colors.white),
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
