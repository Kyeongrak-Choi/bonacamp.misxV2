import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'option_dialog_purchase.dart';

class SearchPurchaseListItem extends StatelessWidget {
  var code;
  var name;
  var sub;
  var stat;

  SearchPurchaseListItem(String code, String name, String sub, String stat) {
    this.code = code;
    this.name = name;
    this.sub = sub;
    this.stat = stat;
  }

  @override
  Widget build(context) {
    Get.put(OptionDialogPurchaseController());
    return GestureDetector(
      onTap: () {
        Get.find<OptionDialogPurchaseController>().chooseItem(code, name);
        Get.back();
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '[' + code + '] ' + name,
                  style: context.textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  sub,
                  style: context.textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  stat,
                  textAlign: TextAlign.right,
                  style: context.textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}