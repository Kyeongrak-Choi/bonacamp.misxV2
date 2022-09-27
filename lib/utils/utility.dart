import 'dart:async' show Future;

import 'package:dialogs/dialogs.dart';
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
    backgroundColor: Color(COMMON_COLOR),
    colorText: Color(DARK_COLOR),
  );
}

// Dialog
void ShowDialog(type, title, content, context) {
  if (type == DIALOG_TYPE_SELECT) {
    // Choice Dialog
    ChoiceDialog choiceDialog = ChoiceDialog(
      dialogBackgroundColor: Color(COMMON_COLOR),
      title: title,
      titleColor: Color(DARK_COLOR),
      message: content,
      messageColor: Color(DARK_COLOR),
      buttonOkText: '',
      buttonOkColor: Color(DARK_COLOR),
      buttonCancelText: '',
      buttonCancelBorderColor: Colors.red,
      buttonOkOnPressed: () => Get.offAllNamed('/login'),
      dialogRadius: 15.0,
      buttonRadius: 18.0,
      iconButtonOk: Icon(
        Icons.check,
        color: Color(DARK_COLOR),
      ),
      iconButtonCancel: Icon(
        Icons.cancel,
        color: Colors.red,
      ),
    );
    choiceDialog.show(context, barrierColor: Colors.white);
  } else if (type == DIALOG_TYPE_MSG) {
    // Message Dialog
    MessageDialog messageDialog = MessageDialog(
        dialogBackgroundColor: Color(COMMON_COLOR),
        buttonOkColor: Colors.red,
        title: title,
        titleColor: Color(DARK_COLOR),
        message: content,
        messageColor: Color(DARK_COLOR),
        buttonOkText: 'confirm'.tr,
        dialogRadius: 15.0,
        buttonRadius: 18.0,
        iconButtonOk: Icon(Icons.one_k));
    messageDialog.show(context, barrierColor: Colors.white);
  }
}

// Progress Bar
void ShowProgress(context) {
  ProgressDialog progressDialog = ProgressDialog(
    context: context,
    backgroundColor: Color(COMMON_COLOR),
    textColor: Color(DARK_COLOR),
    loadingText: 'loading'.tr,
  );
  progressDialog.show();
  Future.delayed(Duration(seconds: 3))
      .then((value) => progressDialog.dismiss());
}

String convertBusinessNo(String businessNo) {
  return '${businessNo.substring(0,3)}-${businessNo.substring(3,5)}-${businessNo.substring(5,10)}';
}