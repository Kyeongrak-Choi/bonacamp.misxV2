import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/item/search_item_listview.dart';

import '../../../../utils/constants.dart';

class SearchItemOption extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchItemListController());
    return Container(
      color: context.theme.canvasColor,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, 0.w, BASIC_PADDING * 2.h),
        child: Row(
          children: [
            Flexible(
              flex: 7,
              child: TextField(
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    //filled: true,
                    hintText: 'hint_search_item'.tr,
                    hintStyle: context.textTheme.bodyMedium,
                  ),
                  onChanged: (text) {
                    Get.find<SearchItemListController>().setSearchTxt(text);
                  },
                  style: context.textTheme.bodyMedium),
            ),
            Flexible(
                flex: 1,
                child: Container(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.find<SearchItemListController>().search(context);
                      },
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Icon(
                          Icons.search,
                        ),
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

class SearchItemOptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
  }
}
