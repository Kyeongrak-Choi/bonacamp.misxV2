import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OptionDatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DatePickerController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Text(
              'opt_date'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Obx(
                  () => TextButton(
                    onPressed: () => Get.find<DatePickerController>().chooseDate(),
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(Get.find<DatePickerController>().date.value).toString(),
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(Icons.date_range, color: context.theme.primaryColor),
            ),
          ],
        )
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

    if (pickedDate != null && pickedDate != date.value) {
      date.value = pickedDate;
    }
  }
}
