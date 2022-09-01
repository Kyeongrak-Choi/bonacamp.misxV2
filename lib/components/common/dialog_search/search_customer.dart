import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog_search/search_listview.dart';
import 'package:renew_misx/components/common/dialog_search/search_option.dart';

class SearchCustomer extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
        // // Obx(()=>) 를 사용하면 count가 변경됐을 때 Text를 갱신할 수 있다.
        appBar: AppBar(title: Text('title_search_customer'.tr)),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
                //SizedBox(height: 20),
                SearchOption(),
                //SizedBox(height: 20),
                SearchList(),
              ],
            ),
          ),
        ));
  }
}
