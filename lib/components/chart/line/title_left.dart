import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.teal,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;

  text = value.toInt().toString();
  return Text(text, style: style, textAlign: TextAlign.center);
}

SideTitles leftTitles() => SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: true,
      interval: 100000,
      reservedSize: 50,
    );
