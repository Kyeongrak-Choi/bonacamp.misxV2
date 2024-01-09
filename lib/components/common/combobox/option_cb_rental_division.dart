import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../utils/constants.dart';

class OptionCbRentalDivision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbRentalDivisionController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'opt_rental_division'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            border: Border.all(color: context.theme.colorScheme.background),
          ),
          child: Obx(
            () => DropdownButtonFormField<String>(
              isExpanded: true,
              menuMaxHeight: BASIC_PADDING * 30.h,
              value: Get.find<CbRentalDivisionController>().selectedValue,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(border: InputBorder.none),
              dropdownColor: context.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(8),
              items: Get.find<CbRentalDivisionController>()
                  .data
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                        ),
                        child: Text(
                          value ?? '',
                          style: context.textTheme.bodyMedium,
                        )),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                Get.find<CbRentalDivisionController>().chooseItem(value!);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CbRentalDivisionController extends GetxController {
  var selectedValue;
  List<String> data = <String>[].obs;

  String paramDivisionCode = '';
  String paramDivisionName = '';

  @override
  void onInit() async {
    super.onInit();
    await setCommon();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(String value) async {
    paramDivisionName = value ?? '';
    switch (paramDivisionName) {
      case '전체':
        paramDivisionCode = '';
        break;
      case '완료':
        paramDivisionCode = '1';
        break;
      case '완납':
        paramDivisionCode = '2';
        break;
      case '진행':
        paramDivisionCode = '3';
        break;
      case '연체':
        paramDivisionCode = '4';
        break;
    }

    selectedValue = value;
  }

  Future<void> setCommon() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<String> common = ['전체', '완료', '완납', '진행', '연체'];

    for (int i = 0; i < common.length; i++) {
      data.add(common[i]);
    }
  }
}
