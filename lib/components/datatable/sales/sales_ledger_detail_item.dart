import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/sales/sales_ledger/sales_ledger_details_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/theme/color_manager.dart';
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
                style: context.textTheme.bodyLarge!.merge(TextStyle(
                    color: detailList.salesTypeName == 'sales'.tr
                        ? Colors.blue
                        : Colors.red)),
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                  child: detailList.salesTypeName == 'sales'.tr
                      ? IconButton(
                          onPressed: () {
                            ShowLedgerDetailDialog(detailList, context);
                          },
                          icon: Icon(Icons.search),
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
            detailList.salesTypeName == 'sales'.tr
                ? numberFormat.format(detailList.total) + ' 원'
                : numberFormat.format(detailList.deposit) + ' 원',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            numberFormat.format(detailList.balance) + ' 원',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

void ShowLedgerDetailDialog(var detailList, BuildContext context) {
  Get.defaultDialog(
      title: '',
      backgroundColor: context.theme.canvasColor,
      content: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0.h, BASIC_PADDING.w, BASIC_PADDING.h),
            child: ListView(
              children: [
                Text(
                  '매출 상세보기',
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
                SizedBox(
                  height: BASIC_PADDING.h,
                ),
                Divider(
                  height: 1.h,
                  color: context.theme.colorScheme.onPrimary,
                ),
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
                  value: numberFormat.format(detailList.total) + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '공급가',
                  value: numberFormat.format(detailList.price) + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '공급가 + 부가세',
                  value: numberFormat.format(detailList.amount) + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '보증금',
                  value: numberFormat.format(detailList.guarantee) + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '채권잔액',
                  value: numberFormat.format(detailList.balance) + ' 원',
                  iconData: Icons.label_outlined,
                ),
              ],
            ),
          )));
}
