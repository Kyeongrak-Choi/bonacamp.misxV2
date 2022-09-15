import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'exam_table_item.dart';

class ExamTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExamTableItem(),
      ],
    );
  }
}