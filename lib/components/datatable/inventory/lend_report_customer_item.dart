import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/inventory/lend_report_customer_model.dart';
import '../../common/field/show_list_header_row.dart';
import 'lend_report_customer_detail_item.dart';

class LendReportCustomerItem extends StatelessWidget {
  var dataList;

  LendReportCustomerItem(var model) {
    dataList = generateLendReportCustomerModelList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((LendReportCustomerModel model) {
            return ExpansionPanelRadio(
                value: model.id.toString(),
                backgroundColor: context.theme.cardColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ShowListHeaderRow(titleName: model.name, value: '');
                },
                body: Column(
                  children: [
                    LendReportCustomerListHead(context),
                    SizedBox(height: 14),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.detailList.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return Container(
                              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0), child: LendReportCustomerDetailItem(model.detailList[idx]));
                        }),
                  ],
                ));
          }).toList(),
        ),
      ),
    );
  }

  Widget LendReportCustomerListHead(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            '용기공병',
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Text(
                '전일재고',
                textAlign: TextAlign.center,
                style: context.textTheme.displayMedium,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '입용기',
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '공용기',
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '공병',
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
