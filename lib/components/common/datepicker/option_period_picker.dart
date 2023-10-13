import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants.dart';
import '../../../utils/utility.dart';

class OptionPeriodPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PeriodPickerController());
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
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
    //                 'opt_period'.tr,
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
    //                 onPressed: () => Get.find<PeriodPickerController>().chooseFromDate(),
    //                 child: Text(
    //                   DateFormat('yyyy-MM-dd').format(Get.find<PeriodPickerController>().fromDate.value).toString(),
    //                   style: context.textTheme.displaySmall,
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //             child: Text(
    //               '~',
    //               style: context.textTheme.displaySmall,
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //             child: Obx(
    //               () => TextButton(
    //                 onPressed: () => Get.find<PeriodPickerController>().chooseToDate(),
    //                 child: Text(DateFormat('yyyy-MM-dd').format(Get.find<PeriodPickerController>().toDate.value).toString(),
    //                     style: context.textTheme.displaySmall),
    //               ),
    //             ),
    //           )
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
              'opt_period'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.displayLarge,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Obx(
                      () => TextButton(
                        onPressed: () => Get.find<PeriodPickerController>().chooseFromDate(),
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(Get.find<PeriodPickerController>().fromDate.value).toString(),
                          style: context.textTheme.displaySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Icon(Icons.date_range, color: context.theme.primaryColor),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                '~',
                style: context.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Obx(
                      () => TextButton(
                        onPressed: () => Get.find<PeriodPickerController>().chooseToDate(),
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(Get.find<PeriodPickerController>().toDate.value).toString(),
                          style: context.textTheme.displaySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Icon(Icons.date_range, color: context.theme.primaryColor),
                  ),
                ],
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
          data: context.theme,
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
          data: context.theme,
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
