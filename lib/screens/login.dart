import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import '../components/common/dialog_search/search_customer.dart';
import '../main.dart';

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
                onPressed: () => Get.to(SearchCustomer()),
                //onPressed: () => Get.to(Search_Customer_Sub()),
                child: Text('search customer')),
            ElevatedButton(onPressed: null, child: Text('search product')),
            ElevatedButton(onPressed: null, child: Text('combo box')),
            ElevatedButton(onPressed: null, child: Text('date picker')),
            ElevatedButton(onPressed: null, child: Text('month picker')),
          ],
        ),
      ),
    );
  }
}
