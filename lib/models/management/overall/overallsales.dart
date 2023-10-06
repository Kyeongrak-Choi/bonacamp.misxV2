import 'package:json_annotation/json_annotation.dart';

part 'overallsales.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllSalesModel {
  var totAmt; // 매출액
  var suppAmt; // 공급가
  var vatAmt; // 부가세
  var grntAmt; // 보증금

  OverAllSalesModel(this.totAmt, this.suppAmt, this.vatAmt, this.grntAmt);

  Map<String, dynamic> toMap() {
    return {
      'amount': totAmt,
      'price': suppAmt,
      'vat': vatAmt,
      'guarantee': grntAmt,
    };
  }

  factory OverAllSalesModel.fromJson(Map<String, dynamic> json) => _$OverAllSalesModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllSalesModelToJson(this);
}
