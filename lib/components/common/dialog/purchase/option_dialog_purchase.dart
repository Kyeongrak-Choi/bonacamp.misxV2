import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';

class OptionDialogPurchase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionDialogPurchaseController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.all(20),
            child: Text(
              'title_search_purchase'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 9,
                child: TextButton(
                  onPressed: () => Get.toNamed(ROUTE_DIALOG_PURCHASE),
                  child: Obx(() => Text(
                        Get.find<OptionDialogPurchaseController>().selectedValue.value,
                        style: context.textTheme.bodyMedium,
                      )),
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    Get.find<OptionDialogPurchaseController>().selectedValue.value = 'all'.tr;
                    Get.find<OptionDialogPurchaseController>().paramPurchaseName.value = ''.tr;
                    Get.find<OptionDialogPurchaseController>().paramPurchaseCode.value = ''.tr;
                    Get.find<OptionDialogPurchaseController>().paramCode = '';
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

class OptionDialogPurchaseController extends GetxController {
  RxString selectedValue = 'all'.tr.obs;

  RxString paramPurchaseName = ''.tr.obs;
  RxString paramPurchaseCode = ''.tr.obs;

  String paramCode = '';

  @override
  void onInit() {
    super.onInit();
  }

  chooseItem(code, name) async {
    selectedValue.value = name;
    paramPurchaseName.value = name;
    paramPurchaseCode.value = code;
    paramCode = code;
  }
}
