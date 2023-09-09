import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/search_listview.dart';

import '../../../utils/constants.dart';

class SearchOption extends StatelessWidget {
  var flag;
  var hint;
  var dummy;

  SearchOption(String flag) {
    this.flag = flag;
    //initVar(flag);
  }

  @override
  Widget build(context) {
    Get.put(SearchListController());
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: hint,
                  hintStyle: context.textTheme.bodyText1,
                ),
                style: context.textTheme.bodyText1),
          ),
          Flexible(
              flex: 1,
              child: Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.find<SearchListController>().search(dummy);
                    },
                    child: Icon(
                      Icons.search,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  // void initVar(flag) {
  //   switch (flag) {
  //     case SEARCH_DIALOG_CUST:
  //       hint = 'hint_search_customer'.tr;
  //       dummy = DUMMY_CUST;
  //       break;
  //     case SEARCH_DIALOG_ITEM:
  //       hint = 'hint_search_item'.tr;
  //       dummy = DUMMY_ITEM;
  //       break;
  //     case SEARCH_DIALOG_LEND:
  //       hint = 'hint_search_lenditem'.tr;
  //       dummy = DUMMY_LEND;
  //       break;
  //   }
  //}
}

class SearchOptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
  }
}
