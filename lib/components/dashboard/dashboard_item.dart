import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog_search/search_listview.dart';
import 'package:renew_misx/theme.dart';

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
                style: textTheme().bodyText1,
              ),
            ),
            Expanded(
              child: Text(
                name,
                textAlign: TextAlign.right,
                style: textTheme().bodyText1,
              ),
            )
          ],
        )
      ],
    );
  }
}
