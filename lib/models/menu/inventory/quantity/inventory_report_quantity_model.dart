import 'package:json_annotation/json_annotation.dart';

part 'inventory_report_quantity_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class InventoryReportQuantityModel {
  var box;
  var bottle;
  var total;

  InventoryReportQuantityModel(this.box, this.bottle, this.total);

  Map<String, dynamic> toMap() {
    return {
      'box': box,
      'bottle': bottle,
      'total': total,
    };
  }

  factory InventoryReportQuantityModel.fromJson(Map<String, dynamic> json) => _$InventoryReportQuantityModelFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryReportQuantityModelToJson(this);
}
