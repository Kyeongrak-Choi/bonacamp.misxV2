import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/constants.dart';

class PolicyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.toNamed(ROUTE_POLICY),
      child: Text('privacy_policy'.tr),
    );
  }
}
