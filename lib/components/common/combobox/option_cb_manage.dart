import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/system/manage.dart';

class OptionCbManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbManageController());
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
                      'opt_manage'.tr,
                      style: context.textTheme.displayMedium,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                  () => DropdownButtonFormField(
                    isExpanded: true,
                    value: Get.find<CbManageController>().selectedValue,
                    style: context.textTheme.displayMedium,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.cardColor,
                    items: Get.find<CbManageController>().data.map((selectedValue) {
                      return DropdownMenuItem(
                        alignment: Alignment.center,
                        value: selectedValue,
                        child: Text(
                          selectedValue.getManageName ?? "",
                          style: context.textTheme.displayMedium,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbManageController>().chooseItem(value);
                    },
                  ),
                ))),
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
