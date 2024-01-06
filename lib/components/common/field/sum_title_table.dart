import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SumTitleTable extends StatelessWidget {
  var titleName;

  SumTitleTable(titleName) {
    this.titleName = titleName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        child: Column(children: [
          Text(
            titleName ?? '',
            style: context.textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          Container(
              padding: EdgeInsets.zero,
              child:
                  Divider(color: context.theme.primaryColor, thickness: 0.5)),
        ]));
  }
}
