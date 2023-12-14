import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsetsDirectional.all(5),
                  child: Text(
                    titleName,
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5,5,50,5),
                  child: Text(
                    value + ' 원 ',
                    style: context.textTheme.headlineLarge,
                    textAlign: TextAlign.end,
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    ]);
  }
}
