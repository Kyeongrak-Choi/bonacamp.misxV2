import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/combobox/option_combobox.dart';
import 'package:renew_misx/components/common/datepicker/option_period_picker.dart';
import 'package:renew_misx/components/common/option_visible_manager.dart';
import 'package:renew_misx/components/dashboard/dashboard_chart.dart';
import 'package:renew_misx/components/dashboard/dashboard_purchase.dart';
import 'package:renew_misx/components/dashboard/dashboard_rental.dart';
import 'package:renew_misx/components/dashboard/dashboard_sales.dart';

import 'common/dialog/search_dialog.dart';

// 예제 화면
class MenuExample extends StatelessWidget {

  @override
  Widget build(context) {
    Get.put(MenuExampleController());
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text('매출원장 Exam'),
            actions: [
              IconButton(
                icon: OptionVisibleManager(),
                onPressed: () => null,
              ),
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Visibility(
                  visible: Get.find<MenuExampleController>().visible.value,
                  child: Column(
                    children: [
                      OptionPeriodPicker(),
                      OptionCombobox(),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      DashBoardSales(),
                      DashBoardSales(),
                      DashBoardSales(),
                      DashBoardSales(),
                      DashBoardSales(),
                      DashBoardSales(),
                      DashBoardSales(),
                      DashBoardSales(),
                      DashBoardSales(),
                      DashBoardSales(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class MenuExampleController extends GetxController {
  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
    update();
  }
}
