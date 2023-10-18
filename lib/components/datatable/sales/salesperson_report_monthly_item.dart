import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/field/icon_title_field.dart';

import '../../../models/menu/sales/salesperson_report_monthly/salesperson_report_monthly_model.dart';
import '../../../utils/utility.dart';
import '../../common/field/show_list_header_row.dart';

class SalesPersonReportMonthlyItem extends StatelessWidget {
  var dataList;

  SalesPersonReportMonthlyItem(var model) {
    dataList = generateSalesPersonReportMonthlyList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((SalesPersonReportMonthlyModel model) {
            return ExpansionPanelRadio(
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(titleName: '', value: model.name.toString() ?? '');
              },
              body: Column(
                children: [
                  IconTitleField(
                    titleName: '합        계',
                    value: numberFormat.format(model.total ?? 0),
                    iconData: Icons.add_box_outlined,
                  ),
                  IconTitleField(
                    titleName: model.sales[0].getMonth,
                    value: numberFormat.format(model.sales[0].getAmount ?? 0),
                    iconData: Icons.calendar_month,
                  ),
                  IconTitleField(
                    titleName: model.sales[1].getMonth,
                    value: numberFormat.format(model.sales[1].getAmount ?? 0),
                    iconData: Icons.calendar_month,
                  ),
                  IconTitleField(
                    titleName: model.sales[2].getMonth,
                    value: numberFormat.format(model.sales[2].getAmount ?? 0),
                    iconData: Icons.calendar_month,
                  ),
                  IconTitleField(
                    titleName: model.sales[3].getMonth,
                    value: numberFormat.format(model.sales[3].getAmount ?? 0),
                    iconData: Icons.calendar_month,
                  ),
                  IconTitleField(
                    titleName: model.sales[4].getMonth,
                    value: numberFormat.format(model.sales[4].getAmount ?? 0),
                    iconData: Icons.calendar_month,
                  ),
                  IconTitleField(
                    titleName: model.sales[5].getMonth,
                    value: numberFormat.format(model.sales[5].getAmount ?? 0),
                    iconData: Icons.calendar_month,
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
