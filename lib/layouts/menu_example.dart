import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/button/option_btn_search.dart';
import 'package:renew_misx/components/common/combobox/option_cb_customer.dart';
import 'package:renew_misx/components/common/combobox/option_cb_manage.dart';
import 'package:renew_misx/components/common/combobox/option_cb_sale.dart';
import 'package:renew_misx/components/common/combobox/option_cb_workspace.dart';
import 'package:renew_misx/components/common/datepicker/option_period_picker.dart';
import 'package:renew_misx/components/common/button/option_btn_visible.dart';
import 'package:renew_misx/components/dashboard/dashboard_chart.dart';
import 'package:renew_misx/components/dashboard/dashboard_purchase.dart';
import 'package:renew_misx/components/dashboard/dashboard_rental.dart';
import 'package:renew_misx/components/dashboard/dashboard_sales.dart';

import '../components/datatable/exam_table.dart';
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
                icon: OptionBtnVisible(),
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
                      OptionCbWorkspace(),
                      OptionCbCustomer(),
                      OptionCbSale(),
                      OptionCbManage(),
                      OptionBtnSearch(),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ExamTable(),
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
