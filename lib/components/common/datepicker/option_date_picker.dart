import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class OptionDatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DatePickerController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => TextButton(
            onPressed: () => Get.find<DatePickerController>().chooseDate(),
            child: Text(
              DateFormat('yyyy-MM-dd')
                  .format(Get.find<DatePickerController>().date.value)
                  .toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class DatePickerController extends GetxController {
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

  }
}
