import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

import '../../../layouts/menu/management/analysis_graph.dart';

List<LineChartBarData> get lineBarsData => [
      lineChartBarData
      // lineChartBarData_2,
    ];

LineChartBarData get lineChartBarData => LineChartBarData(
      isCurved: true,
      color: CommonColors.chartbar,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: true),
      spots: Get.find<AnalysisGraphController>().spotList,
    );
