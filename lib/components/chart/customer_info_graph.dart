import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../layouts/menu/sales/customer_info.dart';
import '../../models/common/chart_spot.dart';

class CustomerInfoGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10,
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(
            text: '단위:원',
            textStyle: context.textTheme.labelSmall,
          ),
          legend: Legend(
            isVisible: true,
            isResponsive: true,
            padding: 10.0,
            iconWidth: 15.0,
            iconHeight: 15.0,
            overflowMode: LegendItemOverflowMode.wrap,
            textStyle: context.textTheme.displaySmall,
            alignment: ChartAlignment.center,
            position: LegendPosition.top,
          ),
          tooltipBehavior: TooltipBehavior(enable: true, textStyle: context.textTheme.displaySmall, color: context.theme.canvasColor),
          series: <ChartSeries<ChartSpot, String>>[
            StackedLineSeries<ChartSpot, String>(
              dataSource: Get.find<CustomerInfoController>().spotListSales,
              xValueMapper: (ChartSpot spots, _) => spots.name,
              yValueMapper: (ChartSpot spots, _) => spots.value,
              markerSettings: MarkerSettings(isVisible: true, height: 5, width: 5, borderWidth: 10),
              name: 'sales'.tr,
            ),
            StackedLineSeries<ChartSpot, String>(
              dataSource: Get.find<CustomerInfoController>().spotListBalance,
              xValueMapper: (ChartSpot spots, _) => spots.name,
              yValueMapper: (ChartSpot spots, _) => spots.value,
              markerSettings: MarkerSettings(isVisible: true, height: 5, width: 5, borderWidth: 10),
              name: '채권',
            ),
          ]),
    );
  }
}
