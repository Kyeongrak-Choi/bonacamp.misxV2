import 'package:json_annotation/json_annotation.dart';

part 'lend_report_quantity_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class LendReportQuantityModel {
  var bottleQuantity;
  var equipQuantity;
  var quantity;

  LendReportQuantityModel(
      this.bottleQuantity, this.equipQuantity, this.quantity);

  Map<String, dynamic> toMap() {
    return {
      'bottle-quantity': bottleQuantity,
      'equip-quantity': equipQuantity,
      'quantity': quantity,
    };
  }

  factory LendReportQuantityModel.fromJson(Map<String, dynamic> json) =>
      _$LendReportQuantityModelFromJson(json);

  Map<String, dynamic> toJson() => _$LendReportQuantityModelToJson(this);
}
