import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../layouts/menu/management/analysis_graph.dart';
import '../../layouts/menu/sales/customer_info.dart';
import '../../models/common/chart_spot.dart';
import '../chart/line/chart_manager.dart';

class CustomerInfoGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Padding(
          padding: EdgeInsets.only(right: 16.0, left: 6.0),
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: '단위:원'),
              legend: Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<ChartSpot, String>>[
                LineSeries<ChartSpot, String>(
                    dataSource: Get.find<CustomerInfoController>().spotListSales,
                    xValueMapper: (ChartSpot spots, _) => spots.name,
                    yValueMapper: (ChartSpot spots, _) => spots.value,
                    markerSettings: MarkerSettings(
                        isVisible: true,
                        height: 4,
                        width:  4,
                        borderWidth: 3,
                        borderColor: Colors.red),
                    name: '',
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                    )),
                LineSeries<ChartSpot, String>(
                    dataSource: Get.find<CustomerInfoController>().spotListBalance,
                    xValueMapper: (ChartSpot spots, _) => spots.name,
                    yValueMapper: (ChartSpot spots, _) => spots.value,
                    markerSettings: MarkerSettings(
                        isVisible: true,
                        height: 4,
                        width:  4,
                        borderWidth: 3,
                        borderColor: Colors.blue),
                    name: '',
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                    )),

              ])),
    );
  }
}
