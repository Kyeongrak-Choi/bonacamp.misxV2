import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/employee.dart';
import '../../../utils/constants.dart';

class OptionCbManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbManagerController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'opt_manage'.tr,
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
            () => DropdownButtonFormField<EmployeeModel>(
              padding: EdgeInsetsDirectional.fromSTEB(
                  BASIC_PADDING * 2.w, 0.h, BASIC_PADDING * 2.w, 0.h),
              isExpanded: true,
              menuMaxHeight: BASIC_PADDING * 30.h,
              value: Get.find<CbManagerController>().selectedValue,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(border: InputBorder.none),
              dropdownColor: context.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(8),
              items: Get.find<CbManagerController>()
                  .data
                  .map<DropdownMenuItem<EmployeeModel>>((EmployeeModel value) {
                return DropdownMenuItem<EmployeeModel>(
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
                          value.getEmployeeName ?? '',
                          style: context.textTheme.bodyMedium,
                        )),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                Get.find<CbManagerController>().chooseItem(value!);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CbManagerController extends GetxController {
  var selectedValue;
  List<EmployeeModel> data = [
    EmployeeModel('', '전체', false),
  ].obs;

  String paramManagerCode = '';
  String paramManagerName = '';
  bool paramManager = false;

  @override
  void onInit() {
    super.onInit();
    setManager();
    selectedValue = data.first;
  }

  chooseItem(EmployeeModel value) async {
    paramManagerCode = value.getEmployeeCode ?? '';
    paramManagerName = value.getEmployeeName ?? '';
    paramManager = value.getManager ?? false;
    selectedValue = value;
  }

  Future<void> setManager() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<dynamic> manager = Hive.box(LOCAL_DB).get(KEY_EMPLOYEE);

    for (int i = 0; i < manager.length; i++) {
      if (manager.elementAt(i).getManager) {
        data.add(manager.elementAt(i));
      }
    }
  }
}
