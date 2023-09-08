import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/button/option_btn_mymenu.dart';
import 'package:misxV2/components/common/button/option_btn_search.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/combobox/option_cb_customer.dart';
import 'package:misxV2/components/common/combobox/option_cb_manage.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/datepicker/option_period_picker.dart';

import '../../components/datatable/exam_table.dart';

// 예제 화면
class MenuExample extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(MenuExampleController());
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text('매출원장 Exam'),
            backgroundColor: context.theme.backgroundColor,
            iconTheme: context.theme.iconTheme,
            actions: [
              IconButton(
                icon: OptionBtnVisible(),
                onPressed: () => null,
              ),
              IconButton(
                icon: OptionBtnMyMenu(),
                onPressed: () => null,
              ),
            ],
          ),
          body: Container(
            color: context.theme.backgroundColor,
            child: Column(
              children: [
                Visibility(
                  visible: Get.find<MenuExampleController>().visible.value,
                  child: Column(
                    children: [
                      OptionPeriodPicker(),
                      OptionDialogCustomer(),
                      //OptionCbNode(),
                      OptionCbEmployee(),
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
  }
}
