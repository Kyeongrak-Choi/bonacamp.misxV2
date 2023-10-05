import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowListDetailRow extends StatelessWidget {
  String titleName;
  var value;

  ShowListDetailRow({required this.titleName, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  titleName,
                  style: context.textTheme.titleSmall,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  value,
                  style: context.textTheme.bodyLarge,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ]
      )
    );
  }
}
