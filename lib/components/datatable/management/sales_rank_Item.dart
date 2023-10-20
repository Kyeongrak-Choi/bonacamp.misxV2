import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/management/sales_rank_model.dart';
import '../../common/field/show_list_detail_row.dart';
import '../../common/field/show_list_header_row.dart';

class SalesRankItem extends StatelessWidget {
  var dataList;

  SalesRankItem(var model) {
    dataList = generateSalesRankList(model, model.length);
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
              elevation: 0.0,
              animationDuration: Duration(milliseconds: 500),
              children: dataList.map<ExpansionPanelRadio>((SalesRankModel model) {
                return ExpansionPanelRadio(
                  canTapOnHeader: true,
                  value: model.id.toString(),
                  backgroundColor: context.theme.cardColor,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ShowListHeaderRow(titleName: model.ranking.toString() + '.', value: model.customerName.toString());
                  },
                  body: Column(
                    children: [
                      ShowListDetailRow(
                        titleName: '매출액',
                        value: model.salesAmount.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '공급가',
                        value: model.supplementAmount.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '매출이익',
                        value: model.profitAmount.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '마진율',
                        value: model.profitRate.toString(),
                      ),
                      ShowListDetailRow(
                        titleName: '채권잔액',
                        value: model.bondBalance.toString(),
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