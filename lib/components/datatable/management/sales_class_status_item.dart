import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/field/show_list_detail.dart';
import 'package:misxV2/components/common/field/show_list_header.dart';
import 'package:misxV2/models/management/sales_class_status.dart';

import '../../common/field/show_list_detail_row.dart';
import '../../common/field/show_list_header_row.dart';

class SalesClassStatusItem extends StatelessWidget {
  var dataList;

  SalesClassStatusItem(var model) {
    dataList = generateList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 1000),
          children: dataList!.map<ExpansionPanelRadio>((SalesClassStatusModel model) {
            return ExpansionPanelRadio(
              value: model.salesClassCode.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(titleName: '', value: model.salesClassName.toString());
              },
              body: Column(
                children: [
                    ShowListDetailRow(
                      titleName: 'BOX',
                      value: model.boxQuantity.toString(),
                    ),
                    ShowListDetailRow(
                      titleName: 'BOX',
                      value: model.boxQuantity.toString(),
                    ),
                    ShowListDetailRow(
                      titleName: '매출액',
                      value: model.totalAmount.toString(),
                    ),
                  ShowListDetailRow(
                    titleName: '매출공급가',
                    value: model.supplementAmount.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '매출원가',
                    value: model.purchaseAmount.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '마진액',
                    value: model.profitAmount.toString(),
                  ),
                  ShowListDetailRow(
                    titleName: '마진율',
                    value: model.profitRate.toString(),
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
