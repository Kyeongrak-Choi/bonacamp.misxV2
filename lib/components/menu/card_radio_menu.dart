import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:renew_misx/utils/constants.dart';
import '../../main.dart';
import '../../utils/theme/text_theme.dart';
import '../../utils/theme/theme_manager.dart';
import 'menu_manager.dart';

class CardRadioMenu extends StatelessWidget {
  final List<RadioMenu> radioMenu;

  CardRadioMenu({required this.radioMenu});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    Get.put(SwtichController());
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: Color(AppColor),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
              radioMenu.length,
              (index) =>
                  buildRowItem(radioMenu[index].title, radioMenu[index].val)),
        ),
      ),
    );
  }

  Widget buildRowItem(String title, bool val) {
    return Container(
      height: 50,
      color: Color(AppColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 각 위젯간의 공간을 둠
        children: [
          Text(
            title,
            style: textThemeDark().subtitle1,
          ),
          SizedBox(width: 20),
          Obx(() => Switch(
              activeColor: Colors.tealAccent,
              value: Get.find<SwtichController>().flag.value,
              onChanged: (value) {
                Get.find<SwtichController>().toggle();
              })),
        ],
      ),
    );
  }
}

class SwtichController extends GetxController {
  final data = GetStorage();

  var flag = false.obs;
  // bool test = data.read('darkmode');

  void toggle() {
    flag.value = !flag.value;

    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      log('1');
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      log('2');
    }
  }
}
