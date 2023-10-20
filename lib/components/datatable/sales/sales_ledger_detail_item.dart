import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/sales/sales_ledger/sales_ledger_details_model.dart';

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
                style: context.textTheme.displayMedium!.merge(
                    TextStyle(
                  color: detailList.salesTypeName == '매출' ? Colors.blue : Colors.red)
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: detailList.salesTypeName == '매출' ? IconButton(
                  onPressed: (){
                    ShowLedgerDetailDialog(detailList);
                  },
                  icon: Icon(Icons.search, color: context.theme.primaryColor),
                ): TextButton(
                    onPressed: null,
                    child: Text(''),)
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            detailList.salesTypeName == '매출' ? numberFormat.format(detailList.total) : numberFormat.format(detailList.deposit),
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            numberFormat.format(detailList.balance),
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
