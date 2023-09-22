import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class OptionDialog extends StatelessWidget {
  var flag;
  var title;
  var route;

  OptionDialog(String flag) {
    this.flag = flag;
    initVar(flag);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(OptionDialogController());
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
                      title,
                      style: context.textTheme.bodyLarge,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: TextButton(
                  onPressed: () => Get.toNamed(route),
                  child: Obx(() => Text(
                        Get.find<OptionDialogController>().selectedValue.value,
                        style: context.textTheme.bodyText1,
                      )),
                ))),
      ],
    );
  }

  void initVar(flag) {
    switch (flag) {
      case SEARCH_DIALOG_CUST:
        title = 'title_search_customer'.tr;
        route = ROUTE_DIALOG_CUSTOMER;
        break;
      case SEARCH_DIALOG_PRCH:
        title = 'title_search_purchase'.tr;
        route = ROUTE_DIALOG_PURCHASE;
        break;
      case SEARCH_DIALOG_ITEM:
        title = 'title_search_item'.tr;
        route = ROUTE_DIALOG_ITEM;
        break;
      case SEARCH_DIALOG_LEND:
        title = 'title_search_lenditem'.tr;
        route = ROUTE_DIALOG_LENDITM;
        break;
    }
  }
}

class OptionDialogController extends GetxController {
  RxString selectedValue = 'all'.tr.obs;

  String paramCode = '';

  @override
  void onInit() {
    super.onInit();
  }

  chooseItem(code, name) async {
    selectedValue.value = name;
    paramCode = code;
  }
}
