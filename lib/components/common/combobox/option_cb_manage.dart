import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/system/manage.dart';

class OptionCbManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbManageController());
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
    //                   'opt_manage'.tr,
    //                   style: context.textTheme.displaySmall,
    //                 )),
    //           ),
    //         )),
    //     Expanded(
    //         flex: 4,
    //         child: Padding(
    //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //             child: Obx(
    //               () => DropdownButtonFormField(
    //                 isExpanded: true,
    //                 value: Get.find<CbManageController>().selectedValue,
    //                 style: context.textTheme.displaySmall,
    //                 decoration: InputDecoration(border: InputBorder.none),
    //                 dropdownColor: context.theme.cardColor,
    //                 items: Get.find<CbManageController>().data.map((selectedValue) {
    //                   return DropdownMenuItem(
    //                     alignment: Alignment.center,
    //                     value: selectedValue,
    //                     child: Text(
    //                       selectedValue.getManageName ?? "",
    //                       style: context.textTheme.displaySmall,
    //                     ),
    //                   );
    //                 }).toList(),
    //                 onChanged: (value) {
    //                   Get.find<CbManageController>().chooseItem(value);
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
              'opt_manage'.tr,
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
                      () => DropdownButtonFormField(
                        isExpanded: true,
                        value: Get.find<CbManageController>().selectedValue,
                        style: context.textTheme.displaySmall,
                        decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: context.theme.cardColor,
                        items: Get.find<CbManageController>().data.map((selectedValue) {
                          return DropdownMenuItem(
                            alignment: Alignment.center,
                            value: selectedValue,
                            child: Text(
                              selectedValue.getManageName ?? "",
                              style: context.textTheme.displaySmall,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          Get.find<CbManageController>().chooseItem(value);
                        },
                      ),
                    ))),
          ],
        ),
      ],
    );
  }
}

class CbManageController extends GetxController {
  final List<ManageModel> data = [
    ManageModel('', '전체'),
  ].obs;

  String paramManageCode = '';
  String paramManageName = '';

  var selectedValue;

  @override
  void onInit() {
    super.onInit();
    selectedValue = data.first;
  }

  chooseItem(value) async {
    paramManageCode = value.getManageCode();
    paramManageName = value.getManageName();
    selectedValue = value;
  }
}
