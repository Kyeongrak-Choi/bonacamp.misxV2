import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowListHeaderRow extends StatelessWidget {
  String titleName;
  var value;

  ShowListHeaderRow({required this.titleName, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Text(
          titleName,
          style: context.textTheme.displayMedium,
          textAlign: TextAlign.left,
        ),
      ),
      Expanded(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.cardColor,
            ),
            onPressed: () {},
            child: Text(
              value,
              style: context.textTheme.displayMedium,
              textAlign: TextAlign.center,
            )),
      ),
    ]);
  }
}
