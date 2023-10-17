import 'dart:ffi';

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
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     Expanded(
    //         flex: 2,
    //         child: Padding(
    //           padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //           child: Container(
    //             child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: context.theme.canvasColor,
    //                 ),
    //                 onPressed: () {},
    //                 child: Text(
    //                   title,
    //                   style: context.textTheme.displaySmall,
    //                 )),
    //           ),
    //         )),
    //     Expanded(
    //         flex: 4,
    //         child: Padding(
    //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //             child: TextButton(
    //               onPressed: () => Get.toNamed(route),
    //               child: Obx(() => Text(
    //                     Get.find<OptionDialogController>().selectedValue.value,
    //                     style: context.textTheme.displaySmall,
    //                   )),
    //             ))),
    //   ],
    // );

    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: context.textTheme.displayMedium,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 8,
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: TextButton(
                      onPressed: () => Get.toNamed(route),
                      child: Obx(() => Text(
                            Get.find<OptionDialogController>().selectedValue.value,
                            style: context.textTheme.displaySmall,
                          )),
                    ))),
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    Get.find<OptionDialogController>().selectedValue.value = 'all'.tr;
                    Get.find<OptionDialogController>().paramCustomerName.value = ''.tr;
                    Get.find<OptionDialogController>().paramCustomerCode.value = ''.tr;
                    Get.find<OptionDialogController>().paramCode ='';
                  },
                  icon: Icon(Icons.cancel_outlined, color: context.theme.primaryColor)),
            ),
            Expanded(
              flex: 1,
              child: IconButton(onPressed: () => Get.toNamed(route), icon: Icon(Icons.store_outlined, color: context.theme.primaryColor)),
            ),
          ],
        ),
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
