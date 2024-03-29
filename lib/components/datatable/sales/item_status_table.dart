import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../layouts/menu/sales/item_status.dart';
import '../../../utils/constants.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/icon_title_two_field.dart';
import '../../common/field/icon_title_two_field2.dart';
import '../../common/field/sum_title_table.dart';

class ItemStatusTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ItemStatusController());
    return GetBuilder<ItemStatusController>(
        builder: (ItemStatusController controller) {
      return Container(
        color: context.theme.cardColor,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              BASIC_PADDING * 2.w,
              BASIC_PADDING * 2.h,
              BASIC_PADDING * 2.w,
              BASIC_PADDING * 2.h),
          child: ListView(
            children: [
              IconTitleField(
                titleName: '품목명',
                value: controller.controllerItemStatus != null
                    ? controller.controllerItemStatus.name
                    : '',
                iconData: Icons.label_outlined,
              ),
              Divider(color: context.theme.colorScheme.onBackground,thickness: 0.5,height: 1.h,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    BASIC_PADDING.w,
                    BASIC_PADDING.h,
                    BASIC_PADDING.w,
                    BASIC_PADDING.h),
                child: Text(
                  '매입',
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              Divider(color: context.theme.colorScheme.onBackground,thickness: 0.5,height: 1.h,),
              IconTitleTwoField2(
                titleName: '',
                value1: 'BOX',
                value2: 'EA',
                iconData: Icons.remove,
              ),
              IconTitleTwoField2(
                titleName: '합계',
                value1: controller.controllerItemStatus != null
                    ? numberFormat
                        .format(controller.controllerItemStatus.totalBox)
                    : '0',
                value2: controller.controllerItemStatus != null
                    ? numberFormat
                        .format(controller.controllerItemStatus.totalBottle)
                    : '0',
                iconData: Icons.label_outlined,
              ),
              Divider(color: context.theme.colorScheme.onBackground,thickness: 0.5,height: 1.h,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    BASIC_PADDING.w,
                    BASIC_PADDING.h,
                    BASIC_PADDING.w,
                    BASIC_PADDING.h),
                child: Text(
                  '매출 - 일반',
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              Divider(color: context.theme.colorScheme.onBackground,thickness: 0.5,height: 1.h,),
              IconTitleTwoField2(
                titleName: '',
                value1: 'BOX',
                value2: 'EA',
                iconData: Icons.remove,
              ),
              IconTitleTwoField2(
                titleName: '공급가',
                value1: controller.controllerItemStatus != null
                    ? numberFormat.format(
                        controller.controllerItemStatus.normalBox.amount)
                    : '0',
                value2: controller.controllerItemStatus != null
                    ? numberFormat.format(
                        controller.controllerItemStatus.normalBottle.amount)
                    : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleTwoField2(
                titleName: '부가세',
                value1: controller.controllerItemStatus != null
                    ? numberFormat
                        .format(controller.controllerItemStatus.normalBox.vat)
                    : '0',
                value2: controller.controllerItemStatus != null
                    ? numberFormat.format(
                        controller.controllerItemStatus.normalBottle.vat)
                    : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleTwoField2(
                titleName: '합계',
                value1: controller.controllerItemStatus != null
                    ? numberFormat.format(controller.totNormalBox)
                    : '0',
                value2: controller.controllerItemStatus != null
                    ? numberFormat.format(controller.totNormalBottle)
                    : '0',
                iconData: Icons.label_outlined,
              ),
              Divider(color: context.theme.colorScheme.onBackground,thickness: 0.5,height: 1.h,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    BASIC_PADDING.w,
                    BASIC_PADDING.h,
                    BASIC_PADDING.w,
                    BASIC_PADDING.h),
                child: Text(
                  '매출 - 유흥',
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              Divider(color: context.theme.colorScheme.onBackground,thickness: 0.5,height: 1.h,),
              IconTitleTwoField2(
                titleName: '',
                value1: 'BOX',
                value2: 'EA',
                iconData: Icons.remove,
              ),
              IconTitleTwoField2(
                titleName: '공급가',
                value1: controller.controllerItemStatus != null
                    ? numberFormat.format(
                        controller.controllerItemStatus.pleasureBox.amount)
                    : '0',
                value2: controller.controllerItemStatus != null
                    ? numberFormat.format(
                        controller.controllerItemStatus.pleasureBottle.amount)
                    : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleTwoField2(
                titleName: '부가세',
                value1: controller.controllerItemStatus != null
                    ? numberFormat
                        .format(controller.controllerItemStatus.pleasureBox.vat)
                    : '0',
                value2: controller.controllerItemStatus != null
                    ? numberFormat.format(
                        controller.controllerItemStatus.pleasureBottle.vat)
                    : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleTwoField2(
                titleName: '합계',
                value1: controller.controllerItemStatus != null
                    ? numberFormat.format(controller.totPleasureBox)
                    : '0',
                value2: controller.controllerItemStatus != null
                    ? numberFormat.format(controller.totPleasureBottle)
                    : '0',
                iconData: Icons.label_outlined,
              ),
            ],
          ),
        ),
      );
    });
  }
}
