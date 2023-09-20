import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class OptionDialogCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbCustomerController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
              child: Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.canvasColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'opt_customer'.tr,
                      style: context.textTheme.bodyLarge,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: TextButton(
                  onPressed: () => Get.toNamed(ROUTE_DIALOG_CUSTOMER),
                  child: Obx(() => Text(
                        Get.find<CbCustomerController>().selectedValue.value,
                        style: context.textTheme.bodyText1,
                      )),
                ))),
      ],
    );
  }
}

class CbCustomerController extends GetxController {
  RxString selectedValue = 'all'.tr.obs;
  RxString paramCustomerName = ''.tr.obs;
  RxString paramCustomerCode = ''.tr.obs;

  @override
  void onInit() {
    super.onInit();
  }

  chooseItem(code, name) async {
    selectedValue.value = name;
    paramCustomerName.value = name;
    paramCustomerCode.value = code;
  }
}
