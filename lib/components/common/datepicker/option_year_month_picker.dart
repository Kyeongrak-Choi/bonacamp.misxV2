import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../../../utils/constants.dart';
import '../../../utils/theme/text_theme.dart';

class OptionYearMonthPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MonthPickerController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'opt_month'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            border: Border.all(color: context.theme.colorScheme.background),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => TextButton(
                  onPressed: () =>
                      Get.find<MonthPickerController>().chooseYearMonth(),
                  child: Text(
                    DateFormat('yyyy-MM')
                        .format(Get.find<MonthPickerController>()
                            .yearMonth
                            .value)
                        .toString(),
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Get.find<MonthPickerController>().chooseYearMonth();
                  },
                  icon: Icon(Icons.date_range,
                  )),
            ],
          ),
        )
      ],
    );
  }
}

class MonthPickerController extends GetxController {
  var yearMonth = DateTime.now().obs;

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

  chooseYearMonth() async {
    String? locale;
    final localeObj = locale != null ? Locale(locale) : null;

    DateTime? pickedDate = await showMonthYearPicker(
      context: Get.context!,
      initialDate: yearMonth.value,
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 1),
      //initialEntryMode: DatePickerEntryMode.input,
      locale: localeObj,
    );

    if (pickedDate != null && pickedDate != yearMonth.value) {
      yearMonth.value = pickedDate;
    }
  }
}
