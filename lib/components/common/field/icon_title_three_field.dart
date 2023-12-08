import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconTitleThreeField extends StatelessWidget {
  String titleName;
  var value1;
  var value2;
  var value3;
  IconData iconData;

  IconTitleThreeField({required this.titleName, this.value1, this.value2, this.value3, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(iconData, color: context.theme.primaryColor),
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 15),
          child: Text(
            titleName,
            style: context.textTheme.displaySmall,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 15),
          child: Text(
            value1,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 15),
          child: Text(
            value2,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 15),
          child: Text(
            value3,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
