import 'package:dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

import 'constants.dart';

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
void ShowProgress(context, dynamic, bool) {
  ProgressDialog progressDialog = ProgressDialog(
    context: context,
    backgroundColor: CommonColors.bluesky,
    textColor: CommonColors.dark,
    loadingText: dynamic,
  );
  if (bool) {
    progressDialog.show();
  } else {
    progressDialog.dismiss();
  }
}

String convertBusinessNo(String businessNo) {
  return '${businessNo.substring(0, 3)}-${businessNo.substring(3, 5)}-${businessNo.substring(5, 10)}';
}

// 당월 1일
String getFirstDay() {
  DateTime currentDate = DateTime.now();
  DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
  DateFormat formatter = DateFormat('yyyyMMdd');

  return formatter.format(firstDayOfMonth);
}

// 선택월 1일
String setFirstDay(date) {
  DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
  DateFormat formatter = DateFormat('yyyyMMdd');

  return formatter.format(firstDayOfMonth);
}

// 오늘
String getToday() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyyMMdd');
  return formatter.format(now);
}

// 당월 마지막날
String getLastDay() {
  DateTime currentDate = DateTime.now();
  DateTime LastDayOfMonth = DateTime(currentDate.year, currentDate.month+1, 0);
  DateFormat formatter = DateFormat('yyyyMMdd');

  return formatter.format(LastDayOfMonth);
}

// 선택월 마지막날
String setLastDay(date) {
  DateTime LastDayOfMonth = DateTime(date.year, date.month+1, 0);
  DateFormat formatter = DateFormat('yyyyMMdd');

  return formatter.format(LastDayOfMonth);
}