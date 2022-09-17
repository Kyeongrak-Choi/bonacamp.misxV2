import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:misxV2/utils/constants.dart';
import 'package:misxV2/utils/theme/theme_manager.dart';

import '../../../utils/theme/text_theme.dart';

class OptionCbSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbSaleController());
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
                      //backgroundColor: context.theme.canvasColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'opt_sales'.tr,
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
                    value: Get.find<CbSaleController>().selectedValue,
                    style: context.textTheme.bodyText1,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.backgroundColor,
                    items:
                        Get.find<CbSaleController>().data.map((selectedValue) {
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
                      Get.find<CbSaleController>().chooseItem(value);
                    },
                  ),
                ))),
      ],
    );
  }
}

class CbSaleController extends GetxController {
  final List<String> data = ['영업담당A', '영업담당B', '영업담당C', '영업담당D', '영업담당E'].obs;
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
