import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'inventory_report_quantity_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class InventoryReportQuantityModel {
  var box;
  var bottle;

  InventoryReportQuantityModel(this.box, this.bottle);

  Map<String, dynamic> toMap() {
    return {
      'box': box,
      'bottle': bottle,
    };
  }

  factory InventoryReportQuantityModel.fromJson(Map<String, dynamic> json) => _$InventoryReportQuantityModelFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryReportQuantityModelToJson(this);
}