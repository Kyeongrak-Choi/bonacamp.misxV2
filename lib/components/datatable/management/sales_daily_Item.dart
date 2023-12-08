import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/management/sales_daily_model.dart';
import '../../common/field/icon_title_two_field.dart';
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
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((SalesDailyDayMonthModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(titleName: '', value: model.salesRepName ?? '');
              },
              body: Column(
                children: [
                  IconTitleTwoField(
                    titleName: '',
                    value1: '일 금액',
                    value2: '월 금액',
                    iconData: CupertinoIcons.minus,
                  ),
                  IconTitleTwoField(
                    titleName: '공급가',
                    value1: model.price_D,
                    value2: model.price_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '부가세',
                    value1: model.vat_D,
                    value2: model.vat_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '보증금합계',
                    value1: model.guarantee_D,
                    value2: model.guarantee_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '총계',
                    value1: model.total_D,
                    value2: model.total_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '매출원가',
                    value1: model.cost_D,
                    value2: model.cost_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '매출이익',
                    value1: model.margin_D,
                    value2: model.margin_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '입금소계',
                    value1: model.depositCash_D,
                    value2: model.depositCash_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '용공입금',
                    value1: model.depositEtc_D,
                    value2: model.depositEtc_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '입금합계',
                    value1: model.deposit_D,
                    value2: model.deposit_M,
                    iconData: Icons.label_outlined,
                  ),
                  IconTitleTwoField(
                    titleName: '채권잔액',
                    value1: model.balance_D,
                    value2: model.balance_M,
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
