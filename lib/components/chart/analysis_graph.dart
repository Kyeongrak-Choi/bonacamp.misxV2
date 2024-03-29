import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../layouts/menu/management/analysis_graph.dart';
import '../../models/common/chart_spot.dart';

class AnalysisGraphComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnalysisGraphController>(
        builder: (AnalysisGraphController controller) {
      return Container(
        decoration: BoxDecoration(
          color: context.theme.cardColor,
        ),
        child: SfCartesianChart(
          title: ChartTitle(text: '단위:천원'),
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(),
          // primaryYAxis: NumericAxis(title: AxisTitle(text: 'Sales')),
          legend: Legend(
              isVisible: true,
              isResponsive: true,
              padding: 10.0,
              iconWidth: 15.0,
              iconHeight: 15.0,
              overflowMode: LegendItemOverflowMode.wrap,
              textStyle: context.textTheme.bodyMedium),

          tooltipBehavior: TooltipBehavior(
              enable: true,
              textStyle: context.textTheme.bodyMedium,
              color: context.theme.canvasColor),
          enableAxisAnimation: true,
          enableSideBySideSeriesPlacement: true,
          series: <ChartSeries<ChartSpot, String>>[
            LineSeries<ChartSpot, String>(
              name: '매출',
              dataSource: Get.find<AnalysisGraphController>().salesList,
              xValueMapper: (ChartSpot data, _) => data.name,
              yValueMapper: (ChartSpot data, _) => data.value,
              markerSettings: MarkerSettings(
                  isVisible: true, height: 5, width: 5, borderWidth: 10),
            ),
            LineSeries<ChartSpot, String>(
              name: '채권',
              dataSource: Get.find<AnalysisGraphController>().bondList,
              xValueMapper: (ChartSpot data, _) => data.name,
              yValueMapper: (ChartSpot data, _) => data.value,
              markerSettings: MarkerSettings(
                  isVisible: true, height: 5, width: 5, borderWidth: 10),
            ),
            LineSeries<ChartSpot, String>(
              name: '매입',
              dataSource: Get.find<AnalysisGraphController>().purchaseList,
              xValueMapper: (ChartSpot data, _) => data.name,
              yValueMapper: (ChartSpot data, _) => data.value,
              markerSettings: MarkerSettings(
                  isVisible: true, height: 5, width: 5, borderWidth: 10),
            ),
            LineSeries<ChartSpot, String>(
              name: '채무',
              dataSource: Get.find<AnalysisGraphController>().debtList,
              xValueMapper: (ChartSpot data, _) => data.name,
              yValueMapper: (ChartSpot data, _) => data.value,
              markerSettings: MarkerSettings(
                  isVisible: true, height: 5, width: 5, borderWidth: 10),
            ),
            LineSeries<ChartSpot, String>(
              name: '대여금액',
              dataSource: Get.find<AnalysisGraphController>().rentalList,
              xValueMapper: (ChartSpot data, _) => data.name,
              yValueMapper: (ChartSpot data, _) => data.value,
              markerSettings: MarkerSettings(
                  isVisible: true, height: 5, width: 5, borderWidth: 10),
            ),
            LineSeries<ChartSpot, String>(
              name: '대여자산',
              dataSource: Get.find<AnalysisGraphController>().assetList,
              xValueMapper: (ChartSpot data, _) => data.name,
              yValueMapper: (ChartSpot data, _) => data.value,
              markerSettings: MarkerSettings(
                  isVisible: true, height: 5, width: 5, borderWidth: 10),
            ),
          ],
        ),
      );
    });
  }
}
