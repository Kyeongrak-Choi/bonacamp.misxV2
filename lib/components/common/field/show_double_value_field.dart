import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDoubleValueField extends StatelessWidget {
  String? titleName = '';
  var firstValue;
  var secondValue;

  ShowDoubleValueField(titleName, firstValue, secondValue) {
    this.titleName = titleName;
    this.firstValue = firstValue;
    this.secondValue = secondValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
            child: Container(
              child: titleName != null
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.theme.canvasColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        titleName!,
                        style: context.textTheme.bodyText1,
                      ))
                  : null,
            ),
          )),
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 5),
          child: firstValue != null
              ? Text(
                  firstValue,
                  style: context.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                )
              : null,
        ),
      ),
      Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 5),
          child: secondValue != null
              ? Text(
                  secondValue,
                  style: context.textTheme.bodyText1,
                  textAlign: TextAlign.right,
                )
              : null,
        ),
      ),
    ]);
  }
}
