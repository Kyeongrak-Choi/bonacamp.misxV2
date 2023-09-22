import 'package:json_annotation/json_annotation.dart';

part 'overallsales.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllSalesModel {
  String? totAmt; // 매출액
  String? suppAmt; // 공급가
  String? vatAmt; // 부가세
  String? grntAmt; // 보증금

  OverAllSalesModel(this.totAmt, this.suppAmt, this.vatAmt, this.grntAmt);

  Map<String, dynamic> toMap() {
    return {
      'rental-balance': totAmt,
      'supplement-amount': suppAmt,
      'vat-amount': vatAmt,
      'guarantee-amount': grntAmt,
    };
  }

  factory OverAllSalesModel.fromJson(Map<String, dynamic> json) => _$OverAllSalesModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllSalesModelToJson(this);

  String? get getTotAmt => totAmt;

  set setTotAmt(String value) {
    totAmt = value;
  }

  String? get getSuppAmt => suppAmt;

  set setSuppAmt(String value) {
    suppAmt = value;
  }

  String? get getVatAmt => vatAmt;

  set setVatAmt(String value) {
    vatAmt = value;
  }

  String? get getGrntAmt => grntAmt;

  set setGrntAmt(String value) {
    grntAmt = value;
  }
}
