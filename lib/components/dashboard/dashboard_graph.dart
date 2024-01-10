import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/layouts/appframe/dashboard.dart';
import 'package:misxV2/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/common/chart_spot.dart';

class DashboardGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
        builder: (DashBoardController controller) {
      return Container(
        color: context.theme.canvasColor,
        child: Padding(
          padding: EdgeInsets.all(BASIC_PADDING * 2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        BASIC_PADDING * 2, 0, BASIC_PADDING, BASIC_PADDING * 2),
                    child: Text(
                      'dashboard_graph_title'.tr,
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        BASIC_PADDING * 2, 0, BASIC_PADDING, BASIC_PADDING * 2),
                    child: Text(
                      'dashboard_graph_sub'.tr,
                      style: context.textTheme.bodyMedium?.copyWith(color: context.theme.colorScheme.onSurfaceVariant,),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SfCartesianChart(
                //title: ChartTitle(text: '최근 3개월 매출 추이\n(단위:천원)\n', textStyle: TextStyle(fontSize: 18.sp)),
                primaryXAxis: CategoryAxis(),
                // primaryYAxis: NumericAxis(title: AxisTitle(text: 'Sales')),
                // legend: Legend(
                //     isVisible: false,
                //     isResponsive: true,
                //     padding: 10.0,
                //     iconWidth: 15.0,
                //     iconHeight: 15.0,
                //     overflowMode: LegendItemOverflowMode.wrap,
                //     textStyle: context.textTheme.displaySmall),
                //tooltipBehavior: TooltipBehavior(enable: true, textStyle: context.textTheme.bodyLarge, color: context.theme.canvasColor,),
                series: <ChartSeries<ChartSpot, String>>[
                  // LineSeries<ChartSpot, String>(
                  //   name: 'sales'.tr,
                  //   dataSource: Get.find<DashBoardController>().salesList,
                  //   xValueMapper: (ChartSpot data, _) => data.name,
                  //   yValueMapper: (ChartSpot data, _) => data.value,
                  //   markerSettings: MarkerSettings(isVisible: true, height: 5, width: 5, borderWidth: 3),
                  // ),
                  // LineSeries<ChartSpot, String>(
                  //   name: '채권',
                  //   dataSource: Get.find<DashBoardController>().bondList,
                  //   xValueMapper: (ChartSpot data, _) => data.name,
                  //   yValueMapper: (ChartSpot data, _) => data.value,
                  // ),
                  //ColumnSeries(dataSource: dataSource, xValueMapper: xValueMapper, yValueMapper: yValueMapper),
                  ColumnSeries<ChartSpot, String>(
                    name: 'sales'.tr,
                    dataSource: Get.find<DashBoardController>().salesList,
                    xValueMapper: (ChartSpot data, _) => data.name,
                    yValueMapper: (ChartSpot data, _) => data.value,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    width: 0.2,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
