import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/utils/snackbar.dart';

class OptionPeriodPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PeriodPickerController());
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
                    style: context.textTheme.bodyText1,
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
                    onPressed: () =>
                        Get.find<PeriodPickerController>().chooseFromDate(),
                    child: Text(
                      DateFormat('yyyy-MM-dd')
                          .format(
                              Get.find<PeriodPickerController>().fromDate.value)
                          .toString(),
                      style: context.textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Text(
                  '~',
                  style: context.textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                  () => TextButton(
                    onPressed: () =>
                        Get.find<PeriodPickerController>().chooseToDate(),
                    child: Text(
                        DateFormat('yyyy-MM-dd')
                            .format(
                                Get.find<PeriodPickerController>().toDate.value)
                            .toString(),
                        style: context.textTheme.bodyText1),
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
      ShowSnackBar('e', 'period_error_content'.tr);
      return false;
    } else {
      return true;
    }
  }
}
