import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renew_misx/constants.dart';
import 'package:renew_misx/theme.dart';

class OptionCbManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbManageController());
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
                        // primary: Colors.blueAccent,
                        // onPrimary: Colors.white,
                        ),
                    onPressed: () {},
                    child: Text(
                      'opt_manage'.tr,
                      style: textTheme().headline3,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                  () => DropdownButtonFormField(
                    isExpanded: true,
                    value: Get.find<CbManageController>().selectedValue,
                    style: textTheme().headline3,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: Color(AppColor),
                    items: Get.find<CbManageController>()
                        .data
                        .map((selectedValue) {
                      return DropdownMenuItem(
                        alignment: Alignment.center,
                        value: selectedValue,
                        child:
                            Text(selectedValue, style: textTheme().headline3),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbManageController>().chooseItem(value);
                    },
                  ),
                ))),
      ],
    );
  }
}

class CbManageController extends GetxController {
  final List<String> data = ['관리담당A', '관리담당B', '관리담당C', '관리담당D', '관리담당E'].obs;
  var selectedValue;

  @override
  void onInit() {
    super.onInit();
    selectedValue = data.first;
  }

  chooseItem(value) async {
    selectedValue = value;
    update();
  }
}
