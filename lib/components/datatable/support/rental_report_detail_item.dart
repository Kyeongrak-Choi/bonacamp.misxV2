import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/support/rental_report/rental_report_details_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/theme/color_manager.dart';
import '../../common/field/icon_title_field.dart';

class RentalReportDetailItem extends StatelessWidget {
  var detailList;

  RentalReportDetailItem(RentalReportDetailsModel detailList) {
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
                detailList.status,
                textAlign: TextAlign.left,
                style: context.textTheme.bodyLarge!.merge(TextStyle(
                    color:
                        detailList.status == '연체' ? Colors.red : context.theme.colorScheme.onPrimary)),
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                  child: IconButton(
                onPressed: () {
                  ShowRentalReportDetailDialog(detailList, context);
                },
                icon: Icon(Icons.search, color: context.theme.primaryColor),
              )),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            detailList.sequence.toString(),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            detailList.payLastDate ?? '',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

void ShowRentalReportDetailDialog(var detailList, BuildContext context) {
  Get.defaultDialog(
      title: '',
      backgroundColor: context.theme.canvasColor,
      content: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0.h, BASIC_PADDING.w, BASIC_PADDING.h),
            child: ListView(
              children: [
                Text(
                  '대여금 상세보기',
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
                  titleName: '차수',
                  value: detailList.sequence.toString(),
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '구분',
                  value: detailList.status ?? '',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '분납',
                  value: detailList.divideMonth.toString(),
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '이율',
                  value: detailList.interestRate.toString(),
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '분납완료일',
                  value: detailList.payLastDate ?? '',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '총 대여금',
                  value: numberFormat.format(detailList.totalRentalAmount),
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '총 회수금',
                  value: numberFormat.format(detailList.totalReturnAmount),
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '총 대여잔액',
                  value: numberFormat.format(detailList.balance),
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '영업 담당',
                  value: detailList.salesRepName ?? '',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '당일 예정액',
                  value: numberFormat.format(detailList.rentalAmount),
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '당일 회수액',
                  value: numberFormat.format(detailList.returnAmount),
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '연체금액',
                  value: numberFormat.format(detailList.overdueAmount),
                  iconData: Icons.label_outlined,
                ),
              ],
            ),
          )));
}
