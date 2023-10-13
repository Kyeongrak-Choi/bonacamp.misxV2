import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/system/common.dart';

import '../../../utils/constants.dart';

class OptionCbBusinessType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbBusinessTypeController());
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
    //                   'opt_business'.tr,
    //                   style: context.textTheme.displaySmall,
    //                 )),
    //           ),
    //         )),
    //     Expanded(
    //         flex: 4,
    //         child: Padding(
    //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //             child: Obx(
    //               () => DropdownButtonFormField<CommonModel>(
    //                 isExpanded: true,
    //                 value: Get.find<CbBusinessTypeController>().selectedValue,
    //                 style: context.textTheme.displaySmall,
    //                 decoration: InputDecoration(border: InputBorder.none),
    //                 dropdownColor: context.theme.cardColor,
    //                 items: Get.find<CbBusinessTypeController>().data.map<DropdownMenuItem<CommonModel>>((CommonModel value) {
    //                   return DropdownMenuItem<CommonModel>(
    //                     alignment: Alignment.center,
    //                     value: value,
    //                     child: Text(value.getName ?? ''),
    //                   );
    //                 }).toList(),
    //                 onChanged: (value) {
    //                   Get.find<CbBusinessTypeController>().chooseItem(value!);
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
              'opt_business'.tr,
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
                        value: Get.find<CbBusinessTypeController>().selectedValue,
                        style: context.textTheme.displaySmall,
                        decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: context.theme.cardColor,
                        items: Get.find<CbBusinessTypeController>().data.map<DropdownMenuItem<CommonModel>>((CommonModel value) {
                          return DropdownMenuItem<CommonModel>(
                            alignment: Alignment.center,
                            value: value,
                            child: Text(value.getName ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          Get.find<CbBusinessTypeController>().chooseItem(value!);
                        },
                      ),
                    ))),
          ],
        ),
      ],
    );
  }
}

class CbBusinessTypeController extends GetxController {
  var selectedValue;
  List<CommonModel> data = <CommonModel>[].obs;

  String paramBusinessTypeCode = '';
  String paramBusinessTypeName = '';

  @override
  void onInit() async {
    super.onInit();
    await setBusinessType();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(CommonModel value) async {
    paramBusinessTypeCode = value.getCode ?? '';
    paramBusinessTypeName = value.getName ?? '';

    selectedValue = value;
  }

  Future<void> setBusinessType() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<dynamic> common = Hive.box(LOCAL_DB).get(KEY_COMMON);

    for (int i = 0; i < common.length; i++) {
      if (common.elementAt(i).getMainCode == 'ABS010') {
        data.add(Hive.box(LOCAL_DB).get(KEY_COMMON).elementAt(i));
      }
    }
  }
}
