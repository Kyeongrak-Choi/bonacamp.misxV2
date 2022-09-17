import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../layouts/login/privacy_policy.dart';

class PolicyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.to(PrivacyPolicy()),
      child: Text('privacy_policy'.tr),
    );
  }
}
