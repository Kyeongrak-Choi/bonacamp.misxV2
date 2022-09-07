import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog_search/search_listview.dart';
import 'package:renew_misx/components/common/dialog_search/search_option.dart';

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
        appBar: AppBar(title: Text(title)),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                //SizedBox(height: MediaQuery.of(context).viewPadding.top),
                SearchOption(flag), // C:거래처 검색 / P:품목 검색
                SizedBox(height: 14),
                Expanded(child: SearchList()),
              ],
            ),
          ),
        ));
  }

  void initVar(flag) {
    switch (flag) {
      case 'C':
        title = 'title_search_customer'.tr;
        break;
      case 'P':
        title = 'title_search_product'.tr;
        break;
      default:
        title = 'title_search_customer'.tr;
    }
  }
}
