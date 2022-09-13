import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:renew_misx/theme.dart';
import '../../../constants.dart';

class OptionPeriodPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PeriodPickerController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                // primary: Colors.blueAccent,
                // onPrimary: Colors.white,
                ),
            onPressed: () {},
            child: Text(
              'period'.tr,
              style: textTheme().headline3,
            ),
          ), // 매출
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: Obx(
            () => TextButton(
              onPressed: () =>
                  Get.find<PeriodPickerController>().chooseFromDate(),
              child: Text(
                DateFormat('yyyy-MM-dd')
                    .format(Get.find<PeriodPickerController>().fromDate.value)
                    .toString(),
                style: textTheme().headline3,
              ),
            ),
          ), // 매출
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: Text(
            '~',
            style: textTheme().headline3,
          ), // 매출
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: Obx(
            () => TextButton(
              onPressed: () =>
                  Get.find<PeriodPickerController>().chooseToDate(),
              child: Text(
                  DateFormat('yyyy-MM-dd')
                      .format(Get.find<PeriodPickerController>().toDate.value)
                      .toString(),
                  style: textTheme().headline3),
            ),
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
    pickedFromDate = fromDate.value;
    pickedToDate = toDate.value;
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

    if (pickedToDate != null && pickedToDate != toDate.value) {
      if (Validate()) {
        toDate.value = pickedToDate;
      }
    }
  }

  // 기간 Validation
  bool Validate() {
    if (pickedFromDate.compareTo(pickedToDate) > 0) {
      Get.snackbar(
        'period_error_header'.tr,
        'period_error_content'.tr,
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
