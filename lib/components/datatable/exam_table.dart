import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'exam_table_item.dart';

class ExamTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: Container(
            color: context.theme.backgroundColor,
            child: ExamTableItem(),
          ),
        ),
      ],
    );
  }
}