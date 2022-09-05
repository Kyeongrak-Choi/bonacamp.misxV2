import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog_search/search_listview.dart';

import '../../../constants.dart';

class SearchOption extends StatelessWidget {
  var flag;
  var hint;
  var dummy;

  SearchOption(String flag){
    this.flag = flag;
    initVar(flag);
  }

  SearchListController listController = Get.put(SearchListController());

  @override
  Widget build(context) {

    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
            ),
          ),
        ),
        Container(
          width: 50,
          child: Center(
            child: GestureDetector(
              onTap: () {
                listController.search(dummy);
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  void initVar(flag){
    switch (flag) {
      case 'C':
        hint = 'hint_search_customer'.tr;
        dummy = dummy_customer;
        break;
      case 'P':
        hint = 'hint_search_product'.tr;
        dummy = dummy_product;
        break;
      default:
        hint = 'hint_search_customer'.tr;
        dummy = dummy_customer;
    }
  }
}

class SearchOptionController extends GetxController {
  FocusNode focusNode = FocusNode();
  var isFocus = true.obs;

  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
    focusNode.addListener(() {
      onFocusChange();
      update();
    });
  }

  void onFocusChange() {
    isFocus.value = !isFocus.value;
    update();
  }

  void unFocus() {
    focusNode.unfocus();
    update();
  }
}
