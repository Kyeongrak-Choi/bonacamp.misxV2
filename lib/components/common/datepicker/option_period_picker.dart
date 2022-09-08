import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
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
            onPressed: () => Get.find<PeriodPickerController>().chooseFromDate(),
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
    pickedFromDate = await showDatePicker(
      context: Get.context!,
      initialDate: fromDate.value,
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 3),
      //initialEntryMode: DatePickerEntryMode.input,
      cancelText: 'cancel'.tr,
      helpText: null,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.yellow, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.green, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(AppColor), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedFromDate != null && pickedFromDate != fromDate.value) {
      if(Validate()) {
        fromDate.value = pickedFromDate;
      }
    }
  }

  chooseToDate() async {
    pickedToDate = await showDatePicker(
      context: Get.context!,
      initialDate: toDate.value,
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 3),
      //initialEntryMode: DatePickerEntryMode.input,
      cancelText: 'cancel'.tr,

    );

    if (pickedToDate != null && pickedToDate != toDate.value) {
      if(Validate()) {
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
    }else {
      return true;
    }
  }
}
