import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/management/sales_daily_division_model.dart';
import '../../common/field/show_list_detail_row.dart';
import '../../common/field/show_list_header_row.dart';

class SalesDailyDivisionItem extends StatelessWidget {
  var f = NumberFormat('###,###,###,###');
  var dataList;

  SalesDailyDivisionItem(var model) {
    dataList = generateSalesDailyDivisionList(model, model.length);
    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i].itemCode == null) {
        dataList.removeAt(i);
        i--;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.cardColor,
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
            ),
            onPressed: () {},
            child: ExpansionPanelList.radio(
              animationDuration: Duration(milliseconds: 500),
              children: dataList.map<ExpansionPanelRadio>((SalesDailyDivisionModel model) {
                return ExpansionPanelRadio(
                  value: model.id.toString(),
                  backgroundColor: context.theme.cardColor,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ShowListHeaderRow(titleName: '', value: model.itemName.toString());
                  },
                  body: Column(
                    children: [
                      ShowListDetailRow(
                        titleName: '용도',
                        value: model.usageName.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '수량\n( BOX / EA )',
                        value: model.boxQuantity.toString() + ' / ' + model.bottleQuantity.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '총계\n(공 + 부 + 보증금)',
                        value: model.amount.toString(),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
