import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../layouts/config.dart';
import '../../main.dart';
import 'menu_manager.dart';

class CardRadioMenu extends StatelessWidget {
  final List<RadioMenu> radioMenu;
  final optionBox = Hive.box('OPTION');

  CardRadioMenu({required this.radioMenu});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeModeController());
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
            (index) => buildRowItem(
                radioMenu[index].title, radioMenu[index].val, context),
          ),
        ),
      ),
    );
  }

  Widget buildRowItem(String title, bool val, BuildContext context) {
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
              value: Get.find<ThemeModeController>().isDark.value,
              onChanged: (value) {
                Get.find<ThemeModeController>().changeTheme(value);
              })),
        ],
      ),
    );
  }
}
