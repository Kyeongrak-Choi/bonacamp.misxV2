import 'package:flutter/material.dart';
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
            padding: EdgeInsetsDirectional.all(15),
            child: Text(
              'title_search_lenditem'.tr,
              textAlign: TextAlign.start,
              style: textThemeCommon().bodyMedium,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 9,
                child: TextButton(
                  onPressed: () => Get.toNamed(ROUTE_DIALOG_LENDITM),
                  child: Obx(() => Text(
                        Get.find<OptionDialogLendItemController>().selectedValue.value,
                        style: context.textTheme.bodyMedium,
                      )),
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    Get.find<OptionDialogLendItemController>().selectedValue.value = 'all'.tr;
                    Get.find<OptionDialogLendItemController>().paramLendItemName.value = ''.tr;
                    Get.find<OptionDialogLendItemController>().paramLendItemCode.value = ''.tr;
                    Get.find<OptionDialogLendItemController>().paramCode = '';
                  },
                  icon: Icon(Icons.cancel_outlined, color: context.theme.primaryColor)),
            ),
            // Expanded(
            //   flex: 1,
            //   child: IconButton(onPressed: () => Get.toNamed(route), icon: Icon(Icons.store_outlined, color: context.theme.primaryColor)),
            // ),
          ],
        ),
      ],
    );
  }
}

class OptionDialogLendItemController extends GetxController {
  RxString selectedValue = 'all'.tr.obs;

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
