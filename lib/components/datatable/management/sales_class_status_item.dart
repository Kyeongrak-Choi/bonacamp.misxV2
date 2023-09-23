import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/field/show_list_detail.dart';
import 'package:misxV2/components/common/field/show_list_header.dart';
import 'package:misxV2/models/management/sales_class_status.dart';

class SalesClassStatusItem extends StatelessWidget {
  var dataList;

  SalesClassStatusItem(var model) {
    dataList = generateList(model, model.length);
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
                    ShowListHeader(
                        titleName: '판매유형',
                        value:  model.salesClassName.toString()),
                  ],
                );
              },
              body: Column(
                children: [
                  Row(
                    children: [
                      ShowListDetail(
                          titleName: 'BOX',
                          value:  model.boxQuantity.toString()),
                      ShowListDetail(
                          titleName: 'EA',
                          value:  model.bottleQuantity.toString()),
                      ShowListDetail(
                          titleName: '매출액',
                          value:  model.totalAmount.toString()),
                  ]),
                  Row(
                    children: [
                      ShowListDetail(
                          titleName: '매출공급가',
                          value:  model.supplementAmount.toString()),
                      ShowListDetail(
                          titleName: '매출원가',
                          value:  model.purchaseAmount.toString()),
                      ShowListDetail(
                          titleName: '마진액',
                          value:  model.profitAmount.toString()),
                      ShowListDetail(
                          titleName: '마진율',
                          value:  model.profitRate.toString()),
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
