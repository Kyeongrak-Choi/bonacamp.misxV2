import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SumTitleTable extends StatelessWidget {
  var titleName;
  var sub;
  var controller;


  SumTitleTable(titleName, {sub, controller}) {
    this.titleName = titleName;
    this.sub = sub;
    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
              color: context.theme.colorScheme.onSurfaceVariant
          )),
        ),
        child: Column(children: [
          Row(
            children: [
              Text(
                titleName ?? '',
                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(width: 5.w),
              Text(
                sub ?? '',
                style: context.textTheme.bodyMedium?.copyWith(color: context.theme.colorScheme.onSecondary),
                textAlign: TextAlign.left,
              ),
              controller != null ? FittedBox(
                fit: BoxFit.contain,
                child: IconButton(
                    onPressed: () {
                      controller.setSumTableVisible();
                    },
                  icon: Icon(controller.sumTableVisible.value == true ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,),
                  alignment: Alignment.centerLeft,
                ),
              ) : Text(''),
            ],
          ),
          // Container(
          //     padding: EdgeInsets.zero,
          //     child:
          //         Divider(color: context.theme.colorScheme.background, thickness: 0.5)),
        ]));
  }
}
