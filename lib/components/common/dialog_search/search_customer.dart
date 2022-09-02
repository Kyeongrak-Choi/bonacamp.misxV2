import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog_search/search_listview.dart';
import 'package:renew_misx/components/common/dialog_search/search_option.dart';

class SearchCustomer extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: Text('title_search_customer'.tr)),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                //SizedBox(height: MediaQuery.of(context).viewPadding.top),
                SearchOption(),
                SizedBox(height: 10),
                Expanded(child: SearchList()),
              ],
            ),
          ),
        ));
  }
}
