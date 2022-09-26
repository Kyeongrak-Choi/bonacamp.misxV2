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
    case SnackTypeInfo:
      header = 'snack_information'.tr;
      break;
    case SnackTypeError:
      header = 'snack_error'.tr;
      break;
    case SnackTypeAlarm:
      header = 'snack_alram'.tr;
      break;
  }
  Get.snackbar(
    header,
    content,
    snackPosition: SnackPosition.TOP,
    forwardAnimationCurve: Curves.elasticInOut,
    reverseAnimationCurve: Curves.easeOut,
    backgroundColor: Color(CommonColor),
    colorText: Color(DarkColor),
  );
}

// Dialog
void ShowDialog(type, title, content, context) {
  if (type == DialogTypeChoice) {
    // Choice Dialog
    ChoiceDialog choiceDialog = ChoiceDialog(
      dialogBackgroundColor: Color(CommonColor),
      title: title,
      titleColor: Color(DarkColor),
      message: content,
      messageColor: Color(DarkColor),
      buttonOkText: '',
      buttonOkColor: Color(DarkColor),
      buttonCancelText: '',
      buttonCancelBorderColor: Colors.red,
      buttonOkOnPressed: () => Get.offAllNamed('/login'),
      dialogRadius: 15.0,
      buttonRadius: 18.0,
      iconButtonOk: Icon(Icons.check,color: Color(DarkColor),),
      iconButtonCancel: Icon(Icons.cancel,color: Colors.red,),
    );
    choiceDialog.show(context, barrierColor: Colors.white);

  } else if (type == DialogTypeMessage) {
    // Message Dialog
    MessageDialog messageDialog = MessageDialog(
        dialogBackgroundColor: Color(CommonColor),
        buttonOkColor: Colors.red,
        title: title,
        titleColor: Color(DarkColor),
        message: content,
        messageColor: Color(DarkColor),
        buttonOkText: 'confirm'.tr,
        dialogRadius: 15.0,
        buttonRadius: 18.0,
        iconButtonOk: Icon(Icons.one_k));
    messageDialog.show(context, barrierColor: Colors.white);
  }
}

// Progress Bar
void ShowProgress(context){
  ProgressDialog progressDialog = ProgressDialog(
    context: context,
    backgroundColor: Color(CommonColor),
    textColor: Color(DarkColor),
    loadingText: 'loading'.tr,
  );
  progressDialog.show();
  Future.delayed(Duration(seconds: 3)).then((value) => progressDialog.dismiss());
}