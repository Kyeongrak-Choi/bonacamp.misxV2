import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/theme/text_theme.dart';

class OptionDialogLendItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionDialogLendItemController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'title_search_lenditem'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            border: Border.all(color: context.theme.colorScheme.background),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Get.toNamed(ROUTE_DIALOG_LENDITM),
                child: Obx(() => Text(
                      Get.find<OptionDialogLendItemController>()
                          .selectedValue
                          .value,
                      style: context.textTheme.bodyMedium,
                    )),
              ),
              IconButton(
                  onPressed: () {
                    Get.find<OptionDialogLendItemController>()
                        .selectedValue
                        .value = '전체';
                    Get.find<OptionDialogLendItemController>()
                        .paramLendItemName
                        .value = ''.tr;
                    Get.find<OptionDialogLendItemController>()
                        .paramLendItemCode
                        .value = ''.tr;
                    Get.find<OptionDialogLendItemController>().paramCode = '';
                  },
                  icon: Icon(Icons.cancel_outlined,)),
            ],
          ),
        ),
      ],
    );
  }
}

class OptionDialogLendItemController extends GetxController {
  RxString selectedValue = '전체'.obs;

  RxString paramLendItemName = ''.tr.obs;
  RxString paramLendItemCode = ''.tr.obs;

  String paramCode = '';

  @override
  void onInit() {
    super.onInit();
  }

  chooseItem(code, name) async {
    selectedValue.value = name;
    paramLendItemName.value = name;
    paramLendItemCode.value = code;
    paramCode = code;
  }
}
