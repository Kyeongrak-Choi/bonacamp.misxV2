import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconTitleFieldSmallInterval extends StatelessWidget {
  String titleName;
  var value;
  IconData iconData;

  IconTitleFieldSmallInterval({required this.titleName, this.value, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(iconData, color: context.theme.primaryColor),
      Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 15),
          child: Text(
            titleName,
            style: context.textTheme.displaySmall,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 15),
          child: Text(
            value,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    ]);
  }
}
