import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/management/sales_daily_division_model.dart';

class SalesDailyDivisionItem extends StatelessWidget {
  var f = NumberFormat('###,###,###,###');
  var dataList;

  SalesDailyDivisionItem(var model) {
    dataList = generateSalesDailyDivisionList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.backgroundColor,
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 1000),
          children: dataList.map<ExpansionPanelRadio>((SalesDailyDivisionModel model) {
            return ExpansionPanelRadio(
              value: model.id.toString(),
              backgroundColor: context.theme.backgroundColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Row(
                  children: [
                    Text(
                      '[' + model.itemCode.toString() + ' ] ' + model.itemName.toString(),
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
                        '용도\n\n' + model.usageName.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '수량\n(BOX/EA)\n' + model.boxQuantity.toString() + ' / ' + model.bottleQuantity.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '총계\n(공+부+보증금)\n' + f.format(int.parse(model.amount.toString())),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
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
