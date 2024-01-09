import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/theme/text_theme.dart';

class OptionDialogItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionDialogItemController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'title_search_item'.tr,
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
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => Get.toNamed(ROUTE_DIALOG_ITEM),
                    child: Obx(() => Text(
                          Get.find<OptionDialogItemController>().selectedValue.value,
                          style: context.textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Get.find<OptionDialogItemController>().selectedValue.value = '전체';
                        Get.find<OptionDialogItemController>().paramItemName.value = ''.tr;
                        Get.find<OptionDialogItemController>().paramItemCode.value = ''.tr;
                        Get.find<OptionDialogItemController>().paramCode = '';
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 24.sp,
                      )),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}

class OptionDialogItemController extends GetxController {
  RxString selectedValue = '전체'.obs;

  RxString paramItemCode = ''.tr.obs;
  RxString paramItemName = ''.tr.obs;

  String paramCode = '';

  @override
  void onInit() {
    super.onInit();
  }

  chooseItem(code, name) async {
    selectedValue.value = name;
    paramItemName.value = name;
    paramItemCode.value = code;
    paramCode = code;
  }
}
