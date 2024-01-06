import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/sales/achievement/achievement_model.dart';
import '../../common/field/show_list_header_row.dart';
import 'achievement_detail_item.dart';

class AchievementItem extends StatelessWidget {
  var dataList;

  AchievementItem(var model) {
    dataList = generateAchievementModelList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((AchievementModel model) {
            return ExpansionPanelRadio(
                value: model.id.toString(),
                backgroundColor: context.theme.cardColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ShowListHeaderRow(
                      titleName: model.name ?? '', value: '');
                },
                body: Column(
                  children: [
                    ledgerListHead(context),
                    SizedBox(height: 14),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.detailsList.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return Container(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                              child: AchievementDetailItem(
                                  model.detailsList[idx]));
                        }),
                  ],
                ));
          }).toList(),
        ),
      ),
    );
  }

  Widget ledgerListHead(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '구분',
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '매출 달성률 (%)',
            textAlign: TextAlign.right,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '채권 달성률 (%)',
            textAlign: TextAlign.right,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
