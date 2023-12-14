import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/lenditem/search_lenditem_listview.dart';

class SearchLendItemOption extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchLendItemListController());
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
      //padding: EdgeInsets.zero,
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: 'hint_search_lenditem'.tr,
                  hintStyle: context.textTheme.displaySmall,
                ),
                onChanged: (text) {
                  Get.find<SearchLendItemListController>().setSearchTxt(text);
                },
                style: context.textTheme.displaySmall),
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
                      color: context.theme.primaryColor,
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
