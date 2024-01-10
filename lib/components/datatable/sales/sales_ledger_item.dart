import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/datatable/sales/sales_ledger_detail_item.dart';

import '../../../models/menu/sales/sales_ledger/sales_ledger_list_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/utility.dart';
import '../../common/field/show_list_header_row.dart';

class SalesLedgerItem extends StatelessWidget {
  var dataList;

  SalesLedgerItem(var model) {
    dataList =
        generateSalesLedgerListModelList(model.dateList, model.dateList.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children:
              dataList.map<ExpansionPanelRadio>((SalesLedgerListModel model) {
            return ExpansionPanelRadio(
                canTapOnHeader: true,
                value: model.id.toString(),
                backgroundColor: context.theme.cardColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ShowListHeaderRow(
                      titleName: changeStringToDateFormat(model.date ?? ''),
                      value: '채권잔액 ( ' +
                          numberFormat.format(model.balance) +
                          ' )');
                },
                body: Container(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h,
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h),
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
                                child: SalesLedgerDetailItem(model.details[idx]));
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
          flex: 4,
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
            '매출액',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '채권잔액',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
