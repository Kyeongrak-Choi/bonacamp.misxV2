import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/inventory/inventory_report_model.dart';
import '../../../utils/theme/color_manager.dart';
import '../../common/field/icon_title_field.dart';

class InventoryReportItem extends StatelessWidget {
  var dataList;

  InventoryReportItem(var model) {
    dataList = generateInventoryReportModelList(model, model.length);
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
                    flex: 4,
                    child: Text(
                      '품목',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'BOX',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'EA',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '금액',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.center,
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
              primary: false,
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
                      flex: 4,
                      child: Text(
                        dataList[index].itemName ?? '',
                        style: context.textTheme.displaySmall,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        dataList[index].boxQuantity ,
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        dataList[index].bottleQuantity,
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        dataList[index].amount,
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          ShowInventoryDetailDialog(dataList[index]);
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

void ShowInventoryDetailDialog(var detailList) {
  Get.defaultDialog(
      title: "재고 현황 상세보기",
      content: Column(
        children: [
          IconTitleField(
            titleName: '품목',
            value: detailList.itemName ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: 'BOX',
            value: detailList.boxQuantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: 'EA',
            value: detailList.bottleQuantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '금액',
            value: detailList.amount,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매입처',
            value: detailList.customerName ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매입단가(BOX)',
            value: detailList.purchase.box,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매입단가(EA)',
            value: detailList.purchase.bottle,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매출단가(BOX)',
            value: detailList.sales.box,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '매출단가(EA)',
            value: detailList.sales.bottle,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '입수량',
            value: detailList.packageQuantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '주종',
            value: detailList.liquorType ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '판매분류',
            value: detailList.salesType ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '품목분류',
            value: detailList.itemType ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '용도',
            value: detailList.use ?? '',
            iconData: Icons.label_outlined,
          ),
        ],
      ));
}
