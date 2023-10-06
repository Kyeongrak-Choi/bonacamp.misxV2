import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom: BorderSide(color: CommonColors.chartborder, width: 5),
      left: BorderSide(color: CommonColors.chartborder, width: 5),
      right: BorderSide(color: CommonColors.chartborder, width: 5),
      top: BorderSide(color: CommonColors.chartborder, width: 5),
    ));
