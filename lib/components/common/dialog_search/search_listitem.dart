import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog_search/search_listview.dart';

class SearchListItem extends StatelessWidget {
  var code;
  var name;
  var sub;
  var stat;

  SearchListItem(String code, String name, String sub, String stat) {
    this.code = code;
    this.name = name;
    this.sub = sub;
    this.stat = stat;
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 60,
              child: Text(
                '[' + code + ']',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              child: Text(sub),
            ),
            Expanded(
              child: Text(
                stat,
                textAlign: TextAlign.right,
              ),
            )
          ],
        )
      ],
    );
  }
}
