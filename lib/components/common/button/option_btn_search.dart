import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/layouts/menu/management/sales_class_status.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../../layouts/example/menu_example.dart';
import '../../../layouts/menu/management/analysis_graph.dart';
import '../../../layouts/menu/management/customer_contribute.dart';
import '../../../layouts/menu/management/overall_status.dart';
import '../../../layouts/menu/management/sales_daily.dart';
import '../../../layouts/menu/management/salesperson_contribute.dart';
import '../../../utils/constants.dart';
import '../../../utils/theme/color_manager.dart';

class OptionBtnSearch extends StatelessWidget {
  var menu;

  OptionBtnSearch(String menu) {
    this.menu = menu;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MenuExampleController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Container(
            color: context.theme.backgroundColor,
            child: ElevatedButton(
                onPressed: () async {
                  ProgressDialog pd = ProgressDialog(context: context);
                  pd.show(max: 1000, msg: 'progress_search'.tr, backgroundColor: CommonColors.bluesky);

                  switch (menu) {
                    // 경영관리 - 종합현황
                    case ROUTE_MENU_OVERALL_STATUS:
                      await Get.find<OverAllController>().showResult();
                      Get.find<OverAllController>().setVisible();
                      break;
                    // 경영관리 - 영업일보
                    case ROUTE_MENU_SALES_DAILY:
                      await Get.find<SalesDailyController>().showResult();
                      Get.find<SalesDailyController>().setVisible();
                      break;
                    // 경영관리 - 영업사원별 기여현황
                    case ROUTE_MENU_SALESPERSON_CONTRIBUTE:
                      await Get.find<SalesPersonContributeController>().showResult();
                      Get.find<SalesPersonContributeController>().setVisible();
                      break;
                    // 경영관리 - 영업사원별 기여현황
                    case ROUTE_MENU_CLASSSTATUS:
                      await Get.find<SalesClassStatusController>().showResult();
                      Get.find<SalesClassStatusController>().setVisible();
                      break;
                   // 경영관리 - 매출처별 기여현황
                    case ROUTE_MENU_CONTRIBUTION_STATUS_CUSTOMER :
                      await Get.find<CustomerContributeController>().showResult();
                      Get.find<CustomerContributeController>().setVisible();
                      break;
                    // 경영관리 - 분석 그래프
                    case ROUTE_MENU_GRAPH:
                      await Get.find<AnalysisGraphController>().showResult();
                      Get.find<AnalysisGraphController>().setVisible();
                      break;
                  }

                  pd.close();
                },
                child: Icon(Icons.search, color: context.theme.primaryColor),
                style: ElevatedButton.styleFrom(
                  foregroundColor: CommonColors.white,
                  backgroundColor: context.theme.canvasColor,
                )),
          ),
        )),
      ],
    );
  }
}
