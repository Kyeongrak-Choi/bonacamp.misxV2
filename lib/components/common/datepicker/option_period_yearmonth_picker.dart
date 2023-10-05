import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../../../utils/constants.dart';
import '../../../utils/utility.dart';

class OptionPeriodYearmonthPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PeriodYearmonthPickerController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
              child: Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.canvasColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    'opt_period'.tr,
                    style: context.textTheme.displayMedium,
                  ),
                ),
              ),
            )),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                  () => TextButton(
                    onPressed: () => Get.find<PeriodYearmonthPickerController>().chooseFromYearmonth(),
                    child: Text(
                      DateFormat('yyyy-MM').format(Get.find<PeriodYearmonthPickerController>().fromYearMonth.value).toString(),
                      style: context.textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Text(
                  '~',
                  style: context.textTheme.displayMedium,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                  () => TextButton(
                    onPressed: () => Get.find<PeriodYearmonthPickerController>().chooseToYearmonth(),
                    child: Text(DateFormat('yyyy-MM').format(Get.find<PeriodYearmonthPickerController>().toYearMonth.value).toString(),
                        style: context.textTheme.displayMedium),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PeriodYearmonthPickerController extends GetxController {
  var fromYearMonth = DateTime.now().obs;
  var toYearMonth = DateTime.now().obs;
  var pickedFromYearMonth;
  var pickedToYearMonth;

  @override
  void onInit() {
    super.onInit();
    pickedFromYearMonth = fromYearMonth.value;
    pickedToYearMonth = toYearMonth.value;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  chooseFromYearmonth() async {
    String? locale;
    final localeObj = locale != null ? Locale(locale) : null;

    pickedFromYearMonth = await showMonthYearPicker(
      context: Get.context!,
      initialDate: fromYearMonth.value,
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 1),
      //initialEntryMode: DatePickerEntryMode.input,
      locale: localeObj,
    );

    if (pickedFromYearMonth != null && pickedFromYearMonth != fromYearMonth.value) {
      if (Validate()) {
        fromYearMonth.value = pickedFromYearMonth;
      }
    }
  }

  chooseToYearmonth() async {
    String? locale;
    final localeObj = locale != null ? Locale(locale) : null;

    pickedToYearMonth = await showMonthYearPicker(
      context: Get.context!,
      initialDate: toYearMonth.value,
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 1),
      //initialEntryMode: DatePickerEntryMode.input,
      locale: localeObj,
    );

    if (pickedToYearMonth != null && pickedToYearMonth != toYearMonth.value) {
      if (Validate()) {
        toYearMonth.value = pickedToYearMonth;
      }
    }
  }

  // 기간 Validation check
  bool Validate() {
    if (pickedFromYearMonth.compareTo(pickedToYearMonth) > 0) {
      ShowSnackBar(SNACK_TYPE.ERROR, 'period_error_content'.tr);
      return false;
    } else if (calculateMonthDifference(pickedFromYearMonth, pickedToYearMonth) > 5) {
      ShowSnackBar(SNACK_TYPE.ERROR, 'period_error_limit'.tr);
      return false;
    } else {
      return true;
    }
  }
}
