import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconTitleTwoField extends StatelessWidget {
  String titleName;
  var value1;
  var value2;
  IconData iconData;

  IconTitleTwoField({required this.titleName, this.value1, this.value2, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(iconData, color: context.theme.primaryColor),
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
          child: Text(
            titleName,
            style: context.textTheme.displaySmall,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
          child: Text(
            value1,
            style: context.textTheme.displaySmall,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
          child: Text(
            value2,
            style: context.textTheme.displaySmall,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
