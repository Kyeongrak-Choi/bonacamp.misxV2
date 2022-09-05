import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import '../components/common/dialog_search/search_dialog.dart';
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
                onPressed: () => Get.to(SearchDialog('C')),
                child: Text('title_search_customer'.tr)),
            ElevatedButton(onPressed: () => Get.to(SearchDialog('P')),
                child: Text('title_search_product'.tr)),
            ElevatedButton(onPressed: null, child: Text('combo box')),
            ElevatedButton(onPressed: null, child: Text('date picker')),
            ElevatedButton(onPressed: null, child: Text('month picker')),
          ],
        ),
      ),
    );
  }
}
