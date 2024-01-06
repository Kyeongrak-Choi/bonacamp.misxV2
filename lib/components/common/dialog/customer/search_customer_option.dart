import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/search_customer_listview.dart';
import 'package:misxV2/utils/constants.dart';

class SearchCustomerOption extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchCustomerListController());
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, 0.w, 0.h),
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: TextField(
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  //filled: true,
                  hintText: 'hint_search_customer'.tr,
                  hintStyle: context.textTheme.bodyMedium,
                ),
                onChanged: (text) {
                  Get.find<SearchCustomerListController>().setSearchTxt(text);
                },
                style: context.textTheme.bodyMedium),
          ),
          Flexible(
              flex: 1,
              child: Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.find<SearchCustomerListController>().search(context);
                    },
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class SearchOptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
  }
}
