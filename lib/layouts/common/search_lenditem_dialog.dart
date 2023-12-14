import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common/dialog/lenditem/search_lenditem_listview.dart';
import '../../components/common/dialog/lenditem/search_lenditem_option.dart';
import '../../components/common/dialog/purchase/search_purchase_listview.dart';
import '../../utils/constants.dart';

class SearchLendItemDialog extends StatelessWidget {
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
            title: Text('title_search_lenditem'.tr),
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
                  SearchLendItemOption(),
                  SizedBox(height: 14),
                  Expanded(child: SearchLendItemList()),
                ],
              ),
            ),
          )),
    );
  }
}
