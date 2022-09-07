import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:renew_misx/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
    Get.dialog(
      SfDateRangePicker(
        minDate: DateTime(2000),
        maxDate: DateTime(2100),
        // onSelectionChanged:
        //     (DateRangePickerSelectionChangedArgs args) {
        //   setState(() {
        //     if (args.value is PickerDateRange) {
        //       start = args.value.startDate
        //           .toString()
        //           .substring(0, 10);
        //
        //       end = args.value.endDate != null
        //           ? args.value.endDate
        //           .toString()
        //           .substring(0, 10)
        //           : start;
        //     }
        //   });
        // },
        selectionMode: DateRangePickerSelectionMode.range, // range : 기간
        monthCellStyle: const DateRangePickerMonthCellStyle(
          textStyle: TextStyle(color: Colors.amber),
          todayTextStyle: TextStyle(color: Colors.amber),
        ),
        startRangeSelectionColor: Color(AppColor),
        endRangeSelectionColor: Color(AppColor),
        rangeSelectionColor: Color(AppColor),
        selectionTextStyle: const TextStyle(color: Colors.amber),
        todayHighlightColor: Colors.amber,
        selectionColor: Color(AppColor),
        backgroundColor: Color(AppColor),
        allowViewNavigation: false,
        //view:  DateRangePickerView.month,
        headerStyle: const DateRangePickerHeaderStyle(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontSize: 18,
                fontStyle: FontStyle.italic)),
        monthViewSettings: const DateRangePickerMonthViewSettings(
          enableSwipeSelection: false,
        ),
      ),
    );
  }
}
