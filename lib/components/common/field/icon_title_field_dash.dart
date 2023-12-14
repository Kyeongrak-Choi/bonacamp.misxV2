import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/theme/text_theme.dart';

class IconTitleFieldDash extends StatelessWidget {
  String titleName;
  var value;
  IconData iconData;

  IconTitleFieldDash({required this.titleName, this.value, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      //Icon(iconData, color: context.theme.primaryColor),
      Expanded(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  titleName,
                  style: textThemeCommon().bodyLarge,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  value + ' 원 ',
                  style: context.textTheme.bodyLarge,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ),
      ),

    ]);
  }
}
