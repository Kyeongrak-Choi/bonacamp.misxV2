import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/localDB/node.dart';

import '../../../utils/constants.dart';

class OptionCbNode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbNodeController());
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
                      'opt_workspace'.tr,
                      style: context.textTheme.bodyText1,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                      () => DropdownButtonFormField<NodeModel>(
                    isExpanded: true,
                    value: Get.find<CbNodeController>().selectedValue,
                    style: context.textTheme.bodyText1,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.backgroundColor,

                    items: Get.find<CbNodeController>().data.map<DropdownMenuItem<NodeModel>>((NodeModel value){
                      return DropdownMenuItem<NodeModel>(
                        alignment: Alignment.center,
                        value : value,
                        child: Text(value.braNm),
                      );
                    }).toList(),
                    onChanged: (value){
                      Get.find<CbNodeController>().chooseItem(value!);
                    },
                  ),
                ))),
      ],
    );
  }
}

class CbNodeController extends GetxController {
  var selectedValue;
  List<NodeModel> data = [
    NodeModel('', '', '전체','',''),
  ].obs;

  // param sample
  String paramNodeCd ='';
  String paramComNm ='';
  String paramBraNm ='';
  String paramReprNm ='';
  String paramBizgRegno ='';

  @override
  void onInit() {
    super.onInit();
    setNode();
    selectedValue = data.first;
  }

  chooseItem(NodeModel value) async {
    paramNodeCd = value.nodeCode;
    paramComNm = value.comNm;
    paramBraNm = value.braNm;
    paramReprNm = value.reprNm;
    paramBizgRegno = value.bizrRegNo;
  }

  Future<void> setNode() async {
    await Hive.openBox(
      NM_NODE_BOX,
    );

    for (int i = 0; i < Hive.box(NM_NODE_BOX).get(KEY_NODE_BOX).length; i++) {
      data.add(Hive.box(NM_NODE_BOX).get(KEY_NODE_BOX).elementAt(i));
    }
  }
}
