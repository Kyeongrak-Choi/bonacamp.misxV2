import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/employee.dart';
import '../../../utils/constants.dart';

class OptionCbEmployee extends StatelessWidget {
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
                      backgroundColor: context.theme.canvasColor,
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
                  () => DropdownButtonFormField<EmployeeModel>(
                    isExpanded: true,
                    value: Get.find<CbSaleController>().selectedValue,
                    style: context.textTheme.bodyText1,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.backgroundColor,
                    items: Get.find<CbSaleController>().data.map<DropdownMenuItem<EmployeeModel>>((EmployeeModel value) {
                      return DropdownMenuItem<EmployeeModel>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(value.getEmployeeName ?? ''),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbSaleController>().chooseItem(value!);
                    },
                  ),
                ))),
      ],
    );
  }
}

class CbSaleController extends GetxController {
  var selectedValue;
  List<EmployeeModel> data = [
    EmployeeModel('', '전체', false),
  ].obs;

  // param sample
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

    for (int i = 0; i < Hive.box(LOCAL_DB).get(KEY_EMPLOYEE).length; i++) {
      data.add(Hive.box(LOCAL_DB).get(KEY_EMPLOYEE).elementAt(i));
    }
  }
}
