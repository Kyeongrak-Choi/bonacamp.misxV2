import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/employee.dart';
import '../../../utils/constants.dart';

class OptionCbEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbEmployeeController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'opt_sales'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 4,
                child: Obx(
                  () => DropdownButtonFormField<EmployeeModel>(
                    isExpanded: true,
                    value: Get.find<CbEmployeeController>().selectedValue,
                    style: context.textTheme.bodyMedium,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.cardColor,
                    items: Get.find<CbEmployeeController>().data.map<DropdownMenuItem<EmployeeModel>>((EmployeeModel value) {
                      return DropdownMenuItem<EmployeeModel>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(value.getEmployeeName ?? ''),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbEmployeeController>().chooseItem(value!);
                    },
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class CbEmployeeController extends GetxController {
  var selectedValue;
  List<EmployeeModel> data = [
    EmployeeModel('', '전체', false),
  ].obs;

  String paramEmployeeCode = '';
  String paramEmployeeName = '';
  bool paramManager = false;

  @override
  void onInit() {
    super.onInit();
    setEmployee();
    selectedValue = data.first;
  }

  chooseItem(EmployeeModel value) async {
    paramEmployeeCode = value.getEmployeeCode ?? '';
    paramEmployeeName = value.getEmployeeName ?? '';
    paramManager = value.getManager ?? false;
    selectedValue = value;
  }

  Future<void> setEmployee() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<dynamic> employee = Hive.box(LOCAL_DB).get(KEY_EMPLOYEE);

    for (int i = 0; i < employee.length; i++) {
      data.add(employee.elementAt(i));
    }
  }
}
