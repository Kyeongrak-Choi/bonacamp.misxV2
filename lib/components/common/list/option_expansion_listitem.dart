import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionExpansionListItem extends StatelessWidget {
  List itemTilteList;
  List itemValueList;

  final int TEXT_WIDGET_COUNT = 2;
  int extraindex = -2;

  OptionExpansionListItem({
    required this.itemTilteList,
    required this.itemValueList,
  });

  @override
  Widget build(BuildContext context) {
    extraindex = -2;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: itemTilteList.length % 2 == 0 ? itemTilteList.length ~/ 2 : itemTilteList.length ~/ 2 + 1,
        itemBuilder: (BuildContext ctx, int idx) {
          extraindex += 2;
          return Row(children: [
            Text(
              '[' + itemTilteList[idx * TEXT_WIDGET_COUNT] + ' ] ' + itemValueList[idx * TEXT_WIDGET_COUNT],
              style: context.textTheme.bodyText2,
            ),
            SizedBox(
              width: 10,
            ),
            if (extraindex + 1 < itemTilteList.length)
              Text(
                '[' + itemTilteList[idx * TEXT_WIDGET_COUNT + 1] + ' ] ' + itemValueList[idx * TEXT_WIDGET_COUNT + 1],
                style: context.textTheme.bodyText2,
              ),
          ]);
        });
  }
}
