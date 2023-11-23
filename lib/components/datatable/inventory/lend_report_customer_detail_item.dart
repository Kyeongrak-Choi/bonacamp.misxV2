import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/inventory/lend_report_customer_list_model.dart';
import '../../../models/menu/inventory/quantity/lend_report_customer_quantity_model.dart';
import '../../../models/menu/support/rental_report/rental_report_details_model.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/icon_title_three_field.dart';

class LendReportCustomerDetailItem extends StatelessWidget {
  var detailList;

  LendReportCustomerDetailItem(LendReportCustomerListModel detailList) {
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
              Expanded(
                flex: 2,
                child: Text(
                  detailList.itemName ?? '',
                  textAlign: TextAlign.left,
                  style: context.textTheme.displayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    ShowLendReportCustomerDetailDialog(detailList);
                  },
                  icon: Icon(Icons.search, color: context.theme.primaryColor),
              )),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            numberFormat.format(detailList.fullBox.lastQuantity),
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            numberFormat.format(detailList.box.lastQuantity),
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            numberFormat.format(detailList.bottle.lastQuantity),
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

void ShowLendReportCustomerDetailDialog(var detailList) {
  Get.defaultDialog(
      title: "용공수불현황 거래처별 상세보기",
      content: Column(
        children: [
          IconTitleField(
            titleName: '용기공병명',
            value: detailList.itemName ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleThreeField(
            titleName: '',
            value1: '입용기',
            value2: '공용기',
            value3: '공병',
            iconData: Icons.remove,
          ),
          IconTitleThreeField(
            titleName: '전일 재고',
            value1: numberFormat.format(detailList.fullBox.lastQuantity),
            value2: numberFormat.format(detailList.box.lastQuantity),
            value3: numberFormat.format(detailList.bottle.lastQuantity),
            iconData: Icons.label_outlined,
          ),
          IconTitleThreeField(
            titleName: '출고 현황',
            value1: numberFormat.format(detailList.fullBox.outQuantity),
            value2: numberFormat.format(detailList.box.outQuantity),
            value3: numberFormat.format(detailList.bottle.outQuantity),
            iconData: Icons.label_outlined,
          ),
          IconTitleThreeField(
            titleName: '회수 현황',
            value1: numberFormat.format(detailList.fullBox.inQuantity),
            value2: numberFormat.format(detailList.box.inQuantity),
            value3: numberFormat.format(detailList.bottle.inQuantity),
            iconData: Icons.label_outlined,
          ),
          IconTitleThreeField(
            titleName: '미회수 현황',
            value1: numberFormat.format(detailList.fullBox.remainQuantity),
            value2: numberFormat.format(detailList.box.remainQuantity),
            value3: numberFormat.format(detailList.bottle.remainQuantity),
            iconData: Icons.label_outlined,
          ),
          IconTitleThreeField(
            titleName: '회수 비율',
            value1: detailList.fullBox.inRate.toString(),
            value2: detailList.box.inRate.toString(),
            value3: detailList.bottle.inRate.toString(),
            iconData: Icons.label_outlined,
          ),
          IconTitleThreeField(
            titleName: '미회수 비율',
            value1: detailList.fullBox.remainRate.toString(),
            value2: detailList.box.remainRate.toString(),
            value3: detailList.bottle.remainRate.toString(),
            iconData: Icons.label_outlined,
          ),

        ],
      ));
}
