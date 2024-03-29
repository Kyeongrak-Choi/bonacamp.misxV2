import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashBoardItem extends StatelessWidget {
  var code;
  var name;

  DashBoardItem(String code, String name) {
    this.code = code;
    this.name = name;
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Text(
                code,
                style: context.textTheme.displaySmall,
              ),
            ),
            Expanded(
              child: Text(
                name,
                textAlign: TextAlign.right,
                style: context.textTheme.displaySmall,
              ),
            )
          ],
        )
      ],
    );
  }
}
