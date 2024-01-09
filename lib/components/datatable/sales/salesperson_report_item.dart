import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/menu/sales/salesperson_report_model.dart';
import '../../../utils/constants.dart';
import '../../common/field/icon_title_field.dart';
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
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList
              .map<ExpansionPanelRadio>((SalesPersonReportModel model) {
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
                      titleName: '매출액',
                      value: model.total + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '공급가',
                      value: model.price + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '합계\n(공급가 + 부가세)',
                      value: model.amount + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '입금합계',
                      value: model.deposit + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '채권잔액',
                      value: model.balance + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '매출이익',
                      value: model.margin + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '마진율',
                      value: model.marginRate.toString() + ' %',
                      iconData: Icons.label_outlined,
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
