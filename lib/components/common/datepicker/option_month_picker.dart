import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'dart:developer';

class OptionMonthPicker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(MonthPickerController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => TextButton(
            onPressed: () => Get.find<MonthPickerController>().chooseDate(),
            child: Text(
              DateFormat('yyyy-MM-dd')
                  .format(Get.find<MonthPickerController>().date.value)
                  .toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class MonthPickerController extends GetxController {
  var date = DateTime.now().obs;

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

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: date.value,
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 3),
      //initialEntryMode: DatePickerEntryMode.input,
      cancelText: 'cancel'.tr,
    );

    if (pickedDate != null && pickedDate != date.value) {
      date.value = pickedDate;
    }
  }
}
