import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/system/common.dart';

import '../../../utils/constants.dart';
import '../../../utils/theme/text_theme.dart';

class OptionCbBusiness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbBusinessController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'opt_business'.tr,
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
            () => DropdownButtonFormField<CommonModel>(
              padding: EdgeInsetsDirectional.fromSTEB(
                  BASIC_PADDING * 2.w, 0.h, BASIC_PADDING * 2.w, 0.h),
              isExpanded: true,
              menuMaxHeight: BASIC_PADDING * 30.h,
              value: Get.find<CbBusinessController>().selectedValue,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(border: InputBorder.none),
              dropdownColor: context.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(8),
              items: Get.find<CbBusinessController>()
                  .data
                  .map<DropdownMenuItem<CommonModel>>((CommonModel value) {
                return DropdownMenuItem<CommonModel>(
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
                          value.getName ?? '',
                          style: context.textTheme.bodyMedium,
                        )),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                Get.find<CbBusinessController>().chooseItem(value!);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CbBusinessController extends GetxController {
  var selectedValue;
  List<CommonModel> data = <CommonModel>[
    CommonModel('', 0, '', '전체', '', '', '', '', ''),
  ].obs;

  String paramBusinessCode = '';
  String paramBusinessName = '';

  @override
  void onInit() async {
    super.onInit();
    await setCommon();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(CommonModel value) async {
    paramBusinessCode = value.getCode ?? '';
    paramBusinessName = value.getName ?? '';
    selectedValue = value;
  }

  Future<void> setCommon() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<dynamic> common = Hive.box(LOCAL_DB).get(KEY_COMMON);

    for (int i = 0; i < common.length; i++) {
      if (common.elementAt(i).getMainCode == 'ABS010') {
        data.add(Hive.box(LOCAL_DB).get(KEY_COMMON).elementAt(i));
      }
    }
  }
}
