import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layouts/menu/sales/item_status.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/icon_title_two_field.dart';
import '../../common/field/sum_title_table.dart';

class ItemStatusTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ItemStatusController());
    return GetBuilder<ItemStatusController>(builder: (ItemStatusController controller) {
      return Container(
        color: context.theme.cardColor,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: ListView(
            children: [
              IconTitleField(
                titleName: '품목명',
                value: controller.controllerItemStatus != null ? controller.controllerItemStatus.name : '',
                iconData: Icons.label_outlined,
              ),
              Container(width: 500, child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              SumTitleTable('매입'),
              IconTitleTwoField(
                titleName: '',
                value1: 'BOX',
                value2: 'EA',
                iconData: Icons.remove,
              ),
              IconTitleTwoField(
                titleName: '합계',
                value1: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.totalBox) : '0',
                value2: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.totalBottle) : '0',
                iconData: Icons.label_outlined,
              ),
              Container(width: 500, child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              SumTitleTable('매출 - 일반'),
              IconTitleTwoField(
                titleName: '',
                value1: 'BOX',
                value2: 'EA',
                iconData: Icons.remove,
              ),
              IconTitleTwoField(
                titleName: '공급가',
                value1: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.normalBox.amount) : '0',
                value2: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.normalBottle.amount) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleTwoField(
                titleName: '부가세',
                value1: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.normalBox.vat) : '0',
                value2: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.normalBottle.vat) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleTwoField(
                titleName: '합계',
                value1: controller.controllerItemStatus != null ? numberFormat.format(controller.totNormalBox) : '0',
                value2: controller.controllerItemStatus != null ? numberFormat.format(controller.totNormalBottle) : '0',
                iconData: Icons.label_outlined,
              ),
              Container(width: 500, child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              SumTitleTable('매출 - 유흥'),
              IconTitleTwoField(
                titleName: '',
                value1: 'BOX',
                value2: 'EA',
                iconData: Icons.remove,
              ),
              IconTitleTwoField(
                titleName: '공급가',
                value1: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.pleasureBox.amount) : '0',
                value2: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.pleasureBottle.amount) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleTwoField(
                titleName: '부가세',
                value1: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.pleasureBox.vat) : '0',
                value2: controller.controllerItemStatus != null ? numberFormat.format(controller.controllerItemStatus.pleasureBottle.vat) : '0',
                iconData: Icons.label_outlined,
              ),
              IconTitleTwoField(
                titleName: '합계',
                value1: controller.controllerItemStatus != null ? numberFormat.format(controller.totPleasureBox) : '0',
                value2: controller.controllerItemStatus != null ? numberFormat.format(controller.totPleasureBottle) : '0',
                iconData: Icons.label_outlined,
              ),
            ],
          ),
        ),
      );
    });
  }
}
