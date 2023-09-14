import 'package:json_annotation/json_annotation.dart';

part 'overallasset.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllAssetModel {
  String? totQty; // 신규대여수량
  String? totAmt; // 신규대여금액

  OverAllAssetModel(this.totQty, this.totAmt);

  Map<String, dynamic> toMap() {
    return {
      'totQty': totQty,
      'totAmt': totAmt,
    };
  }

  factory OverAllAssetModel.fromJson(Map<String, dynamic> json) => _$OverAllAssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllAssetModelToJson(this);
}
