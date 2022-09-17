import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:misxV2/utils/constants.dart';
import 'package:misxV2/utils/theme/theme_manager.dart';

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
                  onPressed: () => Get.to(SearchDialog('C')),
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
    update();
  }
}
