import 'package:json_annotation/json_annotation.dart';

part 'overallpurchase.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllPurchaseModel {
  var boTotAmt; // 매입액
  var suppAmt; // 매입공급가
  var vatAmt; // 매입부가세
  var grntAmt; // 매입보증금

  OverAllPurchaseModel(this.boTotAmt, this.suppAmt, this.vatAmt, this.grntAmt);

  Map<String, dynamic> toMap() {
    return {
      'amount': boTotAmt,
      'price': suppAmt,
      'vat': vatAmt,
      'guarantee': grntAmt,
    };
  }

  factory OverAllPurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$OverAllPurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllPurchaseModelToJson(this);
}
