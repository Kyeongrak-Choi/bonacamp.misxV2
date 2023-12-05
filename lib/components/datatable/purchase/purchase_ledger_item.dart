import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/datatable/purchase/purchase_ledger_detail_item.dart';

import '../../../models/menu/purchase/purchase_ledger/purchase_ledger_list_model.dart';
import '../../../utils/utility.dart';
import '../../common/field/show_list_header_row.dart';

class PurchaseLedgerItem extends StatelessWidget {
  var dataList;

  PurchaseLedgerItem(var model) {
    dataList = generatePurchaseLedgerListModelList(model.dateList, model.dateList.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((PurchaseLedgerListModel model) {
            return ExpansionPanelRadio(
                value: model.id.toString(),
                backgroundColor: context.theme.cardColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ShowListHeaderRow(
                      titleName: changeStringToDateFormat(model.date ?? ''), value: '채무잔액 ( ' + numberFormat.format(model.balance) + ' )');
                },
                body: Container(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: Column(
                    children: [
                      ledgerListHead(context),
                      SizedBox(height: 14),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.details.length,
                          itemBuilder: (BuildContext ctx, int idx) {
                            return Container(
                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0), child: PurchaseLedgerDetailItem(model.details[idx]));
                          }),
                    ],
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }

  Widget ledgerListHead(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              '',
              textAlign: TextAlign.center,
              style: context.textTheme.displayMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              '매입액',
              textAlign: TextAlign.right,
              style: context.textTheme.displayMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              '채무잔액',
              textAlign: TextAlign.right,
              style: context.textTheme.displayMedium,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
