import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: CommonColors.charttextcolor,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  Widget text;
  var title = value.toInt().toString().substring(4, 6) + '월';

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
