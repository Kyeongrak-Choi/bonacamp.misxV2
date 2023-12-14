import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common/dialog/item/search_item_listview.dart';
import '../../components/common/dialog/item/search_item_option.dart';
import '../../components/common/dialog/purchase/search_purchase_listview.dart';
import '../../utils/constants.dart';

class SearchItemDialog extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchPurchaseListController());
    return WillPopScope(
      onWillPop: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        await Future.delayed(const Duration(milliseconds: 100));
        Get.back();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('title_search_item'.tr),
            titleTextStyle: context.textTheme.displayLarge,
            backgroundColor: context.theme.canvasColor,
            iconTheme: context.theme.iconTheme,

          ),
          backgroundColor: context.theme.cardColor,
          body: Container(
            color: context.theme.cardColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  SearchItemOption(),
                  SizedBox(height: 14),
                  Expanded(child: SearchItemList()),
                ],
              ),
            ),
          )),
    );
  }
}
