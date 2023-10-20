import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common/dialog/item/search_item_listview.dart';
import '../../components/common/dialog/item/search_item_option.dart';
import '../../components/common/dialog/purchase/search_purchase_listview.dart';

class SearchItemDialog extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchPurchaseListController());
    return Scaffold(
        appBar: AppBar(
          title: Text('title_search_item'.tr),
          backgroundColor: context.theme.cardColor,
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
        ));
  }
}
