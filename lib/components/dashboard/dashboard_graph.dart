import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/layouts/appframe/dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/common/chart_spot.dart';

class DashboardGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (DashBoardController controller) {
      return Container(
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SfCartesianChart(
            title: ChartTitle(text: '최근 3개월 매출 추이\n(단위:천원)\n', textStyle: context.textTheme.labelLarge),
            primaryXAxis: CategoryAxis(),
            // primaryYAxis: NumericAxis(title: AxisTitle(text: 'Sales')),
            legend: Legend(
                isVisible: false,
                isResponsive: true,
                padding: 10.0,
                iconWidth: 15.0,
                iconHeight: 15.0,
                overflowMode: LegendItemOverflowMode.wrap,
                textStyle: context.textTheme.displaySmall),
            tooltipBehavior: TooltipBehavior(enable: true, textStyle: context.textTheme.displaySmall, color: context.theme.canvasColor),
            series: <ChartSeries<ChartSpot, String>>[
              LineSeries<ChartSpot, String>(
                name: 'sales'.tr,
                dataSource: Get.find<DashBoardController>().salesList,
                xValueMapper: (ChartSpot data, _) => data.name,
                yValueMapper: (ChartSpot data, _) => data.value,
                markerSettings: MarkerSettings(isVisible: true, height: 5, width: 5, borderWidth: 10),
              ),
              // LineSeries<ChartSpot, String>(
              //   name: '채권',
              //   dataSource: Get.find<DashBoardController>().bondList,
              //   xValueMapper: (ChartSpot data, _) => data.name,
              //   yValueMapper: (ChartSpot data, _) => data.value,
              // ),
            ],
          ),
        ),
      );
    });
  }
}
