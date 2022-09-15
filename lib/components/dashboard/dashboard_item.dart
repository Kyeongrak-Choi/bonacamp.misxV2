import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:renew_misx/utils/theme/theme_manager.dart';

import '../../utils/theme/text_theme.dart';

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
                style: textThemeDark().bodyText1,
              ),
            ),
            Expanded(
              child: Text(
                name,
                textAlign: TextAlign.right,
                style: textThemeDark().bodyText1,
              ),
            )
          ],
        )
      ],
    );
  }
}
