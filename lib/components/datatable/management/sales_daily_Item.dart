import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/models/management/sales_class_status.dart';

import '../../../models/management/sales_daily_model.dart';


class SalesDailyItem extends StatelessWidget {
  var dataList;

  SalesDailyItem(var model){
    dataList = generateSalesDailyList(model,model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.backgroundColor,
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 1000),
          children: dataList.map<ExpansionPanelRadio>((SalesDailyDayMonthModel model) {
            return ExpansionPanelRadio(
              value: model.id.toString(),
              backgroundColor: context.theme.backgroundColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Row(
                  children: [
                    Text(
                      '[담당자] ' + model.employeeName.toString(),
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                );
              },
              body: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '공급가\n(일/월)\n' + model.supplementAmount_D.toString() + '  ' + model.supplementAmount_M.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '부가세\n(일/월)\n' + model.vatAmount_D.toString() + '  ' + model.vatAmount_D.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '보증금합계\n(일/월)\n' + model.guaranteeAmount_D.toString() + '  ' + model.guaranteeAmount_D.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '총계\n(일/월)\n' + model.totalAmount_D.toString() + '  ' + model.totalAmount_D.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '매출원가\n(일/월)\n' + model.purchaseCost_D.toString() + '  ' + model.purchaseCost_D.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '매출이익\n(일/월)\n' + model.profitAmount_D.toString() + '  ' + model.profitAmount_D.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '입금소계\n(일/월)\n' + model.depositCash_D.toString() + '  ' + model.depositCash_D.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '용공입금\n(일/월)\n' + model.depositEmptyCaseBottle_D.toString() + '  ' + model.depositEmptyCaseBottle_D.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),

                    ],
                  ),
                  Row(
                  children: [
                    Text(
                      '입금합계\n(일/월)\n' + model.depositAmount_D.toString() + '  ' + model.depositAmount_D.toString(),
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '채권잔액\n(일/월)\n' + model.bondBalance_D.toString() + '  ' + model.bondBalance_D.toString(),
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    ]
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
