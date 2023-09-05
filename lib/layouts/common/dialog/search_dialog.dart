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
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: context.theme.backgroundColor,
          iconTheme: context.theme.iconTheme,
        ),
        backgroundColor: context.theme.backgroundColor,
        body: Container(
          color: context.theme.backgroundColor,
          child: Center(
            child: Column(
              children: <Widget>[
                SearchOption(flag), // C:거래처 검색 / P:품목 검색 / L:용공 검색
                SizedBox(height: 14),
                Expanded(child: SearchList()),
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
      case SEARCH_DIALOG_ITEM:
        title = 'title_search_item'.tr;
        break;
      case SEARCH_DIALOG_LEND:
        title = 'title_search_lenditem'.tr;
        break;
    }
  }
}
