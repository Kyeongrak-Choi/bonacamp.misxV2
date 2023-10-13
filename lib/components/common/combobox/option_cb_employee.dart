import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/employee.dart';
import '../../../utils/constants.dart';

class OptionCbEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbSaleController());
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     Expanded(
    //         flex: 2,
    //         child: Padding(
    //           padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //           child: Container(
    //             child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: context.theme.canvasColor,
    //                 ),
    //                 onPressed: () {},
    //                 child: Text(
    //                   'opt_sales'.tr,
    //                   style: context.textTheme.displaySmall,
    //                 )),
    //           ),
    //         )),
    //     Expanded(
    //         flex: 4,
    //         child: Padding(
    //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //             child: Obx(
    //               () => DropdownButtonFormField<EmployeeModel>(
    //                 isExpanded: true,
    //                 value: Get.find<CbSaleController>().selectedValue,
    //                 style: context.textTheme.displaySmall,
    //                 decoration: InputDecoration(border: InputBorder.none),
    //                 dropdownColor: context.theme.cardColor,
    //                 items: Get.find<CbSaleController>().data.map<DropdownMenuItem<EmployeeModel>>((EmployeeModel value) {
    //                   return DropdownMenuItem<EmployeeModel>(
    //                     alignment: Alignment.center,
    //                     value: value,
    //                     child: Text(value.getEmployeeName ?? ''),
    //                   );
    //                 }).toList(),
    //                 onChanged: (value) {
    //                   Get.find<CbSaleController>().chooseItem(value!);
    //                 },
    //               ),
    //             ))),
    //   ],
    // );

    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Text(
              'opt_sales'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.displayLarge,
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
                        value: Get.find<CbSaleController>().selectedValue,
                        style: context.textTheme.displaySmall,
                        decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: context.theme.cardColor,
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
        ),
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
