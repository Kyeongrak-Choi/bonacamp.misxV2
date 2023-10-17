import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconTitleField extends StatelessWidget {
  String titleName;
  var value;
  IconData iconData;

  IconTitleField({required this.titleName, this.value, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(iconData, color: context.theme.primaryColor),
      Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
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
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: Text(
            value,
            style: context.textTheme.displaySmall,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
