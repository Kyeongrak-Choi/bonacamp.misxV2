import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog_search_customer/search_customer_listview.dart';
import 'package:renew_misx/components/common/dialog_search_customer/search_customer_option.dart';

class Search_Customer extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      // // Obx(()=>) 를 사용하면 count가 변경됐을 때 Text를 갱신할 수 있다.
      //appBar: AppBar(title: Text('title_search_customer'.tr)),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            //SizedBox(height: 20),
            Search_Customer_Option(),
            //SizedBox(height: 20),
            Search_Customer_ListView(),
          ],
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: ListView(
      //     children: [
      //       SizedBox(height: MediaQuery.of(context).viewPadding.top),
      //       SizedBox(height: 20),
      //       Search_Customer_Option(),
      //       SizedBox(height: 20),
      //       Search_Customer_ListView(),
      //     ],
      //   ),
      // ),
    );
  }
}
