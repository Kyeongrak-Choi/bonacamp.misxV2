import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/system/warehouse.dart';

import '../../../models/system/common.dart';
import '../../../utils/constants.dart';

class OptionCbCustomerStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbCustomerStatusController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.all(20),
            child: Text(
              'opt_customer_status'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium,
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
                    value: Get.find<CbCustomerStatusController>().selectedValue,
                    style: context.textTheme.bodyMedium,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.cardColor,
                    items: Get.find<CbCustomerStatusController>().data.map<DropdownMenuItem<CommonModel>>((CommonModel value) {
                      return DropdownMenuItem<CommonModel>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(value.getName ?? ''),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbCustomerStatusController>().chooseItem(value!);
                    },
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class CbCustomerStatusController extends GetxController {
  var selectedValue;
  List<CommonModel> data = <CommonModel>[
    CommonModel('', 0, '', '전체', '', '', '', '', ''),
  ].obs;

  String paramCustomerStatusCode = '';
  String paramCustomerStatusName = '';

  @override
  void onInit() async {
    super.onInit();
    await setCommon();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(CommonModel value) async {

    paramCustomerStatusCode = value.getCode ?? '';
    paramCustomerStatusName = value.getName ?? '';
    selectedValue = value;

    // switch (value.getCode) {
    //   case '':
    //     paramCustomerStatusCode = 'ALL';
    //     break;
    //   case '1' :
    //     paramCustomerStatusCode = 'USE';
    //     break;
    //   case '2':
    //     paramCustomerStatusCode = 'STOP';
    //     break;
    //   case '3':
    //     paramCustomerStatusCode = 'CLOSE';
    //     break;
    //   case '4':
    //     paramCustomerStatusCode = 'UNUSE';
    //     break;
    //   case '5':
    //     paramCustomerStatusCode = 'CUT';
    //     break;
    // }

  }

  Future<void> setCommon() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<dynamic> common = Hive.box(LOCAL_DB).get(KEY_COMMON);

    for (int i = 0; i < common.length; i++) {
      if (common.elementAt(i).getMainCode == 'ABS018') {
        data.add(Hive.box(LOCAL_DB).get(KEY_COMMON).elementAt(i));
      }
    }
  }
}
