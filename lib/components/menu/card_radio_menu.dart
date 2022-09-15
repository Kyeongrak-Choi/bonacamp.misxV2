import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renew_misx/constants.dart';

import '../../../theme.dart';
import 'menu_manager.dart';

class CardRadioMenu extends StatelessWidget {
  final List<RadioMenu> radioMenu;

  CardRadioMenu({required this.radioMenu});

  @override
  Widget build(BuildContext context) {
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
                  _buildRowItem(radioMenu[index].title, radioMenu[index].val)),
        ),
      ),
    );
  }

  Widget _buildRowItem(String title, bool val) {
    return Container(
      height: 50,
      color: Color(AppColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 각 위젯간의 공간을 둠
        children: [
          Text(
            title,
            style: textTheme().subtitle1,
          ),
          SizedBox(width: 20),
          Switch(
            activeColor: Colors.tealAccent,
            value: val,
            onChanged: (value) {
              val = value;
            },
          )
        ],
      ),
    );
  }
}
