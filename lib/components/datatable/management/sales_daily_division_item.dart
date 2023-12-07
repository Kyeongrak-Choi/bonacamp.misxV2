import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/management/sales_daily_division_model.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/show_list_header_row.dart';

class SalesDailyDivisionItem extends StatelessWidget {
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
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((SalesDailyDivisionModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(titleName: '', value: model.itemName ?? '');
              },
              body: Column(
                children: [
                  IconTitleField(
                    titleName: '용도',
                    value: model.usageName,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: 'BOX',
                    value: model.boxQuantity ,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: 'EA',
                    value: model.bottleQuantity,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '총계\n( 공 + 부 + 보증금 )',
                    value: model.amount,
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
