import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

import 'item_status_amount_model.dart';

part 'item_status_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class ItemStatusModel {
  var code;
  var name;
  var status;
  var totalBox;
  var totalBottle;
  ItemStatusAmountModel normalBox;
  ItemStatusAmountModel normalBottle;
  ItemStatusAmountModel pleasureBox;
  ItemStatusAmountModel pleasureBottle;

  int? id;

  ItemStatusModel(this.code, this.name, this.status,
      this.totalBox, this.totalBottle, this.normalBox, this.normalBottle,
      this.pleasureBox, this.pleasureBottle, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'status': status,
      'total-box': totalBox,
      'total-bottle': totalBottle,
      'normal-box': normalBox,
      'normal-bottle': normalBottle,
      'pleasure-box': pleasureBox,
      'pleasure-bottle': pleasureBottle,
    };
  }

  factory ItemStatusModel.fromJson(Map<String, dynamic> json) => _$ItemStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemStatusModelToJson(this);
}

List<ItemStatusModel> generateItemStatusModelList(dataList, count) {
  return List.generate(
      count,
      (index) => ItemStatusModel(
            dataList[index].code,
            dataList[index].name,
            dataList[index].status,
            numberFormat.format(dataList[index].totalBox),
            numberFormat.format(dataList[index].totalBottle),
            ItemStatusAmountModel(
              numberFormat.format(dataList[index].last.bottleQuantity),
              numberFormat.format(dataList[index].last.equipQuantity)),
            ItemStatusAmountModel(
              numberFormat.format(dataList[index].physical.bottleQuantity),
              numberFormat.format(dataList[index].physical.equipQuantity)),
            ItemStatusAmountModel(
              numberFormat.format(dataList[index].inventoryIn.bottleQuantity),
              numberFormat.format(dataList[index].inventoryIn.equipQuantity)),
            ItemStatusAmountModel(
              numberFormat.format(dataList[index].inventoryOut.bottleQuantity),
              numberFormat.format(dataList[index].inventoryOut.equipQuantity)),
            id: index,
          ));
}
