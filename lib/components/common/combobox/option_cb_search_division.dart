import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../utils/constants.dart';

class OptionCbSearchDivision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbSearchDivisionController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'opt_search_division'.tr,
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
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Obx(
                      () => DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: Get.find<CbSearchDivisionController>().selectedValue,
                        style: context.textTheme.bodyMedium,
                        decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: context.theme.cardColor,
                        items: Get.find<CbSearchDivisionController>().data.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: value,
                            child: Text(value ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          Get.find<CbSearchDivisionController>().chooseItem(value!);
                        },
                      ),
                    ))),
          ],
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
