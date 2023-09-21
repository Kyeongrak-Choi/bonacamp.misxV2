import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/models/management/sales_class_status.dart';


class SalesClassStatusItem extends StatelessWidget {
  var dataList;

  SalesClassStatusItem(var model){
    dataList = generateList(model,model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.backgroundColor,
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 1000),
          children: dataList!.map<ExpansionPanelRadio>((SalesClassStatusModel model) {
            return ExpansionPanelRadio(
              value: model.salesClassCode.toString(),
              backgroundColor: context.theme.backgroundColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Row(
                  children: [
                    Text(
                      '판매유형\n\n' + model.salesClassName.toString(),
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'BOX\n\n' + model.boxQuantity.toString(),
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'EA\n\n' + model.bottleQuantity.toString(),
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '매출액\n\n' + model.totalAmount.toString(),
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
              body: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '매출공급가\n\n' + model.supplementAmount.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '매출원가\n\n' + model.purchaseAmount.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '마진액\n\n' + model.profitAmount.toString(),
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '마진률\n\n' + model.profitRate.toString(),
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
