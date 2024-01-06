import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/purchase/purchase_ledger/purchase_ledger_details_model.dart';
import '../../../utils/theme/color_manager.dart';
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
                  style: context.textTheme.displayMedium!.merge(TextStyle(
                      color: detailList.itemName == '지급'
                          ? Colors.red
                          : Colors.blue)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      ShowPurchaseLedgerDetailDialog(detailList, context);
                    },
                    icon: Icon(Icons.search, color: context.theme.primaryColor),
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            detailList.itemName == '지급'
                ? numberFormat.format(detailList.withdraw)
                : numberFormat.format(detailList.total),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            numberFormat.format(detailList.balance),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

void ShowPurchaseLedgerDetailDialog(var detailList, context) {
  Get.defaultDialog(
      title: "\n매입 상세보기",
      titleStyle: TextStyle(color: CommonColors.primary),
      content: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ListView(
            children: [
              IconTitleField(
                titleName: 'item'.tr,
                value: detailList.itemName ?? '',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'BOX',
                value: detailList.boxQuantity.toString(),
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: 'EA',
                value: detailList.bottleQuantity.toString(),
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
          )));
}
