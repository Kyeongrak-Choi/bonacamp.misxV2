import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog_search/search_listview.dart';

class SearchOption extends StatelessWidget {
  //SearchOptionController optionController = Get.put(SearchOptionController());
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
                    fillColor: Colors.grey[100],
                    hintText: 'hint_search_customer'.tr,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              width: 50,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    listController.search();
                  },
                  child: Text(
                    'search'.tr,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        );
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
