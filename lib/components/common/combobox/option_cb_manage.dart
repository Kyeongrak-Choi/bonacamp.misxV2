import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:misxV2/utils/constants.dart';
import 'package:misxV2/utils/theme/theme_manager.dart';

import '../../../utils/theme/text_theme.dart';

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
                      backgroundColor: context.theme.canvasColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'opt_manage'.tr,
                      style: context.textTheme.bodyText1,
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
                    style: context.textTheme.bodyText1,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.backgroundColor,
                    items: Get.find<CbManageController>()
                        .data
                        .map((selectedValue) {
                      return DropdownMenuItem(
                        alignment: Alignment.center,
                        value: selectedValue,
                        child: Text(
                          selectedValue,
                          style: context.textTheme.bodyText1,
                        ),
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
