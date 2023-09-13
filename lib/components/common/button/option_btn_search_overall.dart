import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../../layouts/menu/management/overall_status.dart';
import '../../../utils/theme/color_manager.dart';
import '../combobox/option_cb_branches.dart';
import '../datepicker/option_period_picker.dart';

class OptionBtnSearchOverAll extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //Get.put(controller());
    //Get.put(OverAllController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Container(
                color: context.theme.backgroundColor,
                child: ElevatedButton(
                    onPressed: () async {
                      //ShowProgress(context);
                      ProgressDialog pd = ProgressDialog(context: context);
                      pd.show(max: 1000
                          , msg: 'progress_search'.tr
                          ,backgroundColor: CommonColors.bluesky);

                      await Get.find<OverAllController>().showResult();

                      pd.close();

                      Get.find<OverAllController>().setVisible();
                      //HideProgess(context);
                    },
                    child: Icon(Icons.search, color: context.theme.primaryColor),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: CommonColors.white,
                      backgroundColor: context.theme.canvasColor,
                    )),
              ),
            )),
      ],
    );
  }
}