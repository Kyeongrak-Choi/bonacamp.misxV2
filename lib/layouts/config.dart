import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/constants.dart';

// 설정 화면
class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColor),
      appBar: AppBar(
        title: Text('config'.tr),
      ),
    );
  }
}
