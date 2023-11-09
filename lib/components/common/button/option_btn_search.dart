import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/layouts/menu/management/sales_class_status.dart';
import 'package:misxV2/layouts/menu/sales/achievement.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../../layouts/menu/location/vendor_location.dart';
import '../../../layouts/menu/management/analysis_graph.dart';
import '../../../layouts/menu/management/customer_contribute.dart';
import '../../../layouts/menu/management/overall_status.dart';
import '../../../layouts/menu/management/sales_daily.dart';
import '../../../layouts/menu/management/sales_daily_division.dart';
import '../../../layouts/menu/management/sales_rank.dart';
import '../../../layouts/menu/management/salesperson_contribute.dart';
import '../../../layouts/menu/purchase/purchase_ledger.dart';
import '../../../layouts/menu/purchase/purchase_report.dart';
import '../../../layouts/menu/sales/balance_rental_report.dart';
import '../../../layouts/menu/sales/balance_report.dart';
import '../../../layouts/menu/sales/customer_info.dart';
import '../../../layouts/menu/sales/customer_report.dart';
import '../../../layouts/menu/sales/customer_report_monthly.dart';
import '../../../layouts/menu/sales/sales_ledger.dart';
import '../../../layouts/menu/sales/sales_rental_ledger.dart';
import '../../../layouts/menu/sales/salesperson_report.dart';
import '../../../layouts/menu/sales/salesperson_report_monthly.dart';
import '../../../utils/constants.dart';
import '../../../utils/theme/color_manager.dart';

class OptionBtnSearch extends StatelessWidget {
  var menu;

  OptionBtnSearch(String menu) {
    this.menu = menu;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
          child: Container(
            color: CommonColors.bluesky,
            height: 40,
            child: ElevatedButton(
                onPressed: () async {
                  ProgressDialog pd = ProgressDialog(context: context);
                  pd.show(max: 1000, msg: 'progress_search'.tr, backgroundColor: CommonColors.bluesky);

                  try {
                    switch (menu) {
                      // 경영분석 - 종합현황
                      case ROUTE_MENU_OVERALL_STATUS:
                        await Get.find<OverAllController>().showResult();
                        break;

                      // 경영분석 - 영업일보
                      case ROUTE_MENU_SALES_DAILY:
                        await Get.find<SalesDailyController>().showResult();
                        break;

                      // 경영분석 - 영업사원별 기여현황
                      case ROUTE_MENU_SALESPERSON_CONTRIBUTE:
                        await Get.find<SalesPersonContributeController>().showResult();
                        break;

                      // 경영분석 - 매출처별 기여현황
                      case ROUTE_MENU_CONTRIBUTION_STATUS_CUSTOMER:
                        await Get.find<CustomerContributeController>().showResult();
                        break;

                      // 경영분석 - 판매분류별 현황
                      case ROUTE_MENU_CLASSSTATUS:
                        await Get.find<SalesClassStatusController>().showResult();
                        break;

                      // 경영분석 - 매출순위현황
                      case ROUTE_MENU_RANKSTATUS:
                        await Get.find<SalesRankController>().showResult();
                        break;

                      // 경영분석 - 분석 그래프
                      case ROUTE_MENU_GRAPH:
                        await Get.find<AnalysisGraphController>().showResult();
                        break;

                      // 경영분석 - 영업일보 (용도별)
                      case ROUTE_MENU_DIVISIONSTATUS:
                        await Get.find<SalesDailyDivisionController>().showResult();
                        await Get.find<SalesDailyDivisionController>().calBoxBottleSum();
                        break;

                      // 위치조회 - 매출처 위치조회
                      case ROUTE_MENU_VENDORLOCATION:
                        await Get.find<VendorLocationController>().showResult();
                        break;

                      // 영업분석 - 매출처 현황
                      case ROUTE_MENU_CUSTOMER_INFO:
                        await Get.find<CustomerInfoController>().showResult();
                        break;

                      // 영업분석 - 영업사원별 매출현황
                      case ROUTE_MENU_SALESPERSON_REPORT:
                        await Get.find<SalesPersonReportController>().showResult();
                        break;

                      // 영업분석 - 영업사원별 월별 매출현황
                      case ROUTE_MENU_SALESPERSON_REPORT_MONTHLY:
                        await Get.find<SalesPersonReportMonthlyController>().showResult();
                        break;

                      // 영업분석 - 매출현황
                      case ROUTE_MENU_CUSTOMER_REPORT:
                        await Get.find<CustomerReportController>().showResult();
                        break;

                      // 영업분석 - 월별 매출현황
                      case ROUTE_MENU_CUSTOMER_REPORT_MONTHLY:
                        await Get.find<CustomerReportMonthlyController>().showResult();
                        break;
                        
                      // 영업분석 - 매출원장
                      case ROUTE_MENU_SALES_LEDGER:
                        await Get.find<SalesLedgerController>().showResult();
                        break;
                       
                      // 영업분석 - 목표대비 실적현황
                      case ROUTE_MENU_ACHIEVEMENT:
                        await Get.find<AchievementController>().showResult();
                        break;

                      // 영업분석 - 채권현황
                      case ROUTE_MENU_BALANCE_REPORT:
                        await Get.find<BalanceReportController>().showResult();
                        break;

                      // 영업분석 - 채권 및 대여 현황
                      case ROUTE_MENU_BALANCE_RENTAL_REPORT:
                        await Get.find<BalanceRentalReportController>().showResult();
                        break;

                      // 영업분석 - 매출 및 대여 원장
                      case ROUTE_MENU_SALES_RENTAL_LEDGER:
                        await Get.find<SalesRentalLedgerController>().showResult();
                        break;

                      // 매입분석 - 매입현황
                      case ROUTE_MENU_PURCHASE_REPORT:
                        await Get.find<PurchaseReportController>().showResult();
                        break;

                      // 매입분석 - 매입원장
                      case ROUTE_MENU_PURCHASE_LEDGER:
                        await Get.find<PurchaseLedgerController>().showResult();
                        break;
                    }
                  } catch (e) {
                    pd.close();
                  }

                  pd.close();
                },
                child: Icon(Icons.search, color: context.theme.primaryColor),
                style: ElevatedButton.styleFrom(
                  foregroundColor: CommonColors.white,
                  backgroundColor: CommonColors.bluesky,
                )),
          ),
        )),
      ],
    );
  }
}
