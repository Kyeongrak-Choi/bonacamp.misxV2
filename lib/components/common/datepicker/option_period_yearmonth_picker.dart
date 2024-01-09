import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../../../utils/constants.dart';
import '../../../utils/utility.dart';

class OptionPeriodYearmonthPicker extends StatelessWidget {
  bool checkLimit = false;

  OptionPeriodYearmonthPicker(bool flag) {
    this.checkLimit = flag;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(PeriodYearmonthPickerController(checkLimit));
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'opt_period'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: context.theme.colorScheme.background),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.find<PeriodYearmonthPickerController>()
                              .chooseFromYearmonth();
                        },
                        icon: ImageIcon(
                          AssetImage('lib/assets/icons/calendar.png'),
                          size: 24.sp,
                        )),
                    Obx(
                      () => TextButton(
                        onPressed: () =>
                            Get.find<PeriodYearmonthPickerController>()
                                .chooseFromYearmonth(),
                        child: Text(
                          DateFormat('yyyy-MM')
                              .format(Get.find<PeriodYearmonthPickerController>()
                                  .fromYearMonth
                                  .value)
                              .toString(),
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0.h, BASIC_PADDING.w, 0.h),
              child: Text(
                ' - ',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: context.theme.colorScheme.background),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.find<PeriodYearmonthPickerController>()
                              .chooseToYearmonth();
                        },
                        icon: ImageIcon(
                          AssetImage('lib/assets/icons/calendar.png'),
                          size: 24.sp,
                        )),
                    Obx(
                          () => TextButton(
                        onPressed: () =>
                            Get.find<PeriodYearmonthPickerController>()
                                .chooseToYearmonth(),
                        child: Text(
                            DateFormat('yyyy-MM')
                                .format(
                                Get.find<PeriodYearmonthPickerController>()
                                    .toYearMonth
                                    .value)
                                .toString(),
                            style: context.textTheme.bodyMedium),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
  bool checkLimit = false;

  PeriodYearmonthPickerController(bool flag) {
    this.checkLimit = flag;
  }

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
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple, // 선택한 날짜 표시 색상 변경
            hintColor: Colors.purple, // 선택한 날짜 밑줄 색상 변경
            primaryTextTheme: TextTheme(
              titleMedium:
              TextStyle(fontSize: 20.0, color: Colors.black), // 글자 크기 조정
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedFromYearMonth != null &&
        pickedFromYearMonth != fromYearMonth.value) {
      if (checkLimit) {
        if (Validate()) {
          fromYearMonth.value = pickedFromYearMonth;
        }
      } else {
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
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple, // 선택한 날짜 표시 색상 변경
            hintColor: Colors.purple, // 선택한 날짜 밑줄 색상 변경
            primaryTextTheme: TextTheme(
              titleMedium:
              TextStyle(fontSize: 20.0, color: Colors.black), // 글자 크기 조정
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedToYearMonth != null && pickedToYearMonth != toYearMonth.value) {
      if (checkLimit) {
        if (Validate()) {
          toYearMonth.value = pickedToYearMonth;
        }
      } else {
        toYearMonth.value = pickedToYearMonth;
      }
    }
  }

  // 기간 Validation check
  bool Validate() {
    if (pickedFromYearMonth.compareTo(pickedToYearMonth) > 0) {
      ShowSnackBar(SNACK_TYPE.ERROR, 'period_error_content'.tr);
      return false;
    } else if (calculateMonthDifference(
            pickedFromYearMonth, pickedToYearMonth) >
        5) {
      ShowSnackBar(SNACK_TYPE.ERROR, 'period_error_limit'.tr);
      return false;
    } else {
      return true;
    }
  }
}
