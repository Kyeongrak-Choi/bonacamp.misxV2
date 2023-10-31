import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SumItemTable extends StatelessWidget {
  var firstTitleName;
  var firstValue;

  var secTitleName;
  var secValue;

  SumItemTable(titleName, value, secTitleName, secValue) {
    this.firstTitleName = titleName;
    this.firstValue = value;
    this.secTitleName = secTitleName;
    this.secValue = secValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    firstTitleName ?? '',
                    style: context.textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    firstValue ?? '',
                    style: context.textTheme.titleSmall,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    secTitleName ?? '',
                    style: context.textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    secValue ?? '',
                    style: context.textTheme.titleSmall,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
