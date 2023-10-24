import 'package:dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

import '../components/common/field/icon_title_field.dart';
import '../models/system/userinfo.dart';
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
        buttonOkColor: CommonColors.dark,
        title: title,
        titleColor: CommonColors.dark,
        message: content,
        messageColor: CommonColors.dark,
        buttonOkText: 'confirm'.tr,
        dialogRadius: 15.0,
        buttonRadius: 18.0,
        iconButtonOk: Icon(Icons.one_k));
    messageDialog.show(context, barrierColor: CommonColors.bluesky);
  } else if (type == DIALOG_TYPE.NOTICE) {
    MessageDialog messageDialog = MessageDialog(
        dialogBackgroundColor: CommonColors.bluesky,
        buttonOkColor: CommonColors.dark,
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


void ShowAchievementDetailDialog(var detailList) {
  Get.defaultDialog(
      title:  "목표대비 실적현황 상세보기",
      content: Column(
        children: [
          IconTitleField(
            titleName: '구분',
            value: changeStringYYYYMMToDateFormat(detailList.month ?? ''),
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매출목표',
            value: detailList.salesGoal ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매출실적',
            value: detailList.salesAmount ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '달성률(%)',
            value: detailList.salesRate.toString(),
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '채권목표',
            value: detailList.balanceGoal ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '전월채권',
            value: detailList.lastBalance ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '전월증감',
            value: detailList.variationBalance ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '채권증감',
            value: detailList.changeBalance ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '달성률(%)',
            value: detailList.balanceRate.toString(),
            iconData: Icons.label_outlined,
          ),
        ],
      )

void ShowLedgerDetailDialog(var detailList) {
  Get.defaultDialog(
      title:  "매출 상세보기",
      content: Column(
          children: [
            IconTitleField(
              titleName: '품목',
              value: detailList.itemName ?? '',
              iconData: Icons.label_outlined,
            ),
            IconTitleField(
              titleName: '매출유형',
              value: detailList.salesTypeName ?? '',
              iconData: Icons.label_outlined,
            ),
            IconTitleField(
              titleName: 'BOX / EA',
              value: detailList.boxQuantity.toString() + ' / ' + detailList.bottleQuantity.toString(),
              iconData: Icons.label_outlined,
            ),
            IconTitleField(
              titleName: '매출액',
              value: numberFormat.format(detailList.total),
              iconData: Icons.label_outlined,
            ),
            IconTitleField(
              titleName: '공급가',
              value: numberFormat.format(detailList.price),
              iconData: Icons.label_outlined,
            ),
            IconTitleField(
              titleName: '공급가 + 부가세',
              value: numberFormat.format(detailList.amount),
              iconData: Icons.label_outlined,
            ),
            IconTitleField(
              titleName: '보증금',
              value: numberFormat.format(detailList.guarantee),
              iconData: Icons.label_outlined,
            ),
            IconTitleField(
              titleName: '채권잔액',
              value: numberFormat.format(detailList.balance),
              iconData: Icons.label_outlined,
            ),
          ],
        )
  );
}

void ShowUserInfoDialog() {
  UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO);
  Get.defaultDialog(
    title: '사용자 정보',
    content: Column(children: [
      IconTitleField(
        titleName: '사용자',
        value: user.getUserName,
        iconData: Icons.person,
      ),
      IconTitleField(
        titleName: '아이디',
        value: user.getUserId,
        iconData: Icons.label_outlined,
      ),
      IconTitleField(
        titleName: '회사명',
        value: user.getClientName,
        iconData: Icons.label_outlined,
      ),
      IconTitleField(
        titleName: '사업자등록번호',
        value: convertBusinessNo(user.getBusinessNo),
        iconData: Icons.label_outlined,
      ),
    ]),
    confirmTextColor: Colors.white,
  );
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
  DateTime LastDayOfMonth = DateTime(currentDate.year, currentDate.month + 1, 0);
  DateFormat formatter = DateFormat('yyyyMMdd');

  return formatter.format(LastDayOfMonth);
}

// 선택월 마지막날
String setLastDay(date) {
  DateTime LastDayOfMonth = DateTime(date.year, date.month + 1, 0);
  DateFormat formatter = DateFormat('yyyyMMdd');

  return formatter.format(LastDayOfMonth);
}

// 월차이 계산
int calculateMonthDifference(DateTime startDate, DateTime endDate) {
  int startYear = startDate.year;
  int startMonth = startDate.month;
  int endYear = endDate.year;
  int endMonth = endDate.month;

  // 시작 날짜와 종료 날짜 간의 연도와 월 차이 계산
  int yearDifference = endYear - startYear;
  int monthDifference = endMonth - startMonth;

  // 월 차이가 음수인 경우, 연도 차이를 감소시키고 월 차이를 보정
  if (monthDifference < 0) {
    yearDifference--;
    monthDifference += 12;
  }

  return yearDifference * 12 + monthDifference; // 총 월 차이
}

// 숫자 포맷
var numberFormat = NumberFormat('###,###,###,###');


String changeStringYYYYMMToDateFormat(String dateString) {
  if(dateString == ''){
    return '';
  }
  DateTime tmpDate = DateTime.parse(dateString + '01');
  //ex 20220708
  return DateFormat('yyyy-MM').format(tmpDate).toString();
}

String changeStringToDateFormat(String dateString) {
  if(dateString == ''){
    return '';
  }

  DateTime tmpDate = DateTime.parse(dateString);
  //ex 20220708
  return DateFormat('yyyy-MM-dd').format(tmpDate).toString();
}