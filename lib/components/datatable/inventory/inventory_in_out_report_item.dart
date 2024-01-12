import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/menu/inventory/inventory_in_out_report_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/theme/color_manager.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/icon_title_two_field2.dart';

class InventoryInOutReportItem extends StatelessWidget {
  var dataList;

  InventoryInOutReportItem(var model) {
    dataList = generateInventoryInOutReportModelList(model, model.length);
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
          padding: EdgeInsetsDirectional.fromSTEB(0.w, BASIC_PADDING.h, 0.w, 0.h),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        '품목',
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
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
                                  'BOX',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'EA',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '상세',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
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
                        flex: 4,
                        child: Text(
                          dataList[index].itemName ?? '',
                          style: context.textTheme.bodyMedium,
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
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: IconButton(
                            onPressed: () {
                              ShowInventoryInOutDetailDialog(dataList[index], context);
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

void ShowInventoryInOutDetailDialog(var detailList, BuildContext context) {
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
                  '재고수불현황 상세보기',
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
                  titleName: '품목',
                  value: detailList.itemName ?? '',
                  iconData: Icons.label_outlined,
                ),
                IconTitleTwoField2(
                  titleName: '',
                  iconData: Icons.remove,
                  value1: 'BOX',
                  value2: 'EA',
                ),
                IconTitleTwoField2(
                  titleName: '입고',
                  iconData: Icons.label_outlined,
                  value1: detailList.inventoryIn.box,
                  value2: detailList.inventoryIn.bottle,
                ),
                IconTitleTwoField2(
                  titleName: '출고',
                  iconData: Icons.label_outlined,
                  value1: detailList.inventoryOut.box,
                  value2: detailList.inventoryOut.bottle,
                ),
                IconTitleTwoField2(
                  titleName: '실사',
                  iconData: Icons.label_outlined,
                  value1: detailList.physical.box,
                  value2: detailList.physical.bottle,
                ),
                IconTitleTwoField2(
                  titleName: '전일재고',
                  iconData: Icons.label_outlined,
                  value1: detailList.last.box,
                  value2: detailList.last.bottle,
                ),
                IconTitleTwoField2(
                  titleName: '금일재고',
                  iconData: Icons.label_outlined,
                  value1: detailList.current.box,
                  value2: detailList.current.bottle,
                ),
              ],
            ),
          )));
}
