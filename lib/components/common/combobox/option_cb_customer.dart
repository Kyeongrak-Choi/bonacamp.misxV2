import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
                      primary: context.theme.canvasColor,
                      //backgroundColor: context.theme.canvasColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'opt_customer'.tr,
                      style: context.textTheme.bodyText1,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: TextButton(
                  onPressed: () => Get.toNamed('/searchCustomer'),
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
  var selectedValue;

  @override
  void onInit() {
    super.onInit();
    selectedValue = 'all'.tr.obs;
  }

  chooseItem(code, name) async {
    selectedValue = RxString(name).value.obs;
  }
}
