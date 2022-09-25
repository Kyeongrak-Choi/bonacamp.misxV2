import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'constants.dart';

void ShowSnackBar(type, content) {
  var header;

  switch (type) {
    case 'i' :
      header = 'snack_information'.tr;
      break;
    case 'e' :
      header = 'snack_error'.tr;
      break;
    case 'a' :
      header = 'snack_alram'.tr;
      break;
  }
  Get.snackbar(
    header,
    content,
    snackPosition: SnackPosition.TOP,
    forwardAnimationCurve: Curves.elasticInOut,
    reverseAnimationCurve: Curves.easeOut,
    backgroundColor: Colors.white,
    colorText: Color(AppColor),
  );
}
