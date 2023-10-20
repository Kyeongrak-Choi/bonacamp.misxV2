import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/models/system/warehouse.dart';

class OptionCbCustomerStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbCustomerStatusController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'opt_customer_status'.tr,
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Obx(
                      () => DropdownButtonFormField<WarehouseModel>(
                        isExpanded: true,
                        value: Get.find<CbCustomerStatusController>().selectedValue,
                        style: context.textTheme.bodyMedium,
                        decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: context.theme.cardColor,
                        items: Get.find<CbCustomerStatusController>().data.map<DropdownMenuItem<WarehouseModel>>((WarehouseModel value) {
                          return DropdownMenuItem<WarehouseModel>(
                            alignment: Alignment.center,
                            value: value,
                            child: Text(value.getWarehouseName ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          Get.find<CbCustomerStatusController>().chooseItem(value!);
                        },
                      ),
                    ))),
          ],
        ),
      ],
    );
  }
}

class CbCustomerStatusController extends GetxController {
  List<WarehouseModel> data = <WarehouseModel>[].obs;

  var selectedValue;

  // param sample
  String paramCustStat = '';

  @override
  void onInit() async {
    super.onInit();
    setCustomerStatus();
    if (data != null) {
      chooseItem(data.first);
    }
  }

  chooseItem(WarehouseModel value) async {
    paramCustStat = value.getWarehouseCode ?? '';
    selectedValue = value;
  }

  void setCustomerStatus() {
    data.add(WarehouseModel("ALL", "전체"));
    data.add(WarehouseModel("USE", "정상"));
    data.add(WarehouseModel("STOP", "영업정지"));
    data.add(WarehouseModel("CLOSE", "휴업"));
    data.add(WarehouseModel("UNUSE", "폐업"));
    data.add(WarehouseModel("CUT", "단절"));
  }
}
