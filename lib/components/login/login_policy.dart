import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class PolicyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.toNamed(ROUTE_POLICY),
      child: Text(
        'privacy_policy'.tr,
        style: TextStyle(decoration: TextDecoration.underline,fontSize: 14.sp),
      ),
    );
  }
}
