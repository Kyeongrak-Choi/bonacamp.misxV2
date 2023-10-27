import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/purchase/search_purchase_listview.dart';

class SearchPurchaseOption extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchPurchaseListController());
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: 'hint_search_purchase'.tr,
                  hintStyle: context.textTheme.displaySmall,
                ),
                onChanged: (text) {
                  Get.find<SearchPurchaseListController>().setSearchTxt(text);
                },
                style: context.textTheme.displaySmall),
          ),
          Flexible(
              flex: 1,
              child: Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.find<SearchPurchaseListController>().search();
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

class SearchPurchaseOptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
  }
}
