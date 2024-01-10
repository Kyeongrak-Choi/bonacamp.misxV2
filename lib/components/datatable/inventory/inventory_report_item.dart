import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/menu/inventory/inventory_report_model.dart';
import '../../../utils/constants.dart';
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.theme.canvasColor,
        ),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
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
                      flex: 2,
                      child: Text(
                        'BOX',
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'EA',
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '금액',
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '상세',
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
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
                          dataList[index].boxQuantity,
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
                            ShowInventoryDetailDialog(dataList[index], context);
                          },
                          icon: Icon(
                            Icons.search,
                            size: 24.sp,
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

void ShowInventoryDetailDialog(var detailList, BuildContext context) {
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
                '재고현황 상세보기',
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
          ),
        ),
      ));
}
