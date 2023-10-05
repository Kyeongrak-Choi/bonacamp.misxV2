import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chart/line/chart_manager.dart';

class AnalysisGraphComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  //'단위 : 1,000',
                  '',
                  style: context.textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(child: Padding(padding: EdgeInsets.only(right: 16.0, left: 6.0), child: ChartManager())),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            // IconButton(
            //   icon: Icon(
            //     Icons.refresh,
            //     color: Colors.white.withOpacity(1.0),
            //   ),
            //   onPressed: () {},
            // )
          ],
        ),
      ),
    );
  }
}
