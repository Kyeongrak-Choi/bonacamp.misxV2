import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/management/sales_class_status.dart';
import '../../common/field/icon_title_field.dart';
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
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList!.map<ExpansionPanelRadio>((SalesClassStatusModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.salesClassCode.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(titleName: '', value: model.salesClassName ?? '');
              },
              body: Column(
                children: [
                  IconTitleField(
                    titleName: 'BOX',
                    value: model.boxQuantity.toString(),
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: 'EA',
                    value: model.bottleQuantity.toString(),
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '매출액',
                    value: model.total,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '매출공급가',
                    value: model.supplementAmount,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '매출원가',
                    value: model.purchaseAmount,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '마진액',
                    value: model.profitAmount,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '마진율',
                    value: model.profitRate.toString(),
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
