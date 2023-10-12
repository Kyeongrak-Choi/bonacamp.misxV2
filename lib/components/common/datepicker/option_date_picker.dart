import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OptionDatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DatePickerController());
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.canvasColor,
                ),
                onPressed: () {},
                child: Text(
                  'opt_date'.tr,
                  style: context.textTheme.displaySmall,
                ),
              ),
            ),
          )),
      Expanded(
        flex: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Obx(
                () => TextButton(
                  onPressed: () => Get.find<DatePickerController>().chooseDate(),
                  child: Text(
                    DateFormat('yyyy-MM-dd').format(Get.find<DatePickerController>().date.value).toString(),
                    style: context.textTheme.displaySmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
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
          data: context.theme,
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != date.value) {
      date.value = pickedDate;
    }
  }
}
