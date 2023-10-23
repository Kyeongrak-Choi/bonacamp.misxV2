import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/sales/achievement/achievement_details_model.dart';

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
                    onPressed: (){
                      ShowAchievementDetailDialog(detailList);
                    },
                    icon: Icon(Icons.search, color: context.theme.primaryColor),
                  )
                )
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