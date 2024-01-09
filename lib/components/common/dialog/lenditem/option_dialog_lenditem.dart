import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';

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
              Expanded(
                flex: 3,
                child: TextButton(
                  onPressed: () => Get.toNamed(ROUTE_DIALOG_LENDITM),
                  child: Obx(() => Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0.h, 0.w, 0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                            Get.find<OptionDialogLendItemController>()
                                .selectedValue
                                .value,
                            style: context.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
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
                      icon: Icon(Icons.cancel_outlined,size: 24.sp,)),
                ),
              ),
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
