import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            padding: EdgeInsetsDirectional.fromSTEB(0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'title_search_customer'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            border: Border.all(color: context.theme.colorScheme.background),
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: TextButton(
                  onPressed: () => Get.toNamed(ROUTE_DIALOG_CUSTOMER),
                  child: Obx(() => Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0.h, 0.w, 0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                            Get.find<OptionDialogCustomerController>().selectedValue.value,
                            style: context.textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: IconButton(
                        onPressed: () {
                          Get.find<OptionDialogCustomerController>().selectedValue.value = '전체';
                          Get.find<OptionDialogCustomerController>().paramCustomerName.value = ''.tr;
                          Get.find<OptionDialogCustomerController>().paramCustomerCode.value = ''.tr;
                          Get.find<OptionDialogCustomerController>().paramCode = '';
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                        )),
                  ),
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: IconButton(onPressed: () => Get.toNamed(route), icon: Icon(Icons.store_outlined, color: context.theme.primaryColor)),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class OptionDialogCustomerController extends GetxController {
  RxString selectedValue = '전체'.obs;

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
