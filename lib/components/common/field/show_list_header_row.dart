import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowListHeaderRow extends StatelessWidget {
  String titleName;
  var value;

  ShowListHeaderRow({required this.titleName, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(30, 10, 10, 0),
      child: Text(
        titleName,
        style: context.textTheme.displayMedium,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
