import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/purchase/purchase_report_model.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/show_list_header_row.dart';

class PurchaseReportItem extends StatelessWidget {
  var dataList;

  PurchaseReportItem(var model) {
    dataList = generatePurchaseReportModelList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((PurchaseReportModel model) {
            return ExpansionPanelRadio(
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(titleName: model.name ?? '', value: '');
              },
              body: Column(
                children: [
                  IconTitleField(
                    titleName: '매입액',
                    value: model.purchase ?? '',
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '출금합계',
                    value: model.withdraw ?? '',
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleField(
                    titleName: '채무잔액',
                    value: model.balance ?? '',
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
