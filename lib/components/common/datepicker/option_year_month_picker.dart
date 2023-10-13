import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class OptionYearMonthPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MonthPickerController());
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Expanded(
    //         flex: 2,
    //         child: Padding(
    //           padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //           child: Container(
    //             child: ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 backgroundColor: context.theme.canvasColor,
    //               ),
    //               onPressed: () {},
    //               child: Text(
    //                 'opt_month'.tr,
    //                 style: context.textTheme.displaySmall,
    //               ),
    //             ),
    //           ),
    //         )),
    //     Expanded(
    //       flex: 4,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Padding(
    //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //             child: Obx(
    //               () => TextButton(
    //                 onPressed: () => Get.find<MonthPickerController>().chooseYearMonth(),
    //                 child: Text(
    //                   DateFormat('yyyy-MM').format(Get.find<MonthPickerController>().yearMonth.value).toString(),
    //                   style: context.textTheme.displaySmall,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );

    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Text(
              'opt_month'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.displayMedium,
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
                    onPressed: () => Get.find<MonthPickerController>().chooseYearMonth(),
                    child: Text(
                      DateFormat('yyyy-MM').format(Get.find<MonthPickerController>().yearMonth.value).toString(),
                      style: context.textTheme.displaySmall,
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
