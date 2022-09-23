import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:misxV2/layouts/example/api_example.dart';
import 'package:misxV2/layouts/example/menu_example.dart';
import '../common/dialog/search_dialog.dart';

class MyMenuList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('mymenu list'),
          ],
        ),
      ),
    );
  }
}
