import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common/dialog/purchase/search_purchase_listview.dart';
import '../../components/common/dialog/purchase/search_purchase_option.dart';

class SearchPurchaseDialog extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchPurchaseListController());
    return Scaffold(
        appBar: AppBar(
          title: Text('title_search_purchase'.tr),
          backgroundColor: context.theme.cardColor,
          iconTheme: context.theme.iconTheme,
        ),
        backgroundColor: context.theme.cardColor,
        body: Container(
          color: context.theme.cardColor,
          child: Center(
            child: Column(
              children: <Widget>[
                SearchPurchaseOption(),
                SizedBox(height: 14),
                Expanded(child: SearchPurchaseList()),
              ],
            ),
          ),
        ));
  }
}
