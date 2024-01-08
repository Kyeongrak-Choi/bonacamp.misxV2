import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/purchase/search_purchase_listview.dart';

import '../../../../utils/constants.dart';

class SearchPurchaseOption extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchPurchaseListController());
    return Container(
      color: context.theme.canvasColor,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, 0.w, BASIC_PADDING * 2.h),
        child: Row(
          children: [
            Flexible(
              flex: 7,
              child: TextField(
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    //filled: true,
                    hintText: 'hint_search_purchase'.tr,
                    hintStyle: context.textTheme.bodyMedium,
                  ),
                  onChanged: (text) {
                    Get.find<SearchPurchaseListController>().setSearchTxt(text);
                  },
                  style: context.textTheme.bodyMedium),
            ),
            Flexible(
                flex: 1,
                child: Container(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.find<SearchPurchaseListController>().search(context);
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
      ),
    );
  }
}

class SearchPurchaseOptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
  }
}
