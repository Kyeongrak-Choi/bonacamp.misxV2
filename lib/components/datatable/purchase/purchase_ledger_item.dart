import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/datatable/purchase/purchase_ledger_detail_item.dart';

import '../../../models/menu/purchase/purchase_ledger/purchase_ledger_list_model.dart';
import '../../../utils/constants.dart';
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
        color: context.theme.canvasColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((PurchaseLedgerListModel model) {
            return ExpansionPanelRadio(
                canTapOnHeader: true,
                value: model.id.toString(),
                backgroundColor: context.theme.canvasColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ShowListHeaderRow(
                      titleName: changeStringToDateFormat(model.date ?? ''), value: '채무잔액 ( ' + numberFormat.format(model.balance) + ' )');
                },
                body: Container(
                  padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
                  color: context.theme.colorScheme.background,
                  child: Column(
                    children: [
                      ledgerListHead(context),
                      SizedBox(height: BASIC_PADDING.h),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.details.length,
                          itemBuilder: (BuildContext ctx, int idx) {
                            return Container(
                                padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0.h, BASIC_PADDING.w, 0.h),
                                child: PurchaseLedgerDetailItem(model.details[idx]));
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
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Text(
            '',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '매입액',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '채무잔액',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
