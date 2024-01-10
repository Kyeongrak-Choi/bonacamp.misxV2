import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/lenditem/search_lenditem_listview.dart';

import '../../../../utils/constants.dart';

class SearchLendItemOption extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchLendItemListController());
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, 0.w, BASIC_PADDING * 2.h),
      //padding: EdgeInsets.zero,
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: TextField(
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  // filled: true,
                  hintText: 'hint_search_lenditem'.tr,
                  hintStyle: context.textTheme.bodyMedium,
                ),
                onChanged: (text) {
                  Get.find<SearchLendItemListController>().setSearchTxt(text);
                },
                style: context.textTheme.bodyMedium),
          ),
          Flexible(
              flex: 1,
              child: Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.find<SearchLendItemListController>().search(context);
                    },
                    child: Icon(
                      Icons.search,
                      size: 24.sp,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class SearchLendItemOptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
  }
}
