import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
