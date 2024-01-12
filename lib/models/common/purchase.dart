import 'package:json_annotation/json_annotation.dart';

part 'purchase.g.dart'; // *.g.dart : in same directory

// 거래처(매입처) 검색 Model
@JsonSerializable(explicitToJson: true)
class PurchaseModel {
  String? custCd; // 거래처코드:DA150T0
  String? custNm; // 거래처 명
  String? reprNm; // 대표자명
  String? custStat; // 거래처 상태:ABS018
  String? custStatNm; // 거래처 상태명
  String? bizcnd; // 업태
  String? indstyp; // 업종

  PurchaseModel(this.custCd, this.custNm, this.reprNm, this.custStat,
      this.custStatNm, this.bizcnd, this.indstyp);

  Map<String, dynamic> toMap() {
    return {
      'customer-code': custCd,
      'customer-name': custNm,
      'representative': reprNm,
      'customer-status-code': custStat,
      'customer-status-name': custStatNm,
      'business-status': bizcnd,
      'business-type': indstyp
    };
  }

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseModelToJson(this);

  String? get getCustCd => custCd;

  set setCustCd(String value) {
    custCd = value;
  }

  String? get getCustNm => custNm;

  set setCustNm(String value) {
    custNm = value;
  }

  String? get getReprNm => reprNm;

  set setReprNm(String value) {
    reprNm = value;
  }

  String? get getCustStat => custStat;

  set setCustStat(String value) {
    custStat = value;
  }

  String? get getCustStatNm => custStatNm;

  set setCustStatNm(String value) {
    custStatNm = value;
  }

  String? get getBizCnd => bizcnd;

  set setBizCnd(String value) {
    bizcnd = value;
  }

  String? get getIndstyp => indstyp;

  set setIndstyp(String value) {
    indstyp = value;
  }
}
