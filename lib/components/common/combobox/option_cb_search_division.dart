import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../utils/constants.dart';
import '../../../utils/theme/text_theme.dart';

class OptionCbSearchDivision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbSearchDivisionController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'opt_search_division'.tr,
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
              padding: EdgeInsetsDirectional.fromSTEB(
                  BASIC_PADDING * 2.w, 0.h, BASIC_PADDING * 2.w, 0.h),
              isExpanded: true,
              menuMaxHeight: BASIC_PADDING * 30.h,
              value: Get.find<CbSearchDivisionController>().selectedValue,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(border: InputBorder.none),
              dropdownColor: context.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(8),
              items: Get.find<CbSearchDivisionController>()
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
                Get.find<CbSearchDivisionController>().chooseItem(value!);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CbSearchDivisionController extends GetxController {
  var selectedValue;
  List<String> data = <String>[].obs;

  String paramDivisionCode = '1';
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
        paramDivisionCode = '1';
        break;
      case '매출':
        paramDivisionCode = '0';
        break;
      case '매출/입금':
        paramDivisionCode = '1';
        break;
    }

    selectedValue = value;
  }

  Future<void> setCommon() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<String> common = ['전체', '매출', '매출/입금'];

    for (int i = 0; i < common.length; i++) {
      data.add(common[i]);
    }
  }
}
