import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../layouts/config/menu_config.dart';
import '../../main.dart';
import 'menu_manager.dart';

class CardRadioMenu extends StatelessWidget {
  List<RadioMenu> radioMenu;

  CardRadioMenu({required this.radioMenu});

  @override
  Widget build(BuildContext context) {
    Get.put(OptionController());

    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: context.theme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
      case 'isDark':
        optValue = Get.find<OptionController>().isDark.value;
        break;
      case 'isCustomFilter':
        optValue = Get.find<OptionController>().isCustomFilter.value;
        break;
      case 'isIncludeSalChrgCd':
        optValue = Get.find<OptionController>().isIncludeSalChrgCd.value;
        break;
      case 'isCompareFirst':
        optValue = Get.find<OptionController>().isCompareFirst.value;
        break;
    }

    return Container(
      height: 50,
      color: context.theme.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 각 위젯간의 공간을 둠
        children: [
          Text(
            title,
            style: context.textTheme.subtitle2,
          ),
          SizedBox(width: 20),
          Obx(() => Switch(
              activeColor: Colors.tealAccent,
              value: optValue,
              onChanged: (value) {
                switch (id) {
                  case 'isDark':
                    Get.find<OptionController>().changeTheme(value);
                    break;
                  case 'isCustomFilter':
                  case 'isIncludeSalChrgCd':
                  case 'isCompareFirst':
                    log('id : ' + id + ' / value : ' + value.toString());
                    Get.find<OptionController>().changeOption(id, value);
                    break;
                }
              })),
        ],
      ),
    );
  }
}
