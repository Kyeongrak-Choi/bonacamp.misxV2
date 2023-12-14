import 'package:flutter/material.dart';
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
            padding: EdgeInsetsDirectional.all(15),
            child: Text(
              'title_search_item'.tr,
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
                  onPressed: () => Get.toNamed(ROUTE_DIALOG_ITEM),
                  child: Obx(() => Text(
                        Get.find<OptionDialogItemController>().selectedValue.value,
                        style: context.textTheme.bodyMedium,
                      )),
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    Get.find<OptionDialogItemController>().selectedValue.value = 'all'.tr;
                    Get.find<OptionDialogItemController>().paramItemName.value = ''.tr;
                    Get.find<OptionDialogItemController>().paramItemCode.value = ''.tr;
                    Get.find<OptionDialogItemController>().paramCode = '';
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

class OptionDialogItemController extends GetxController {
  RxString selectedValue = 'all'.tr.obs;

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
