import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/sales/balance_rental_report_model.dart';
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
      color: context.theme.cardColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.theme.cardColor,
          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '매출처',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '채권 잔액',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '상세',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            ListView.separated(
              primary:  false,
              shrinkWrap: true,
              //padding: const EdgeInsets.all(10),
              itemCount: dataList.length,
              // Divider 로 구분자 추가.
              separatorBuilder: (BuildContext context, int index) => const Divider(
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
                          style: context.textTheme.displaySmall,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          dataList[index].balance ?? '',
                          style: context.textTheme.displaySmall,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            ShowBalanceRentalDetailDialog(dataList[index]);
                          },
                          icon: Icon(Icons.search, color: context.theme.primaryColor),
                        ),
                      )
                    ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void ShowBalanceRentalDetailDialog(var detailList) {
  Get.defaultDialog(
      title: "채권 및 대여 현황 상세보기",
      content: Column(
        children: [
          IconTitleField(
            titleName: '매출처',
            value: detailList.name ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매출액',
            value: detailList.total,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '공급가',
            value: detailList.price,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '합계\n(공급가 + 부가세)',
            value: detailList.amount,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '입금합계',
            value: detailList.deposit,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '채권잔액',
            value: detailList.balance,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '대여금(장기)',
            value: detailList.longRent,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '대여금(단기)',
            value: detailList.shortRent,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '대여금(합계)',
            value: detailList.totalRent,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '채권 + 대여금',
            value: detailList.totalBalance,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '대여자산',
            value: detailList.rentQuantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '소비자산',
            value: detailList.consumeQuantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매출이익',
            value: detailList.margin,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '마진율',
            value: detailList.marginRate.toString(),
            iconData: Icons.label_outlined,
          ),
        ],
      ));
}