import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SumTitleTable extends StatelessWidget {
  var titleName;

  SumTitleTable(titleName){
    this.titleName = titleName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Column(
            children: [
              Text(
                titleName ?? '',
                style: context.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              Container(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
            ]));
  }
}
