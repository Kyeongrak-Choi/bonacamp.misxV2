import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renew_misx/assets/translations/strings.dart';
import 'package:renew_misx/components/common/dialog_search_customer/search_customer_option.dart';

import 'components/common/dialog_search_customer/search_customer.dart';

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
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
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
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Get.to(Search_Customer()),
                //onPressed: () => Get.to(Search_Customer_Sub()),
                child: Text('search customer')),
            ElevatedButton(
                onPressed: null
                , child: Text('search product')),
            ElevatedButton(
                onPressed: null
                , child: Text('combo box')),
            ElevatedButton(
                onPressed: null
                , child: Text('date picker')),
            ElevatedButton(
                onPressed: null
                , child: Text('month picker')),

          ],
        ),
      ),
    );
  }
}
