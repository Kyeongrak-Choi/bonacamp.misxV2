import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';

class SearchCustomerListItem extends StatelessWidget {
  var code;
  var name;
  var sub;
  var stat;

  SearchCustomerListItem(String code, String name, String sub, String stat) {
    this.code = code;
    this.name = name;
    this.sub = sub;
    this.stat = stat;
  }

  @override
  Widget build(context) {
    Get.put(OptionDialogCustomerController());
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Future.delayed(const Duration(milliseconds: 100)).then((value){
          Get.find<OptionDialogCustomerController>().chooseItem(code, name);
          Get.back();
        });
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
