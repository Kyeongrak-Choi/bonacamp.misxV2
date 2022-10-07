import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chart/line/chart_manager.dart';

class DashBoardChart2 extends StatelessWidget {
  // dummy
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        // decoration: const BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(18)),
        //   gradient: LinearGradient(
        //     colors: [
        //       Color(0xff2c274c),
        //       Color(0xff46426c),
        //     ],
        //     begin: Alignment.bottomCenter,
        //     end: Alignment.topCenter,
        //   ),
        // ),
        decoration: BoxDecoration(
          color: context.theme.canvasColor,
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
                  'bonacamp',
                  style: context.textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 6.0),
                        child: ChartManager())),
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