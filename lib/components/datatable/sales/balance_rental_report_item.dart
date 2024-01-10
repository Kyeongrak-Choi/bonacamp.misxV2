import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/menu/sales/balance_rental_report_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/theme/color_manager.dart';
import '../../common/field/icon_title_field.dart';

class BalanceRentalReportItem extends StatelessWidget {
  var dataList;

  BalanceRentalReportItem(var model) {
    dataList = generateBalanceRentalReportList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(
          BASIC_PADDING * 2.w,
          BASIC_PADDING * 2.h,
          BASIC_PADDING * 2.w,
          BASIC_PADDING * 2.h),
      color: context.theme.cardColor,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '매출처',
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '채권 잔액',
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.right,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    '상세',
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            //padding: const EdgeInsets.all(10),
            itemCount: dataList.length,
            // Divider 로 구분자 추가.
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 5,
              color: CommonColors.black,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      dataList[index].name ?? '',
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      (dataList[index].balance ?? '') + ' 원',
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        ShowBalanceRentalDetailDialog(
                            dataList[index], context);
                      },
                      icon: Icon(Icons.search),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

void ShowBalanceRentalDetailDialog(var detailList, BuildContext context) {
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
                  '채권 및 대여 현황 상세보기',
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
                  titleName: '매출처',
                  value: detailList.name ?? '',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '매출액',
                  value: detailList.total + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '공급가',
                  value: detailList.price + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '합계\n(공급가 + 부가세)',
                  value: detailList.amount + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '입금합계',
                  value: detailList.deposit + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '채권잔액',
                  value: detailList.balance + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '대여금(장기)',
                  value: detailList.longRent + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '대여금(단기)',
                  value: detailList.shortRent + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '대여금(합계)',
                  value: detailList.totalRent + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '채권 + 대여금',
                  value: detailList.totalBalance + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '대여자산',
                  value: detailList.rentQuantity + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '소비자산',
                  value: detailList.consumeQuantity + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '매출이익',
                  value: detailList.margin + ' 원',
                  iconData: Icons.label_outlined,
                ),
                IconTitleField(
                  titleName: '마진율',
                  value: detailList.marginRate.toString() + ' %',
                  iconData: Icons.label_outlined,
                ),
              ],
            ),
          )));
}
