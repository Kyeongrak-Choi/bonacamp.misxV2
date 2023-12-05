import 'package:json_annotation/json_annotation.dart';

part 'item_status_amount_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class ItemStatusAmountModel {
  var amount;
  var vat;

  ItemStatusAmountModel(this.amount, this.vat);

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'vat': vat,
    };
  }

  factory ItemStatusAmountModel.fromJson(Map<String, dynamic> json) => _$ItemStatusAmountModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemStatusAmountModelToJson(this);
}
