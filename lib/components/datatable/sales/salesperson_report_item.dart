import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/sales/salesperson_report_model.dart';
import '../../common/field/show_list_detail_row.dart';
import '../../common/field/show_list_header_row.dart';

class SalesPersonReportItem extends StatelessWidget {
  var dataList;

  SalesPersonReportItem(var model) {
    dataList = generateSalesPersonReportList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.cardColor,
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
            ),
            onPressed: () {},
            child: ExpansionPanelList.radio(
              elevation: 0.0,
              animationDuration: Duration(milliseconds: 500),
              children: dataList.map<ExpansionPanelRadio>((SalesPersonReportModel model) {
                return ExpansionPanelRadio(
                  canTapOnHeader: true,
                  value: model.id.toString(),
                  backgroundColor: context.theme.cardColor,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ShowListHeaderRow(titleName: '', value: model.name.toString() ?? '');
                  },
                  body: Column(
                    children: [
                      ShowListDetailRow(
                        titleName: '매출액',
                        value: model.total.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '공급가',
                        value: model.price.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '합계\n(공급가 + 부가세)',
                        value: model.amount.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '입금합계',
                        value: model.deposit.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '채권잔액',
                        value: model.balance.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '매출이익',
                        value: model.margin.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '마진율',
                        value: model.marginRate.toString(),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
