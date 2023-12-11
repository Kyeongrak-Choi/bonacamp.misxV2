import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/field/icon_title_two_field.dart';

import '../../../models/menu/inventory/inventory_in_out_report_model.dart';
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
                                'BOX',
                                textAlign: TextAlign.center,
                                style: context.textTheme.displayMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'EA',
                                textAlign: TextAlign.center,
                                style: context.textTheme.displayMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '상세',
                                textAlign: TextAlign.center,
                                style: context.textTheme.displayMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                  // Expanded(
                  //   flex: 2,
                  //   child: Text(
                  //     '전일재고\nBOX / EA',
                  //     style: context.textTheme.displayMedium,
                  //     textAlign: TextAlign.right,
                  //   ),
                  // ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Text(
                  //     '상세',
                  //     style: context.textTheme.displayMedium,
                  //     textAlign: TextAlign.right,
                  //   ),
                  // )
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
                        dataList[index].last.box,
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        dataList[index].last.bottle,
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {
                          ShowInventoryInOutDetailDialog(dataList[index], context);
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

void ShowInventoryInOutDetailDialog(var detailList, context) {
  Get.defaultDialog(
      title: "\n재고 수불 현황 상세보기",
      titleStyle: TextStyle(color: CommonColors.signature),
      content: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ListView(
            children: [
              IconTitleField(
                titleName: '품목',
                value: detailList.itemName ?? '',
                iconData: Icons.label_outlined,
              ),
              IconTitleTwoField(
                titleName: '',
                iconData: Icons.remove,
                value1: 'BOX',
                value2: 'EA',
              ),
              IconTitleTwoField(
                titleName: '입고',
                iconData: Icons.label_outlined,
                value1: detailList.inventoryIn.box,
                value2: detailList.inventoryIn.bottle,
              ),
              IconTitleTwoField(
                titleName: '출고',
                iconData: Icons.label_outlined,
                value1: detailList.inventoryOut.box,
                value2: detailList.inventoryOut.bottle,
              ),
              IconTitleTwoField(
                titleName: '실사',
                iconData: Icons.label_outlined,
                value1: detailList.physical.box,
                value2: detailList.physical.bottle,
              ),
              IconTitleTwoField(
                titleName: '전일재고',
                iconData: Icons.label_outlined,
                value1: detailList.last.box,
                value2: detailList.last.bottle,
              ),
              IconTitleTwoField(
                titleName: '금일재고',
                iconData: Icons.label_outlined,
                value1: detailList.current.box,
                value2: detailList.current.bottle,
              ),
            ],
          )));
}
