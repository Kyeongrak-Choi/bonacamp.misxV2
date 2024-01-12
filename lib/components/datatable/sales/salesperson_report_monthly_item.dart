import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/field/icon_title_field.dart';

import '../../../models/menu/sales/salesperson_report_monthly/salesperson_report_monthly_model.dart';
import '../../../utils/constants.dart';
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
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList
              .map<ExpansionPanelRadio>((SalesPersonReportMonthlyModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(
                    titleName: model.name ?? '', value: '');
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
                    IconTitleField(
                      titleName: '합        계',
                      value: numberFormat.format(model.total ?? 0) + ' 원',
                      iconData: Icons.add_box_outlined,
                    ),
                    IconTitleField(
                      titleName: model.sales[0].getMonth,
                      value: numberFormat.format(model.sales[0].getAmount ?? 0) + ' 원',
                      iconData: Icons.calendar_month,
                    ),
                    IconTitleField(
                      titleName: model.sales[1].getMonth,
                      value: numberFormat.format(model.sales[1].getAmount ?? 0) + ' 원',
                      iconData: Icons.calendar_month,
                    ),
                    IconTitleField(
                      titleName: model.sales[2].getMonth,
                      value: numberFormat.format(model.sales[2].getAmount ?? 0) + ' 원',
                      iconData: Icons.calendar_month,
                    ),
                    IconTitleField(
                      titleName: model.sales[3].getMonth,
                      value: numberFormat.format(model.sales[3].getAmount ?? 0) + ' 원',
                      iconData: Icons.calendar_month,
                    ),
                    IconTitleField(
                      titleName: model.sales[4].getMonth,
                      value: numberFormat.format(model.sales[4].getAmount ?? 0) + ' 원',
                      iconData: Icons.calendar_month,
                    ),
                    IconTitleField(
                      titleName: model.sales[5].getMonth,
                      value: numberFormat.format(model.sales[5].getAmount ?? 0) + ' 원',
                      iconData: Icons.calendar_month,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
