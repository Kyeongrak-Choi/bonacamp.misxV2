import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/warehouse.dart';
import '../../../utils/constants.dart';

class OptionCbWarehouses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbWarehousesController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'opt_warehouse'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            border: Border.all(color: context.theme.colorScheme.background),
          ),
          child: Obx(
            () => DropdownButtonFormField<WarehouseModel>(
              padding: EdgeInsetsDirectional.fromSTEB(
                  BASIC_PADDING * 2.w, 0.h, BASIC_PADDING * 2.w, 0.h),
              isExpanded: true,
              menuMaxHeight: BASIC_PADDING * 30.h,
              value: Get.find<CbWarehousesController>().selectedValue,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(border: InputBorder.none),
              dropdownColor: context.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(8),
              items: Get.find<CbWarehousesController>()
                  .data
                  .map<DropdownMenuItem<WarehouseModel>>(
                      (WarehouseModel value) {
                return DropdownMenuItem<WarehouseModel>(
                  alignment: Alignment.center,
                  value: value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                        ),
                        child: Text(
                          value.getWarehouseName ?? '',
                          style: context.textTheme.bodyMedium,
                        )),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                Get.find<CbWarehousesController>().chooseItem(value!);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CbWarehousesController extends GetxController {
  var selectedValue;
  List<WarehouseModel> data = [
    WarehouseModel('', '전체'),
  ].obs;

  String paramWarehouseCode = '';
  String paramWarehouseName = '';

  @override
  void onInit() {
    super.onInit();
    setWarehouses();
    selectedValue = data.first;
  }

  chooseItem(WarehouseModel value) async {
    paramWarehouseCode = value.getWarehouseCode ?? '';
    paramWarehouseName = value.getWarehouseName ?? '';
    selectedValue = value;
  }

  Future<void> setWarehouses() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    List<dynamic> Warehouse = Hive.box(LOCAL_DB).get(KEY_WH);

    for (int i = 0; i < Warehouse.length; i++) {
      data.add(Warehouse.elementAt(i));
    }
  }
}
