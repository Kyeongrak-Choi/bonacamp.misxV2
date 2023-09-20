import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/team.dart';
import '../../../utils/constants.dart';

class OptionCbTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbTeamController());
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
                      'opt_team'.tr,
                      style: context.textTheme.bodyText1,
                    )),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Obx(
                      () => DropdownButtonFormField<TeamModel>(
                    isExpanded: true,
                    value: Get.find<CbTeamController>().selectedValue,
                    style: context.textTheme.bodyText1,
                    decoration: InputDecoration(border: InputBorder.none),
                    dropdownColor: context.theme.backgroundColor,
                    items: Get.find<CbTeamController>().data.map<DropdownMenuItem<TeamModel>>((TeamModel value) {
                      return DropdownMenuItem<TeamModel>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(value.getTeamName ?? ''),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Get.find<CbTeamController>().chooseItem(value!);
                    },
                  ),
                ))),
      ],
    );
  }
}

class CbTeamController extends GetxController {
  var selectedValue;
  List<TeamModel> data = [
    TeamModel('', '전체'),
  ].obs;

  // param sample
  String paramTeamCode = '';
  String paramTeamName = '';

  @override
  void onInit() {
    super.onInit();
    setTeam();
    selectedValue = data.first;
  }

  chooseItem(TeamModel value) async {
    paramTeamCode = value.getTeamCode ?? '';
    paramTeamName = value.getTeamName ?? '';

    selectedValue = value;
  }

  Future<void> setTeam() async {
    await Hive.openBox(
      LOCAL_DB,
    );

    for (int i = 0; i < Hive.box(LOCAL_DB).get(KEY_TEAM).length; i++) {
      data.add(Hive.box(LOCAL_DB).get(KEY_TEAM).elementAt(i));
    }
  }
}
