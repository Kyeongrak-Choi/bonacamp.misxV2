import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/management/sales_daily_model.dart';
import '../../common/field/show_list_detail_row.dart';
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
                  ShowListDetailRow(
                    titleName: '',
                    value: '( 일 / 월 )',
                  ),
                  ShowListDetailRow(
                    titleName: '공급가',
                    value: model.supplementAmount_D.toString() + '\n' + model.supplementAmount_M.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '부가세',
                    value: model.vatAmount_D.toString() + '\n' + model.vatAmount_M.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '보증금합계',
                    value: model.guaranteeAmount_D.toString() + '\n' + model.guaranteeAmount_M.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '총계',
                    value: model.totalAmount_D.toString() + '\n' + model.totalAmount_M.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '매출원가',
                    value: model.purchaseCost_D.toString() + '\n' + model.purchaseCost_M.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '매출이익',
                    value: model.profitAmount_D.toString() + '\n' + model.profitAmount_M.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '입금소계',
                    value: model.depositCash_D.toString() + '\n' + model.depositCash_M.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '용공입금',
                    value: model.depositEmptyCaseBottle_D.toString() + '\n' + model.depositEmptyCaseBottle_M.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '입금합계',
                    value: model.depositAmount_D.toString() + '\n' + model.depositAmount_M.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '채권잔액',
                    value: model.bondBalance_D.toString() + '\n' + model.bondBalance_M.toString(),
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
