import 'package:fl_chart/fl_chart.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

LineTouchData get lineTouchData => LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: CommonColors.chartborder,
      ),
    );
