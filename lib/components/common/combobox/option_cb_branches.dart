import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/system/branch.dart';

import '../../../utils/constants.dart';
import '../../../utils/theme/text_theme.dart';

class OptionCbBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbBranchController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.all(15),
            child: Text(
              'opt_workspace'.tr,
              textAlign: TextAlign.start,
              style: textThemeCommon().bodyMedium,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Obx(
                  () => DropdownButtonFormField<BranchModel>(
                    isExpanded: true,
                    value: Get.find<CbBranchController>().selectedValue,
                    style: context.textTheme.bodyMedium,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.cardColor,
                    items: Get.find<CbBranchController>().data.map<DropdownMenuItem<BranchModel>>((BranchModel value) {
                      return DropdownMenuItem<BranchModel>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(value.getBranchName ?? ''),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbBranchController>().chooseItem(value!);
                    },
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class CbBranchController extends GetxController {
  var selectedValue;
  List<BranchModel> data = <BranchModel>[].obs;

  // param sample
  String paramClientCode = '';
  String paramClientName = '';
  String paramBranchCode = '';
  String paramBranchName = '';
  String paramBusinessNo = '';
  String paramRepresentative = '';

  @override
  void onInit() async {
    super.onInit();
    await setBranch();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(BranchModel value) async {
    paramClientCode = value.getClientCode ?? '';
    paramClientName = value.getClientName ?? '';
    paramBranchCode = value.getBranchCode ?? '';
    paramBranchName = value.getBranchName ?? '';
    paramBusinessNo = value.getBusinessNo ?? '';
    paramRepresentative = value.getRepresentative ?? '';

    selectedValue = value;
  }

  Future<void> setBranch() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    for (int i = 0; i < Hive.box(LOCAL_DB).get(KEY_BRANCH).length; i++) {
      data.add(Hive.box(LOCAL_DB).get(KEY_BRANCH).elementAt(i));
    }
  }
}
