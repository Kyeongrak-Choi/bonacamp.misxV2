import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renew_misx/constants.dart';
import 'package:renew_misx/theme.dart';

class OptionCombobox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ComboboxController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                // primary: Colors.blueAccent,
                // onPrimary: Colors.white,
                ),
            onPressed: () {},
            child: Text(
              '사업장',
              style: textTheme().headline3,
            ),
          ), // 매출
        ),
        Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
            child: Obx(
              () => DropdownButton(
                value: Get.find<ComboboxController>().selectedValue,
                underline: SizedBox.shrink(),
                style: textTheme().headline3,
                dropdownColor: Color(AppColor),
                items: Get.find<ComboboxController>()
                    .valueList
                    .map((selectedValue) {
                  return DropdownMenuItem(
                    value: selectedValue,
                    child: Text(selectedValue, style: textTheme().headline3),
                  );
                }).toList(),
                onChanged: (value) {
                  Get.find<ComboboxController>().chooseItem(value);
                },
              ),
            ) //
            ),
      ],
    );
  }
}

class ComboboxController extends GetxController {
  final List<String> valueList = ['사업장A', '사업장B', '사업장C', '사업장D', '사업장E'].obs;
  var selectedValue;

  @override
  void onInit() {
    super.onInit();
    selectedValue = valueList.first;
  }

  chooseItem(value) async {
    selectedValue = value;
    update();
  }
}
