import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/sales/sales_ledger/sales_ledger_details_model.dart';
import '../../common/field/icon_title_field.dart';

class SalesLedgerDetailItem extends StatelessWidget {
  var detailList;

  SalesLedgerDetailItem(SalesLedgerDetailsModel detailList) {
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
                detailList.salesTypeName,
                textAlign: TextAlign.left,
                style: context.textTheme.displayMedium!.merge(TextStyle(color: detailList.salesTypeName == 'sales'.tr ? Colors.blue : Colors.red)),
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                  child: detailList.salesTypeName == 'sales'.tr
                      ? IconButton(
                          onPressed: () {
                            ShowLedgerDetailDialog(detailList,context);
                          },
                          icon: Icon(Icons.search, color: context.theme.primaryColor),
                        )
                      : TextButton(
                          onPressed: null,
                          child: Text(''),
                        )),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            detailList.salesTypeName == 'sales'.tr ? numberFormat.format(detailList.total) : numberFormat.format(detailList.deposit),
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

void ShowLedgerDetailDialog(var detailList,context) {
  Get.defaultDialog(
      title: "매출 상세보기",
      content: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Expanded(
              child: ListView(
            children: [
              IconTitleField(
                titleName: 'item'.tr,
                value: detailList.itemName ?? '',
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '매출유형',
                value: detailList.salesTypeName ?? '',
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
                titleName: '매출액',
                value: numberFormat.format(detailList.total),
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '공급가',
                value: numberFormat.format(detailList.price),
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '공급가 + 부가세',
                value: numberFormat.format(detailList.amount),
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '보증금',
                value: numberFormat.format(detailList.guarantee),
                iconData: Icons.label_outlined,
              ),
              IconTitleField(
                titleName: '채권잔액',
                value: numberFormat.format(detailList.balance),
                iconData: Icons.label_outlined,
              ),
            ],
          ))));
}
