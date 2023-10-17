import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/management/sales_daily_model.dart';
import '../../common/field/icon_title_two_field.dart';
import '../../common/field/show_list_header_row.dart';

class SalesDailyItem extends StatelessWidget {
  var dataList;

  SalesDailyItem(var model) {
    dataList = generateSalesDailyList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((SalesDailyDayMonthModel model) {
            return ExpansionPanelRadio(
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(titleName: '', value: model.employeeName.toString());
              },
              body: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                      child: Text(
                        '(일 금액 / 월 금액)',
                        textAlign: TextAlign.right,
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  IconTitleTwoField(
                    titleName: '공급가',
                    value1: model.supplementAmount_D,
                    value2: model.supplementAmount_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '부가세',
                    value1: model.vatAmount_D,
                    value2: model.vatAmount_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '보증금합계',
                    value1: model.guaranteeAmount_D,
                    value2: model.guaranteeAmount_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '총계',
                    value1: model.totalAmount_D,
                    value2: model.totalAmount_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '매출원가',
                    value1: model.purchaseCost_D,
                    value2: model.purchaseCost_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '매출이익',
                    value1: model.profitAmount_D,
                    value2: model.profitAmount_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '입금소계',
                    value1: model.depositCash_D,
                    value2: model.depositCash_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '용공입금',
                    value1: model.depositEmptyCaseBottle_D,
                    value2: model.depositEmptyCaseBottle_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '입금합계',
                    value1: model.depositAmount_D,
                    value2: model.depositAmount_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '채권잔액',
                    value1: model.bondBalance_D,
                    value2: model.bondBalance_M,
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
