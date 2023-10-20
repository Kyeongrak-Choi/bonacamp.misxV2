import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/item/search_item_listview.dart';

class SearchItemOption extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchItemListController());
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: 'hint_search_item'.tr,
                  hintStyle: context.textTheme.displaySmall,
                ),
                onChanged: (text) {
                  Get.find<SearchItemListController>().setSearchTxt(text);
                },
                style: context.textTheme.displaySmall),
          ),
          Flexible(
              flex: 1,
              child: Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.find<SearchItemListController>().search();
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

class SearchItemOptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
  }
}
