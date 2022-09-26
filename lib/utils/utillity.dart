import 'dart:async' show Future;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart' show Brightness, rootBundle;
import 'package:get/get.dart';

import 'constants.dart';

Future<String> jsonDummy(String path) async {
  return rootBundle.loadString(path);
}

// System Theme Mode Check
bool GetSystemMode() {
  if (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) {
    return true;
  } else {
    return false;
  }
}

// Snack Bar
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