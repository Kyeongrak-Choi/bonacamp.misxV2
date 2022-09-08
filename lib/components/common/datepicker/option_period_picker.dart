import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'dart:developer';

import 'package:renew_misx/constants.dart';

class OptionPeriodPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PeriodPickerController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => TextButton(
            onPressed: () =>
                Get.find<PeriodPickerController>().chooseFromDate(),
            child: Text(
              DateFormat('yyyy-MM-dd')
                  .format(Get.find<PeriodPickerController>().fromDate.value)
                  .toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Obx(
          () => TextButton(
            onPressed: () => Get.find<PeriodPickerController>().chooseToDate(),
            child: Text(
                DateFormat('yyyy-MM-dd')
                    .format(Get.find<PeriodPickerController>().toDate.value)
                    .toString(),
                style: TextStyle(fontSize: 20)),
          ),
        ),
      ],
    );
  }
}

class PeriodPickerController extends GetxController {
  var fromDate = DateTime.now().obs;
  var toDate = DateTime.now().obs;
  var pickedFromDate;
  var pickedToDate;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  chooseFromDate() async {
    // pickedFromDate = await showDatePicker(
    //   context: Get.context!,
    //   initialDate: fromDate.value,
    //   firstDate: DateTime(DateTime.now().year - 3),
    //   lastDate: DateTime(DateTime.now().year + 3),
    //   //initialEntryMode: DatePickerEntryMode.input,
    //   cancelText: 'cancel'.tr,
    //   helpText: '',
    //   builder: (context, child) {
    //     return Theme(
    //       data: Theme.of(context).copyWith(
    //         colorScheme: ColorScheme.dark(
    //           primary: Color(AppColor), // header background color
    //           onPrimary: Colors.black, // header text color
    //           onSurface: Colors.green, // body text color
    //           background: Color(AppColor),
    //           onBackground: Color(AppColor),
    //
    //         ),
    //         textButtonTheme: TextButtonThemeData(
    //           style: TextButton.styleFrom(
    //             primary: Color(AppColor), // button text color
    //           ),
    //         ),
    //       ),
    //       child: child!,
    //     );
    //   },
    // );

    pickedFromDate = await showOmniDateTimePicker(
      context: Get.context!,
      primaryColor: Colors.cyan,
      backgroundColor: Colors.grey[900],
      calendarTextColor: Colors.white,
      tabTextColor: Colors.white,
      unselectedTabBackgroundColor: Colors.grey[700],
      buttonTextColor: Colors.white,
      timeSpinnerTextStyle:
          const TextStyle(color: Colors.white70, fontSize: 18),
      timeSpinnerHighlightedTextStyle:
          const TextStyle(color: Colors.white, fontSize: 24),
      is24HourMode: false,
      isShowSeconds: false,
      startInitialDate: DateTime.now(),
      startFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      startLastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      borderRadius: const Radius.circular(16),
    );

    if (pickedFromDate != null && pickedFromDate != fromDate.value) {
      if (Validate()) {
        fromDate.value = pickedFromDate;
      }
    }
  }

  chooseToDate() async {
    pickedToDate = await showDatePicker(
      context: Get.context!,
      initialDate: toDate.value,
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year),
      //initialEntryMode: DatePickerEntryMode.input,
      cancelText: 'cancel'.tr,
    );

    if (pickedToDate != null && pickedToDate != toDate.value) {
      if (Validate()) {
        toDate.value = pickedToDate;
      }
    }
  }

  // 기간 Validation
  bool Validate() {
    log(pickedFromDate.compareTo(pickedToDate).toString());

    if (pickedFromDate.compareTo(pickedToDate) >= 0) {
      Get.snackbar(
        '일자오류',
        '일자를 확인해주세요',
        snackPosition: SnackPosition.TOP,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
      return false;
    } else {
      return true;
    }
  }
}
