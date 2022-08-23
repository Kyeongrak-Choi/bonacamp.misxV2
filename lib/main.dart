import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renew_misx/assets/translations/strings.dart';

void main() {
  runApp(Misx());
}

class Misx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Strings(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('ko', 'KR'),
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.red),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Get.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        title: Text('App_name'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
