import 'package:json_annotation/json_annotation.dart';

part 'overallpurchase.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllPurchaseModel {
  String? boTotAmt; // 매입액
  String? suppAmt; // 매입공급가
  String? vatAmt; // 매입부가세
  String? grntAmt; // 매입보증금

  OverAllPurchaseModel(this.boTotAmt, this.suppAmt, this.vatAmt, this.grntAmt);

  Map<String, dynamic> toMap() {
    return {
      'purchase-amount': boTotAmt,
      'supplement-amount': suppAmt,
      'vat-amount': vatAmt,
      'guarantee-amount': grntAmt,
    };
  }

  factory OverAllPurchaseModel.fromJson(Map<String, dynamic> json) => _$OverAllPurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllPurchaseModelToJson(this);
}
