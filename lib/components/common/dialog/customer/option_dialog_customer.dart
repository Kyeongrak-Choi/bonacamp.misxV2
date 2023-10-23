import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';

class OptionDialogCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OptionDialogCustomerController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
            child: Text(
              'title_search_customer'.tr,
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
                  onPressed: () => Get.toNamed(ROUTE_DIALOG_CUSTOMER),
                  child: Obx(() => Text(
                        Get.find<OptionDialogCustomerController>().selectedValue.value,
                        style: context.textTheme.bodyMedium,
                      )),
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    Get.find<OptionDialogCustomerController>().selectedValue.value = 'all'.tr;
                    Get.find<OptionDialogCustomerController>().paramCustomerName.value = ''.tr;
                    Get.find<OptionDialogCustomerController>().paramCustomerCode.value = ''.tr;
                    Get.find<OptionDialogCustomerController>().paramCode = '';
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

class OptionDialogCustomerController extends GetxController {
  RxString selectedValue = 'all'.tr.obs;

  RxString paramCustomerName = ''.tr.obs;
  RxString paramCustomerCode = ''.tr.obs;

  String paramCode = '';

  @override
  void onInit() {
    super.onInit();
  }

  chooseItem(code, name) async {
    selectedValue.value = name;
    paramCustomerName.value = name;
    paramCustomerCode.value = code;
    paramCode = code;
  }
}
