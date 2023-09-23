import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowListHeader extends StatelessWidget {
  String titleName;
  var value;

  ShowListHeader({required this.titleName, this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 5, 10),
          child: Container(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.canvasColor,
                ),
                onPressed: () {},
                child: Text(
                  titleName + '\n' + value,
                  style: context.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                )),
          ),
        ));
  }
}
