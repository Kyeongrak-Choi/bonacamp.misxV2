import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

import '../../../utils/constants.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class  OptionPeriodPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PeriodPickerController());
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: 8.h),
            child: Text(
              'opt_period'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge,
              //style: TextStyle(fontSize: 14.sp, fontFamily: 'SUITE'),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Color(0x22000000)),
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.find<PeriodPickerController>().chooseFromDate();
                        },
                        //icon: Icon(Icons.date_range, color: context.theme.primaryColor)),
                        icon: ImageIcon(
                        AssetImage('lib/assets/icons/calendar.png'), color: context.theme.primaryColor, size: 24,)),
                    Obx(
                          () => TextButton(
                            onPressed: () => Get.find<PeriodPickerController>().chooseFromDate(),
                            child: Text(
                              DateFormat('yyyy-MM-dd').format(Get.find<PeriodPickerController>().fromDate.value).toString(),
                              style: context.textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(8.w, 0, 8.w, 0),
              child: Text(
                ' - ',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Color(0x22000000)),
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.find<PeriodPickerController>().chooseToDate();
                        },
                        icon: ImageIcon(
                          AssetImage('lib/assets/icons/calendar.png'), color: context.theme.primaryColor, size: 24,)),
                    Obx(
                          () => TextButton(
                        onPressed: () => Get.find<PeriodPickerController>().chooseToDate(),
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(Get.find<PeriodPickerController>().toDate.value).toString(),
                          style: context.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
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
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple, // 선택한 날짜 표시 색상 변경
            hintColor: Colors.purple, // 선택한 날짜 밑줄 색상 변경
            primaryTextTheme: TextTheme(
              titleMedium: TextStyle(fontSize: 20.0, color: Colors.black), // 글자 크기 조정
            ),
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
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple, // 선택한 날짜 표시 색상 변경
            hintColor: Colors.purple, // 선택한 날짜 밑줄 색상 변경
            primaryTextTheme: TextTheme(
              titleMedium: TextStyle(fontSize: 20.0, color: Colors.black), // 글자 크기 조정
            ),
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

  // 기간 Validation check
  bool Validate() {
    if (pickedFromDate.compareTo(pickedToDate) > 0) {
      ShowSnackBar(SNACK_TYPE.ERROR, 'period_error_content'.tr);
      return false;
    } else {
      return true;
    }
  }
}
