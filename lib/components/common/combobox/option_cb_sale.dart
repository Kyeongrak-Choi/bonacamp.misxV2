import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/salchrg.dart';
import '../../../utils/constants.dart';

class OptionCbSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbSaleController());
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
                      'opt_sales'.tr,
                      style: context.textTheme.bodyText1,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                  () => DropdownButtonFormField<SalChrgModel>(
                    isExpanded: true,
                    value: Get.find<CbSaleController>().selectedValue,
                    style: context.textTheme.bodyText1,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.backgroundColor,
                    items: Get.find<CbSaleController>().data.map<DropdownMenuItem<SalChrgModel>>((SalChrgModel value) {
                      return DropdownMenuItem<SalChrgModel>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(value.getSalChrgNm),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbSaleController>().chooseItem(value!);
                    },
                  ),
                ))),
      ],
    );
  }
}

class CbSaleController extends GetxController {
  var selectedValue;
  List<SalChrgModel> data = [
    SalChrgModel('', '전체', ''),
  ].obs;

  // param sample
  String paramSalChrgCd = '';
  String paramSalChrgNm = '';
  String paramMgmtChrgrYn = '';

  @override
  void onInit() {
    super.onInit();
    setSalChrg();
    selectedValue = data.first;
  }

  chooseItem(SalChrgModel value) async {
    paramSalChrgCd = value.getSalChrgCd;
    paramSalChrgNm = value.getSalChrgNm;
    paramMgmtChrgrYn = value.getMgmtChrgrYn;
  }

  Future<void> setSalChrg() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    for (int i = 0; i < Hive.box(LOCAL_DB).get(KEY_SALCHRG).length; i++) {
      data.add(Hive.box(LOCAL_DB).get(KEY_SALCHRG).elementAt(i));
    }
  }
}
