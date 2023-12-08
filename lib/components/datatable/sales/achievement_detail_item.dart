import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/sales/achievement/achievement_details_model.dart';
import '../../../utils/theme/color_manager.dart';
import '../../common/field/icon_title_field.dart';

class AchievementDetailItem extends StatelessWidget {
  var detailList;

  AchievementDetailItem(AchievementDetailsModel detailList) {
    this.detailList = detailList;
  }

  @override
  Widget build(context) {
    Get.put(OptionDialogCustomerController());
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Text(
                changeStringYYYYMMToDateFormat(detailList.month ?? ''),
                textAlign: TextAlign.left,
                style: context.textTheme.displayMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                  child: IconButton(
                onPressed: () {
                  ShowAchievementDetailDialog(detailList, context);
                },
                icon: Icon(Icons.search, color: context.theme.primaryColor),
              ))
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            detailList.salesRate.toString() + ' %',
            textAlign: TextAlign.right,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            detailList.balanceRate.toString() + ' %',
            textAlign: TextAlign.right,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

void ShowAchievementDetailDialog(var detailList, context) {
  Get.defaultDialog(
      title: "\n목표대비 실적현황 상세보기",
      titleStyle: TextStyle(color: CommonColors.signature),
      content: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ListView(
            children: [
              IconTitleField(
                titleName: '구분',
                value: changeStringYYYYMMToDateFormat(detailList.month ?? ''),
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '매출목표',
                value: detailList.salesGoal ?? '',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '매출실적',
                value: detailList.salesAmount ?? '',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '달성률(%)',
                value: detailList.salesRate.toString(),
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '채권목표',
                value: detailList.balanceGoal ?? '',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '전월채권',
                value: detailList.lastBalance ?? '',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '전월증감',
                value: detailList.variationBalance ?? '',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '채권증감',
                value: detailList.changeBalance ?? '',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '달성률(%)',
                value: detailList.balanceRate.toString(),
                iconData: Icons.label_outlined,
              ),
            ],
          )));
}
