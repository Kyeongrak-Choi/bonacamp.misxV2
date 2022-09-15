import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renew_misx/theme.dart';

import '../../../layouts/menu_example.dart';
import '../combobox/option_cb_customer.dart';

class SearchListItem extends StatelessWidget {
  var code;
  var name;
  var sub;
  var stat;

  SearchListItem(String code, String name, String sub, String stat) {
    this.code = code;
    this.name = name;
    this.sub = sub;
    this.stat = stat;
  }

  @override
  Widget build(context) {
    Get.put(CbCustomerController());
    return GestureDetector(
      onTap: (){
        Get.find<CbCustomerController>().chooseItem(code,name);
        Get.back();
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  '[' + code + '] ' + name,
                  style: textTheme().bodyText2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: Text(
                  sub,
                  style: textTheme().bodyText2,
                ),
              ),
              Expanded(
                child: Text(
                  stat,
                  textAlign: TextAlign.right,
                  style: textTheme().bodyText2,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
