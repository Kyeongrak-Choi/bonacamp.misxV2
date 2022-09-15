import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renew_misx/utils/constants.dart';
import 'package:renew_misx/utils/theme/theme_manager.dart';

import '../../../layouts/common/dialog/search_dialog.dart';
import '../../../utils/theme/text_theme.dart';

class OptionCbCustomer extends StatelessWidget {
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
                        // primary: Colors.blueAccent,
                        // onPrimary: Colors.white,
                        ),
                    onPressed: () {},
                    child: Text(
                      'opt_customer'.tr,
                      style: textThemeDark().bodyText1,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: TextButton(
                  onPressed: () => Get.to(SearchDialog('C')),
                  child: Obx(() => Text(
                        Get.find<CbCustomerController>().selectedValue.value,
                        style: textThemeDark().bodyText1,
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  chooseItem(code, name) async {
    selectedValue = RxString(name).value.obs;

    refresh();
    update();
  }

}
