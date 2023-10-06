import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/common/dialog/search_listview.dart';
import '../../../components/common/dialog/search_option.dart';
import '../../../utils/constants.dart';

class SearchDialog extends StatelessWidget {
  var flag;
  var title;

  SearchDialog(String flag) {
    this.flag = flag;
    initVar(flag);
  }

  @override
  Widget build(context) {
    Get.put(SearchListController());
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: context.theme.cardColor,
          iconTheme: context.theme.iconTheme,
        ),
        backgroundColor: context.theme.cardColor,
        body: Container(
          color: context.theme.cardColor,
          child: Center(
            child: Column(
              children: <Widget>[
                SearchOption(flag),
                SizedBox(height: 14),
                Expanded(child: SearchList(flag)),
              ],
            ),
          ),
        ));
  }

  void initVar(flag) {
    switch (flag) {
      case SEARCH_DIALOG_CUST:
        title = 'title_search_customer'.tr;
        break;
      case SEARCH_DIALOG_PRCH:
        title = 'title_search_purchase'.tr;
        break;
      case SEARCH_DIALOG_ITEM:
        title = 'title_search_item'.tr;
        break;
      case SEARCH_DIALOG_LEND:
        title = 'title_search_lenditem'.tr;
        break;
    }
  }
}
