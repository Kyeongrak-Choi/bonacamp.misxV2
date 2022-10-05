import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:misxV2/components/chart/line/title.dart';

import 'border.dart';
import 'grid.dart';
import 'line_bar.dart';
import 'line_touch.dart';

class ChartManager extends StatelessWidget {
  const ChartManager();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      chartDummy,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }
}

LineChartData get chartDummy => LineChartData(
      lineTouchData: lineTouchData,
      gridData: gridData,
      titlesData: titlesData,
      borderData: borderData,
      lineBarsData: lineBarsData,
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
    );
