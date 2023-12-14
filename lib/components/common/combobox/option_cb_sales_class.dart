import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/system/common.dart';

import '../../../utils/constants.dart';
import '../../../utils/theme/text_theme.dart';

class OptionCbSalesClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbSalesClassController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.all(15),
            child: Text(
              'opt_sales_class'.tr,
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
              () => DropdownButtonFormField<CommonModel>(
                isExpanded: true,
                value: Get.find<CbSalesClassController>().selectedValue,
                style: context.textTheme.bodyMedium,
                decoration: InputDecoration(border: InputBorder.none),
                dropdownColor: context.theme.cardColor,
                items: Get.find<CbSalesClassController>().data.map<DropdownMenuItem<CommonModel>>((CommonModel value) {
                  return DropdownMenuItem<CommonModel>(
                    alignment: Alignment.center,
                    value: value,
                    child: Text(value.getName ?? ''),
                  );
                }).toList(),
                onChanged: (value) {
                  Get.find<CbSalesClassController>().chooseItem(value!);
                },
              ),
            )),
          ],
        ),
      ],
    );
  }
}

class CbSalesClassController extends GetxController {
  var selectedValue;
  List<CommonModel> data = <CommonModel>[
    CommonModel('', 0, '', '전체', '', '', '', '', ''),
  ].obs;

  String paramSalesClassCode = '';
  String paramSalesClassName = '';

  @override
  void onInit() async {
    super.onInit();
    await setCommon();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(CommonModel value) async {
    paramSalesClassCode = value.getCode ?? '';
    paramSalesClassName = value.getName ?? '';
    selectedValue = value;
  }

  Future<void> setCommon() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<dynamic> common = Hive.box(LOCAL_DB).get(KEY_COMMON);

    for (int i = 0; i < common.length; i++) {
      if (common.elementAt(i).getMainCode == 'ABS013') {
        data.add(Hive.box(LOCAL_DB).get(KEY_COMMON).elementAt(i));
      }
    }
  }
}
