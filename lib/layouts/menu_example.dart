import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/datepicker/option_period_picker.dart';
import 'package:renew_misx/components/menu/card_radio_menu.dart';
import '../components/common/datepicker/option_date_picker.dart';
import '../components/menu/card_icon_menu.dart';
import '../components/menu/menu_manager.dart';
import '../constants.dart';

// 예제 화면
class MenuExample extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: Text('매출원장 Exam')),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                OptionPeriodPicker(),
                SizedBox(height: 14),
                OptionDatePicker(),
                //Expanded(child: SearchList()),
              ],
            ),
          ),
        ));
  }
}
