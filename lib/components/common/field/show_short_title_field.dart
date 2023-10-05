import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowShortTitleField extends StatelessWidget {
  String titleName;
  var value;

  ShowShortTitleField({required this.titleName, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
            child: Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.canvasColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    titleName,
                    style: context.textTheme.displayMedium,
                  )),
            ),
          )),
      Expanded(
        flex: 7,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
          child: Text(
            value,
            style: context.textTheme.displayMedium,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    ]);
  }
}
