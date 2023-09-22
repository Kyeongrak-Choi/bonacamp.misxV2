import 'package:fl_chart/fl_chart.dart';

import 'title_bottom.dart';
import 'title_left.dart';

FlTitlesData get titlesData => FlTitlesData(
      // 하단 범례
      bottomTitles: AxisTitles(
        sideTitles: bottomTitles,
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      // 왼쪽 범례
      leftTitles: AxisTitles(
        sideTitles: leftTitles(),
        //sideTitles: SideTitles(showTitles: true),
      ),
    );
