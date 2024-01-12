import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

import '../../utils/constants.dart';

class PolicyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.toNamed(ROUTE_POLICY),
      child: Text(
        'privacy_policy'.tr,
        //style: TextStyle(decoration: TextDecoration.underline,fontSize: 14.sp),
        style: context.textTheme.bodyLarge?.copyWith(
            decoration: TextDecoration.underline, color: CommonColors.primary),
      ),
    );
  }
}
