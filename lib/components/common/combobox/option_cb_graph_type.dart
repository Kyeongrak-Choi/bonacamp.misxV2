import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/models/system/warehouse.dart';

class OptionCbGraphType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbGraphTypeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
              child: Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.canvasColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'opt_graph_type'.tr,
                      style: context.textTheme.displayMedium,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                  () => DropdownButtonFormField<WarehouseModel>(
                    isExpanded: true,
                    value: Get.find<CbGraphTypeController>().selectedValue,
                    style: context.textTheme.displayMedium,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.cardColor,
                    items: Get.find<CbGraphTypeController>().data.map<DropdownMenuItem<WarehouseModel>>((WarehouseModel value) {
                      return DropdownMenuItem<WarehouseModel>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(value.getWarehouseName ?? ''),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbGraphTypeController>().chooseItem(value!);
                    },
                  ),
                ))),
      ],
    );
  }
}

class CbGraphTypeController extends GetxController {
  List<WarehouseModel> data = <WarehouseModel>[].obs;

  var selectedValue;

  // param sample
  String paramGraphType = '';

  @override
  void onInit() async {
    super.onInit();
    setCustomerStatus();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(WarehouseModel value) async {
    paramGraphType = value.getWarehouseCode ?? '';
    selectedValue = value;
  }

  void setCustomerStatus() {
    data.add(WarehouseModel("SALES", "매출"));
    data.add(WarehouseModel("BOND", "채권"));
    data.add(WarehouseModel("PURCHASE", "매입"));
    data.add(WarehouseModel("DEBT", "채무"));
    data.add(WarehouseModel("RENTAL", "대여금액"));
    data.add(WarehouseModel("ASSET", "대여자산"));
  }
}
