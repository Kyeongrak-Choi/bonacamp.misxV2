import 'dart:async' show Future;

import 'package:dialogs/dialogs.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart' show Brightness, rootBundle;
import 'package:get/get.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

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
    case SNACK_TYPE_INFO:
      header = 'snack_information'.tr;
      break;
    case SNACK_TYPE_ERROR:
      header = 'snack_error'.tr;
      break;
    case SNACK_TYPE_ALARM:
      header = 'snack_alram'.tr;
      break;
  }
  Get.snackbar(
    header,
    content,
    snackPosition: SnackPosition.TOP,
    forwardAnimationCurve: Curves.elasticInOut,
    reverseAnimationCurve: Curves.easeOut,
    backgroundColor: CommonColors.common_bluesky,
    colorText: CommonColors.common_dark,
  );
}

// Dialog
void ShowDialog(type, title, content, context) {
  if (type == DIALOG_TYPE_SELECT) {
    // Choice Dialog
    ChoiceDialog choiceDialog = ChoiceDialog(
      dialogBackgroundColor: CommonColors.common_bluesky,
      title: title,
      titleColor: CommonColors.common_dark,
      message: content,
      messageColor: CommonColors.common_dark,
      buttonOkText: '',
      buttonOkColor: CommonColors.common_dark,
      buttonCancelText: '',
      buttonCancelBorderColor: CommonColors.common_bluesky,
      buttonOkOnPressed: () => Get.offAllNamed(ROUTE_LOGIN),
      dialogRadius: 15.0,
      buttonRadius: 18.0,
      iconButtonOk: Icon(
        Icons.check,
        color: CommonColors.common_dark,
      ),
      iconButtonCancel: Icon(
        Icons.cancel,
        color: CommonColors.red,
      ),
    );
    choiceDialog.show(context, barrierColor: CommonColors.common_bluesky);
  } else if (type == DIALOG_TYPE_MSG) {
    // Message Dialog
    MessageDialog messageDialog = MessageDialog(
        dialogBackgroundColor: CommonColors.common_bluesky,
        buttonOkColor: CommonColors.red,
        title: title,
        titleColor: CommonColors.common_dark,
        message: content,
        messageColor: CommonColors.common_dark,
        buttonOkText: 'confirm'.tr,
        dialogRadius: 15.0,
        buttonRadius: 18.0,
        iconButtonOk: Icon(Icons.one_k));
    messageDialog.show(context, barrierColor: CommonColors.common_bluesky);
  }
}

// Progress Bar
void ShowProgress(context) {
  ProgressDialog progressDialog = ProgressDialog(
    context: context,
    backgroundColor: CommonColors.common_bluesky,
    textColor: CommonColors.common_dark,
    loadingText: 'loading'.tr,
  );
  progressDialog.show();
  Future.delayed(Duration(seconds: 3))
      .then((value) => progressDialog.dismiss());
}

String convertBusinessNo(String businessNo) {
  return '${businessNo.substring(0, 3)}-${businessNo.substring(3, 5)}-${businessNo.substring(5, 10)}';
}
