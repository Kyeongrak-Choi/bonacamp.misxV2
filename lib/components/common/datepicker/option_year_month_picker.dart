import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../../../utils/constants.dart';

class OptionYearMonthPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MonthPickerController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: IconButton(
                  onPressed: () {
                    Get.find<MonthPickerController>().chooseYearMonth();
                  },
                  icon: ImageIcon(
                    AssetImage('lib/assets/icons/calendar.png'),
                  ),
                  visualDensity: VisualDensity.comfortable,
                ),
              ),
              Expanded(
                flex: 1,
                child: Obx(
                  () => TextButton(
                    onPressed: () => Get.find<MonthPickerController>().chooseYearMonth(),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        DateFormat('yyyy-MM').format(Get.find<MonthPickerController>().yearMonth.value).toString(),
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
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
      locale: localeObj,

      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple, // 선택한 날짜 표시 색상 변경
            hintColor: Colors.purple, // 선택한 날짜 밑줄 색상 변경
            textTheme: TextTheme(
              titleMedium:
              TextStyle(fontSize: 8, color: Colors.black), // 글자 크기 조정
            ),
            primaryTextTheme: TextTheme(
              titleMedium:
              TextStyle(fontSize: 8, color: Colors.black), // 글자 크기 조정
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != yearMonth.value) {
      yearMonth.value = pickedDate;
    }
  }
}