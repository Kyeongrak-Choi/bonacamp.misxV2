import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renew_misx/constants.dart';
import 'package:renew_misx/layouts/login/privacy_policy.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../layouts/navigation.dart';

class PolicyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Get.to(PrivacyPolicy()),
        child: Text('privacy_policy'.tr),
        // style: ElevatedButton.styleFrom(
        //   foregroundColor: Colors.white,
        //   backgroundColor: Color(AppColor),
        // ) // foreground  ,
        );
  }
}
