import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowListDetail extends StatelessWidget {
  String titleName;
  var value;

  ShowListDetail({required this.titleName, this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Container(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.backgroundColor,
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
