import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/menu/inventory/lend_report_customer_list_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/theme/color_manager.dart';
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              detailList.itemName ?? '',
              textAlign: TextAlign.start,
              style: context.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                ShowLendReportCustomerDetailDialog(detailList, context);
              },
              icon: Icon(Icons.search,size: 14.sp,),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              numberFormat.format(detailList.fullBox.lastQuantity),
              textAlign: TextAlign.end,
              style: context.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              numberFormat.format(detailList.box.lastQuantity),
              textAlign: TextAlign.end,
              style: context.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              numberFormat.format(detailList.bottle.lastQuantity),
              textAlign: TextAlign.end,
              style: context.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

void ShowLendReportCustomerDetailDialog(var detailList, BuildContext context) {
  Get.defaultDialog(
       title: '',
      // titlePadding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING * 2.h, BASIC_PADDING.w, BASIC_PADDING * 2.h),
      // titleStyle: context.textTheme.titleSmall
      //     ?.copyWith(fontWeight: FontWeight.bold, color: context.theme.colorScheme.onPrimary,),
      backgroundColor: context.theme.canvasColor,
      content: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0.h, BASIC_PADDING.w, BASIC_PADDING.h),
            child: ListView(
              children: [
                Text('용공수불현황 상세보기',style: context.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold, color: context.theme.colorScheme.onPrimary,),),
                SizedBox(height: BASIC_PADDING.h,),
                Divider(
                  height: 1.h,
                  color: context.theme.colorScheme.onPrimary,
                ),
                SizedBox(height: BASIC_PADDING.h,),
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
            ),
          )));
}
