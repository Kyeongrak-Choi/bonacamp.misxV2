import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

import '../../layouts/config/config.dart';
import '../../utils/constants.dart';
import '../../utils/menu_manager.dart';

class CardRadioMenu extends StatelessWidget {
  List<RadioMenu> radioMenu;

  CardRadioMenu({required this.radioMenu});

  @override
  Widget build(BuildContext context) {
    Get.put(OptionController());
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: EdgeInsets.all(BASIC_PADDING * 2),
        child: Column(
          children: List.generate(
            radioMenu.length,
            (index) => buildRowItem(radioMenu[index].id, radioMenu[index].title,
                radioMenu[index].val, context),
          ),
        ),
      ),
    );
  }

  Widget buildRowItem(String id, String title, bool val, BuildContext context) {
    var optValue;
    switch (id) {
      case KEY_THEME_MODE:
        optValue = Get.find<OptionController>().isDark;
        break;
      case KEY_SHOW_ADMOB:
        optValue = Get.find<OptionController>().isShowAdmob;
        break;
      case KEY_CUSTOM_FILTER:
        optValue = Get.find<OptionController>().isCustomFilter;
        break;
      case KEY_INCLUDE_SALCHRG:
        optValue = Get.find<OptionController>().isIncludeSalChrgCd;
        break;
      case KEY_COMPARE_FIRST:
        optValue = Get.find<OptionController>().isCompareFirst;
        break;
    }

    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.bodyLarge,
          ),
          Obx(() => Switch(
              activeColor: CommonColors.green,
              value: optValue.value,
              onChanged: (value) {
                switch (id) {
                  case KEY_THEME_MODE:
                    Get.find<OptionController>().changeTheme(value);
                    break;
                  case KEY_SHOW_ADMOB:
                  case KEY_CUSTOM_FILTER:
                  case KEY_INCLUDE_SALCHRG:
                  case KEY_COMPARE_FIRST:
                    Get.find<OptionController>().changeOption(id, value);
                    break;
                }
              })),
        ],
      ),
    );
  }
}
