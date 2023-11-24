import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/search_customer_option.dart';

import '../../components/common/dialog/customer/search_customer_listview.dart';

class SearchCustomerDialog extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(SearchCustomerListController());
    return WillPopScope(
      onWillPop: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        await Future.delayed(const Duration(milliseconds: 100));
        Get.back();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('title_search_customer'.tr),
            backgroundColor: context.theme.cardColor,
            iconTheme: context.theme.iconTheme,
          ),
          backgroundColor: context.theme.cardColor,
          body: Container(
            color: context.theme.cardColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  SearchCustomerOption(),
                  SizedBox(height: 14),
                  Expanded(child: SearchCustomerList()),
                ],
              ),
            ),
          )),
    );
  }
}
