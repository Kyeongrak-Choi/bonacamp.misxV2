import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

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
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: date.value,
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 1),
      //initialEntryMode: DatePickerEntryMode.input,
      cancelText: 'cancel'.tr,
      helpText: '',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(AppColor), // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Color(AppColor), // body text color
              background: Color(AppColor),
              onBackground: Color(AppColor),
            ),
            textTheme: TextTheme(),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != date.value) {
      date.value = pickedDate;
    }
  }
}
