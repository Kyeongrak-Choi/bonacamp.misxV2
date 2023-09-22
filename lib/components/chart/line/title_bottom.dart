import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );
  Widget text;
  var title = value.toInt().toString().substring(2, 4) + '년' + value.toInt().toString().substring(5, 6) + '월';

  text = Text(title.toString(), style: style);

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 20,
    child: text,
  );
}

SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      reservedSize: 50,
      interval: 1,
      getTitlesWidget: bottomTitleWidgets,
    );
