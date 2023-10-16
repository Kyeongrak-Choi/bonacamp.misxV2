import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/system/common.dart';

import '../../../utils/constants.dart';

class OptionCbCommon extends StatelessWidget {
  var code;
  var title;

  OptionCbCommon(String code) {
    this.code = code;
    initVar(code);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CbCommonController(code));
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
                      () => DropdownButtonFormField<CommonModel>(
                        isExpanded: true,
                        value: Get.find<CbCommonController>().selectedValue,
                        style: context.textTheme.displaySmall,
                        decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: context.theme.cardColor,
                        items: Get.find<CbCommonController>().data.map<DropdownMenuItem<CommonModel>>((CommonModel value) {
                          return DropdownMenuItem<CommonModel>(
                            alignment: Alignment.center,
                            value: value,
                            child: Text(value.getName ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          Get.find<CbCommonController>().chooseItem(value!);
                        },
                      ),
                    ))),
          ],
        ),
      ],
    );
  }

  void initVar(code) {
    switch (code) {
      case SYSTEM_COMMON_ABS010:
        title = 'common_abs010'.tr;
        break;
      case SYSTEM_COMMON_AMC002:
        title = 'common_amc002'.tr;
        break;
    }
  }
}

class CbCommonController extends GetxController {
  var selectedValue;
  List<CommonModel> data = <CommonModel>[].obs;

  var commonCode;

  String paramBusinessTypeCode = '';
  String paramBusinessTypeName = '';

  CbCommonController(code){
    commonCode = code;
  }

  @override
  void onInit() async {
    super.onInit();
    await setCommon();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(CommonModel value) async {
    paramBusinessTypeCode = value.getCode ?? '';
    paramBusinessTypeName = value.getName ?? '';

    selectedValue = value;
  }

  Future<void> setCommon() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<dynamic> common = Hive.box(LOCAL_DB).get(KEY_COMMON);

    for (int i = 0; i < common.length; i++) {
      if (common.elementAt(i).getMainCode == commonCode) {
        data.add(Hive.box(LOCAL_DB).get(KEY_COMMON).elementAt(i));
      }
    }
  }
}
