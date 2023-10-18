import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/system/common.dart';

import '../../../utils/constants.dart';

class OptionCbSalesType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbSalesTypeController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'opt_sales_type'.tr,
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
                  () => DropdownButtonFormField<CommonModel>(
                    isExpanded: true,
                    value: Get.find<CbSalesTypeController>().selectedValue,
                    style: context.textTheme.bodyMedium,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.cardColor,
                    items: Get.find<CbSalesTypeController>().data.map<DropdownMenuItem<CommonModel>>((CommonModel value) {
                      return DropdownMenuItem<CommonModel>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(value.getName ?? ''),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbSalesTypeController>().chooseItem(value!);
                    },
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class CbSalesTypeController extends GetxController {
  var selectedValue;
  List<CommonModel> data = <CommonModel>[
    CommonModel('', 0, '', '전체', '', '', '', '', ''),
  ].obs;

  String paramSalesTypeCode = '';
  String paramSalesTypeName = '';

  @override
  void onInit() async {
    super.onInit();
    await setCommon();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(CommonModel value) async {
    paramSalesTypeCode = value.getCode ?? '';
    paramSalesTypeName = value.getName ?? '';

    selectedValue = value;
  }

  Future<void> setCommon() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<dynamic> common = Hive.box(LOCAL_DB).get(KEY_COMMON);

    for (int i = 0; i < common.length; i++) {
      if (common.elementAt(i).getMainCode == 'AMC002') {
        data.add(Hive.box(LOCAL_DB).get(KEY_COMMON).elementAt(i));
      }
    }
  }
}
