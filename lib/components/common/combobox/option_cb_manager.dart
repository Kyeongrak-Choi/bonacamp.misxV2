import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/employee.dart';
import '../../../utils/constants.dart';
import '../../../utils/theme/text_theme.dart';

class OptionCbManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbManagerController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.all(15),
            child: Text(
              'opt_manage'.tr,
              textAlign: TextAlign.start,
              style: textThemeCommon().bodyMedium,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Obx(
              () => DropdownButtonFormField<EmployeeModel>(
                isExpanded: true,
                value: Get.find<CbManagerController>().selectedValue,
                style: context.textTheme.bodyMedium,
                decoration: InputDecoration(border: InputBorder.none),
                dropdownColor: context.theme.cardColor,
                items: Get.find<CbManagerController>().data.map<DropdownMenuItem<EmployeeModel>>((EmployeeModel value) {
                  return DropdownMenuItem<EmployeeModel>(
                    alignment: Alignment.center,
                    value: value,
                    child: Text(value.getEmployeeName ?? ''),
                  );
                }).toList(),
                onChanged: (value) {
                  Get.find<CbManagerController>().chooseItem(value!);
                },
              ),
            )),
          ],
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
