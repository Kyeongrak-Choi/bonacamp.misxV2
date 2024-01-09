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
            textStyle: context.textTheme.labelSmall,
          ),
          legend: Legend(
            isVisible: true,
            isResponsive: true,
            padding: 5.0,
            iconWidth: 10.0,
            iconHeight: 10.0,
            overflowMode: LegendItemOverflowMode.wrap,
            textStyle: context.textTheme.bodyMedium,
            alignment: ChartAlignment.center,
            position: LegendPosition.top,
          ),
          tooltipBehavior: TooltipBehavior(
              enable: true,
              textStyle: context.textTheme.bodyMedium,
              color: context.theme.canvasColor),
          series: <ChartSeries<ChartSpot, String>>[
            StackedLineSeries<ChartSpot, String>(
              dataSource: Get.find<CustomerInfoController>().spotListSales,
              xValueMapper: (ChartSpot spots, _) => spots.name,
              yValueMapper: (ChartSpot spots, _) => spots.value,
              markerSettings: MarkerSettings(
                  isVisible: true, height: 5, width: 5, borderWidth: 5),
              name: 'sales'.tr,
            ),
            StackedLineSeries<ChartSpot, String>(
              dataSource: Get.find<CustomerInfoController>().spotListBalance,
              xValueMapper: (ChartSpot spots, _) => spots.name,
              yValueMapper: (ChartSpot spots, _) => spots.value,
              markerSettings: MarkerSettings(
                  isVisible: true, height: 5, width: 5, borderWidth: 5),
              name: '채권',
            ),
          ]),
    );
  }
}
