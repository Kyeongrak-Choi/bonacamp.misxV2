import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/employee.dart';
import '../../../utils/constants.dart';

class OptionCbEmployee extends StatelessWidget {
  bool flag = false;
  var title;

  OptionCbEmployee(bool data) {
    this.flag = data;
    initVar(flag);
  }
  @override
  Widget build(BuildContext context) {
    Get.put(CbEmployeeController(flag));

    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: context.textTheme.displayMedium,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Obx(
                      () => DropdownButtonFormField<EmployeeModel>(
                        isExpanded: true,
                        value: Get.find<CbEmployeeController>().selectedValue,
                        style: context.textTheme.displaySmall,
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
                    ))),
          ],
        ),
      ],
    );
  }

  void initVar(isManage) {
    if (isManage) {
      title = 'opt_manage'.tr;
    } else {
      title = 'opt_sales'.tr;
    }
  }
}

class CbEmployeeController extends GetxController {
  var selectedValue;
  List<EmployeeModel> data = [
    EmployeeModel('', '전체', false),
  ].obs;

  bool isManage=false;

  String paramEmployeeCode = '';
  String paramEmployeeName = '';
  bool paramManager = false;

  CbEmployeeController(flag) {
    this.isManage = flag;
  }

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
      if (isManage) {
        if (employee.elementAt(i).getManager) {
          data.add(employee.elementAt(i));
        }
      } else {
        data.add(employee.elementAt(i));
      }
    }
  }
}
