import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/purchase/purchase_ledger/purchase_ledger_details_model.dart';
import '../../common/field/icon_title_field.dart';

class PurchaseLedgerDetailItem extends StatelessWidget {
  var detailList;

  PurchaseLedgerDetailItem(PurchaseLedgerDetailsModel detailList) {
    this.detailList = detailList;
  }

  @override
  Widget build(context) {
    Get.put(OptionDialogCustomerController());
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  detailList.itemName,
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayMedium!.merge(
                      TextStyle(
                    color: detailList.itemName == '지급' ? Colors.red : Colors.blue)
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: (){
                    ShowPurchaseLedgerDetailDialog(detailList);
                  },
                  icon: Icon(Icons.search, color: context.theme.primaryColor),
                )
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            detailList.itemName == '지급' ? numberFormat.format(detailList.withdraw) : numberFormat.format(detailList.total),
            textAlign: TextAlign.right,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            numberFormat.format(detailList.balance),
            textAlign: TextAlign.right,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

void ShowPurchaseLedgerDetailDialog(var detailList) {
  Get.defaultDialog(
      title: "매입 상세보기",
      content: Column(
        children: [
          IconTitleField(
            titleName: 'item'.tr,
            value: detailList.itemName ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: 'BOX / EA',
            value: detailList.boxQuantity.toString() + ' / ' + detailList.bottleQuantity.toString(),
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매입액',
            value: numberFormat.format(detailList.total),
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '공급가',
            value: numberFormat.format(detailList.price),
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '출금액',
            value: numberFormat.format(detailList.withdraw),
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '채무잔액',
            value: numberFormat.format(detailList.balance),
            iconData: Icons.label_outlined,
          ),
        ],
      ));
}