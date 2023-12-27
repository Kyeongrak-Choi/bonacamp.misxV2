import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/layouts/appframe/dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/common/chart_spot.dart';
import '../common/field/icon_title_field_dash.dart';

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
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 5, 15),
                      child: Text(
                        '최근 3개월 매출 추이',
                        // style: context.textTheme.titleLarge,
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 5, 15),
                      child: Text(
                        '(단위:천원)',
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        textAlign: TextAlign.end,
                      ),
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
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
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
