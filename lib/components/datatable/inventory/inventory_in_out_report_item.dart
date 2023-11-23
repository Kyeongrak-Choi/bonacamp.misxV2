import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/inventory/inventory_in_out_report_model.dart';
import '../../../models/menu/inventory/inventory_report_model.dart';
import '../../../models/menu/sales/balance_rental_report_model.dart';
import '../../../utils/theme/color_manager.dart';
import '../../common/field/icon_title_field.dart';

class InventoryInOutReportItem extends StatelessWidget {
  var dataList;

  InventoryInOutReportItem(var model) {
    dataList = generateInventoryInOutReportModelList(model, model.length);
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
                      '전일재고\nBOX / EA',
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
                        dataList[index].last.box + ' / ' + dataList[index].last.bottle,
                        style: context.textTheme.displaySmall,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          ShowInventoryInOutDetailDialog(dataList[index]);
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

void ShowInventoryInOutDetailDialog(var detailList) {
  Get.defaultDialog(
      title: "재고 수불 현황 상세보기",
      content: Column(
        children: [
          IconTitleField(
            titleName: '품목',
            value: detailList.itemName ?? '',
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '전일재고 BOX / EA',
            value: detailList.last.box + ' / ' + detailList.last.bottle,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '입고 BOX / EA',
            value: detailList.inventoryIn.box + ' / ' + detailList.inventoryIn.bottle,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '출고 BOX / EA',
            value: detailList.inventoryOut.box + ' / ' + detailList.inventoryOut.bottle,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '실사 BOX / EA',
            value: detailList.physical.box + ' / ' + detailList.physical.bottle,
            iconData: Icons.label_outlined,
          ),
          IconTitleField(
            titleName: '금일재고 BOX / EA',
            value: detailList.current.box + ' / ' + detailList.current.bottle,
            iconData: Icons.label_outlined,
          ),
        ],
      ));
}
