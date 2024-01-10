import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/menu/sales/achievement/achievement_model.dart';
import '../../../utils/constants.dart';
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
                canTapOnHeader: true,
                value: model.id.toString(),
                backgroundColor: context.theme.cardColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ShowListHeaderRow(
                      titleName: model.name ?? '', value: '');
                },
                body: Container(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h,
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h),
                  color: context.theme.colorScheme.background,
                  child: Column(
                    children: [
                      ledgerListHead(context),
                      SizedBox(height: BASIC_PADDING.h),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.detailsList.length,
                          itemBuilder: (BuildContext ctx, int idx) {
                            return Container(
                                child: AchievementDetailItem(
                                    model.detailsList[idx]));
                          }),
                    ],
                  ),
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
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '매출 달성률 (%)',
            textAlign: TextAlign.right,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '채권 달성률 (%)',
            textAlign: TextAlign.right,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
