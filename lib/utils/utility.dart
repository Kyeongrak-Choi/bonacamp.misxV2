import 'dart:async' show Future;

import 'package:dialogs/dialogs.dart';
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
    case SNACK_TYPE.INFO:
      header = 'snack_information'.tr;
      break;
    case SNACK_TYPE.ERROR:
      header = 'snack_error'.tr;
      break;
    case SNACK_TYPE.ALARM:
      header = 'snack_alram'.tr;
      break;
  }
  Get.snackbar(
    header,
    content,
    snackPosition: SnackPosition.TOP,
    forwardAnimationCurve: Curves.elasticInOut,
    reverseAnimationCurve: Curves.easeOut,
    backgroundColor: CommonColors.bluesky,
    colorText: CommonColors.dark,
  );
}

// Dialog
void ShowDialog(type, title, content, context) {
  if (type == DIALOG_TYPE.SELECT) {
    // Choice Dialog
    ChoiceDialog choiceDialog = ChoiceDialog(
      dialogBackgroundColor: CommonColors.bluesky,
      title: title,
      titleColor: CommonColors.dark,
      message: content,
      messageColor: CommonColors.dark,
      buttonOkText: '',
      buttonOkColor: CommonColors.dark,
      buttonCancelText: '',
      buttonCancelBorderColor: CommonColors.bluesky,
      buttonOkOnPressed: () => Get.offAllNamed(ROUTE_LOGIN),
      dialogRadius: 15.0,
      buttonRadius: 18.0,
      iconButtonOk: Icon(
        Icons.check,
        color: CommonColors.dark,
      ),
      iconButtonCancel: Icon(
        Icons.cancel,
        color: CommonColors.red,
      ),
    );
    choiceDialog.show(context, barrierColor: CommonColors.bluesky);
  } else if (type == DIALOG_TYPE.MSG) {
    // Message Dialog
    MessageDialog messageDialog = MessageDialog(
        dialogBackgroundColor: CommonColors.bluesky,
        buttonOkColor: CommonColors.red,
        title: title,
        titleColor: CommonColors.dark,
        message: content,
        messageColor: CommonColors.dark,
        buttonOkText: 'confirm'.tr,
        dialogRadius: 15.0,
        buttonRadius: 18.0,
        iconButtonOk: Icon(Icons.one_k));
    messageDialog.show(context, barrierColor: CommonColors.bluesky);
  }
}

// Progress Bar
void ShowProgress(context) {
  ProgressDialog progressDialog = ProgressDialog(
    context: context,
    backgroundColor: CommonColors.bluesky,
    textColor: CommonColors.dark,
    loadingText: 'loading'.tr,
  );
  progressDialog.show();
  //Future.delayed(Duration(seconds: 3)).then((value) => progressDialog.dismiss());
}

void HideProgess(context) {
  ProgressDialog progressDialog = ProgressDialog(
    context: context,
    backgroundColor: CommonColors.bluesky,
    textColor: CommonColors.dark,
    loadingText: 'loading'.tr,
  );
  progressDialog.dismiss();
}

String convertBusinessNo(String businessNo) {
  return '${businessNo.substring(0, 3)}-${businessNo.substring(3, 5)}-${businessNo.substring(5, 10)}';
}
