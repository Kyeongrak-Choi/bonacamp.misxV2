import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'exam_table_item.dart';

class ExamTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ExamTableItem(), ExamTableItem(),ExamTableItem(), ExamTableItem(),ExamTableItem(), ExamTableItem()],
    );
  }
}

// class ExamTableController extends GetxController{
//   var expanded = false.obs;
//
//   stateChange() async {
//     expanded.value = !expanded.value;
//   }
// }
