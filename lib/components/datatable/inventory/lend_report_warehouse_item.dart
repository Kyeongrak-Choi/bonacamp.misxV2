import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/inventory/lend_report_warehouse_model.dart';
import '../../../utils/theme/color_manager.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/icon_title_three_field.dart';

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
                    flex: 4,
                    child: Text(
                      '용기공병',
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Text(
                          '전일재고',
                          textAlign: TextAlign.center,
                          style: context.textTheme.displayMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '입용기',
                                textAlign: TextAlign.center,
                                style: context.textTheme.displayMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '공용기',
                                textAlign: TextAlign.center,
                                style: context.textTheme.displayMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '공병',
                                textAlign: TextAlign.center,
                                style: context.textTheme.displayMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '상세',
                                textAlign: TextAlign.right,
                                style: context.textTheme.displayMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                      ],
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
                        dataList[index].lendItemName ?? '',
                        style: context.textTheme.displaySmall,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        dataList[index].last.quantity ?? '',
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        dataList[index].last.equipQuantity ?? '',
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        dataList[index].last.bottleQuantity,
                        style: context.textTheme.bodyMedium,
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
      title: "용공수불현황 상세보기",
      content: Column(
        children: [
          IconTitleField(
            titleName: '용기공병명',
            value: detailList.lendItemName ?? '',
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
            value1: detailList.last.quantity,
            value2: detailList.last.equipQuantity,
            value3: detailList.last.bottleQuantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleThreeField(
            titleName: '금일 재고',
            value1: detailList.current.quantity,
            value2: detailList.current.equipQuantity,
            value3: detailList.current.bottleQuantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleThreeField(
            titleName: '입고',
            value1: detailList.inventoryIn.quantity,
            value2: detailList.inventoryIn.equipQuantity,
            value3: detailList.inventoryIn.bottleQuantity,
            iconData: Icons.label_outlined,
          ),
          IconTitleThreeField(
            titleName: '출고',
            value1: detailList.inventoryOut.quantity,
            value2: detailList.inventoryOut.equipQuantity,
            value3: detailList.inventoryOut.bottleQuantity,
            iconData: Icons.label_outlined,
          ),
        ],
      ));
}
