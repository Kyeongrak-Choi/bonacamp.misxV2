import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionCbCustomerStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbCustomerStatusController());
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
                      'opt_customer_status'.tr,
                      style: context.textTheme.bodyText1,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                  () => DropdownButtonFormField(
                    isExpanded: true,
                    value: Get.find<CbCustomerStatusController>().selectedValue,
                    style: context.textTheme.bodyText1,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.backgroundColor,
                    items: Get.find<CbCustomerStatusController>().data.map((selectedValue) {
                      return DropdownMenuItem(
                        alignment: Alignment.center,
                        value: selectedValue,
                        child: Text(
                          selectedValue,
                          style: context.textTheme.bodyText1,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbCustomerStatusController>().chooseItem(value);
                    },
                  ),
                ))),
      ],
    );
  }
}

class CbCustomerStatusController extends GetxController {
  final List<String> data = ['전체', '정상', '영업정지', '휴업', '폐업', '단절'].obs;
  var selectedValue;

  // param sample
  String paramCustStat = '';

  @override
  void onInit() {
    super.onInit();
    selectedValue = data.first;
  }

  chooseItem(value) async {
    paramCustStat = value;
  }
}
