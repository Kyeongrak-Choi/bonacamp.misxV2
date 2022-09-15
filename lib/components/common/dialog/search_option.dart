import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog/search_listview.dart';
import 'package:renew_misx/utils/theme/theme_manager.dart';
import '../../../utils/constants.dart';
import '../../../utils/theme/text_theme.dart';

class SearchOption extends StatelessWidget {
  var flag;
  var hint;
  var dummy;

  SearchOption(String flag) {
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
                // fillColor: Color(AppColor),
                hintText: hint,
                hintStyle: textThemeDark().bodyText1,
              ),
              style: textThemeDark().bodyText1),
        ),
        Container(
          width: 70,
          child: Center(
            child: GestureDetector(
              onTap: () {
                listController.search(dummy);
              },
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  void initVar(flag) {
    switch (flag) {
      case 'C':
        hint = 'hint_search_customer'.tr;
        dummy = dummy_customer;
        break;
      case 'P':
        hint = 'hint_search_product'.tr;
        dummy = dummy_product;
        break;
    }
  }
}

class SearchOptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
  }
}
