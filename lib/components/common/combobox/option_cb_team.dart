import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/system/team.dart';
import '../../../utils/constants.dart';

class OptionCbTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CbTeamController());
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
            child: Text(
              'opt_team'.tr,
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
            () => DropdownButtonFormField<TeamModel>(
              padding: EdgeInsetsDirectional.fromSTEB(
                  BASIC_PADDING * 2.w, 0.h, BASIC_PADDING * 2.w, 0.h),
              isExpanded: true,
              menuMaxHeight: BASIC_PADDING * 30.h,
              value: Get.find<CbTeamController>().selectedValue,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(border: InputBorder.none),
              dropdownColor: context.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(8),
              items: Get.find<CbTeamController>()
                  .data
                  .map<DropdownMenuItem<TeamModel>>((TeamModel value) {
                return DropdownMenuItem<TeamModel>(
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
                          value.getTeamName ?? '',
                          style: context.textTheme.bodyMedium,
                        )),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                Get.find<CbTeamController>().chooseItem(value!);
              },
            ),
          ),
        ),
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
