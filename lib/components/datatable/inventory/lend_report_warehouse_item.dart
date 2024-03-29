import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/menu/inventory/lend_report_warehouse_model.dart';
import '../../../utils/constants.dart';
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.theme.canvasColor,
        ),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, BASIC_PADDING.h, BASIC_PADDING.w, BASIC_PADDING.h),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        '용기공병',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
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
                            style: context.textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: BASIC_PADDING.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '입용기',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '공용기',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '공병',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '상세',
                                  textAlign: TextAlign.right,
                                  style: context.textTheme.bodyMedium,
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
                itemCount: dataList.length,
                // Divider 로 구분자 추가.
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  height: 0,
                  color: CommonColors.gray,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          dataList[index].lendItemName ?? '',
                          style: context.textTheme.bodyMedium,
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
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: IconButton(
                            onPressed: () {
                              ShowLendReportWarehouseDetailDialog(dataList[index], context);
                            },
                            icon: Icon(
                              Icons.search,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void ShowLendReportWarehouseDetailDialog(var detailList, BuildContext context) {
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
                  '용공수불현황 상세보기',
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
                SizedBox(
                  height: BASIC_PADDING.h,
                ),
                Divider(color: context.theme.colorScheme.onBackground,thickness: 0.5,height: 1.h,),
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
            ),
          )));
}
