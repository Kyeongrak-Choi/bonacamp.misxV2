import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/management/sales_daily_model.dart';
import '../../../models/menu/sales/sales_rental_ledger_model.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/icon_title_two_field.dart';
import '../../common/field/show_list_header_row.dart';

class SalesRentalLedgerItem extends StatelessWidget {
  var dataList;

  SalesRentalLedgerItem(var model) {
    dataList = generateSalesRentalLedgerList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((SalesRentalLedgerModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(titleName: changeStringToDateFormat(model.salesDate ?? ''), value: '채권 + 대여금\n(' + model.totalBalance + ')');
              },
              body: Column(
                children: [
                  model.memo != null ? IconTitleField(
                    titleName: '설명',
                    value: model.memo,
                    iconData: Icons.label_outlined,
                  ) : Text(""),
                  IconTitleField(
                    titleName: '매출액',
                    value: model.total,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '공급가',
                    value: model.price,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '공급가 + 부가세',
                    value: model.amount,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '입금액',
                    value: model.deposit,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '채권잔액',
                    value: model.balance,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '대여금(장기)',
                    value: model.longRent,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '대여금(단기)',
                    value: model.shortRent,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '대여금(합계)',
                    value: model.totalRent,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '채권 + 대여금',
                    value: model.totalBalance,
                    iconData: Icons.label_outlined,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
