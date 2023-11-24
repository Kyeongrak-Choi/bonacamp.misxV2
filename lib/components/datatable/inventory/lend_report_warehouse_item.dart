import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/inventory/inventory_in_out_report_model.dart';
import '../../../models/menu/inventory/inventory_report_model.dart';
import '../../../models/menu/inventory/lend_report_warehouse_model.dart';
import '../../../models/menu/sales/balance_rental_report_model.dart';
import '../../../utils/theme/color_manager.dart';
import '../../common/field/icon_title_field.dart';

class LendReportWarehouseItem extends StatelessWidget {
  var dataList;

  LendReportWarehouseItem(var model) {
    dataList = generateLendReportWarehouseModelList(model, model.length);
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
                      '품목',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '전일재고\n입용기 / 용기 / 공병',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '상세',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.right,
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
                      flex: 2,
                      child: Text(
                        dataList[index].itemName ?? '',
                        style: context.textTheme.displaySmall,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        dataList[index].last.bottleQuantity + ' / ',
                        style: context.textTheme.displaySmall,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        dataList[index].last.equipQuantity + ' / ' ,
                        style: context.textTheme.displaySmall,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        dataList[index].last.quantity,
                        style: context.textTheme.displaySmall,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          ShowLendReportWarehouseDetailDialog(dataList[index], context);
                        },
                        icon: Icon(Icons.search, color: context.theme.primaryColor),
                        alignment: Alignment.centerRight,
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

void ShowLendReportWarehouseDetailDialog(var detailList, context) {
  Get.defaultDialog(
      title: "재고 수불 현황 상세보기",
      content: Column(
        children: [
          IconTitleField(
            titleName: '용기공병명',
            value: detailList.itemName ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '입수량',
            value: detailList.last.box + ' / ' + detailList.last.bottle,
            iconData: Icons.label_outlined,
          ),
          Text(
            '입용기 / 용기 / 공병',
            style: context.textTheme.displayMedium,
            textAlign: TextAlign.right,
          ),
          IconTitleField(
            titleName: '전일 재고',
            value: detailList.last.bottleQuantity + ' / ' + detailList.last.equipQuantity + ' / ' + detailList.last.quantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '금일 재고',
            value: detailList.current.bottleQuantity + ' / ' + detailList.current.equipQuantity + ' / ' + detailList.current.quantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '입고',
            value: detailList.inventoryIn.bottleQuantity + ' / ' + detailList.inventoryIn.equipQuantity + ' / ' + detailList.inventoryIn.quantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '출고',
            value: detailList.inventoryOut.bottleQuantity + ' / ' + detailList.inventoryOut.equipQuantity + ' / ' + detailList.inventoryOut.quantity,
            iconData: Icons.label_outlined,
          ),
        ],
      ));
}
