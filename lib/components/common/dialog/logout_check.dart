import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:misxV2/layouts/login/login.dart';

void LogoutCheckDialog(BuildContext context) {
  Get.dialog(
    AlertDialog(
      backgroundColor: context.theme.backgroundColor,
      title: Text('logout'.tr),
      content: Text('logout_content'.tr),
      actions: [
        TextButton(
          child: Text('confirm'.tr),
          onPressed: () => Get.offAll(() => Login())
        ),
        TextButton(
          child: Text('cancel'.tr),
          onPressed: () => Get.back(),
        ),
      ],
    ),
  );
}