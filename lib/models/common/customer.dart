import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart'; // *.g.dart : in same directory

// 거래처 검색 Model
@JsonSerializable(explicitToJson: true)
class CustomerModel {
  String custCd; // 거래처코드:DA150T0
  String custNm; // 거래처 명
  String custAbbNm; // 거래처 약어 명
  String custStat; // 거래처 상태:ABS018
  String custStatNm; // 거래처 상태명
  String bizItm; // 사업 종목:ABS010 - 품목의 용도와 관계(DA107T0:용도 종목)
  String bizItmNm; // 사업종목 명

  CustomerModel(this.custCd, this.custNm, this.custAbbNm, this.custStat, this.custStatNm, this.bizItm, this.bizItmNm);

  Map<String, dynamic> toMap() {
    return {
      'custCd': custCd,
      'custNm': custNm,
      'custAbbNm': custAbbNm,
      'custStat': custStat,
      'custStatNm': custStatNm,
      'bizItm': bizItm,
      'bizItmNm': bizItmNm
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);

  String get getCustCd => custCd;

  set setCustCd(String value) {
    custCd = value;
  }

  String get getCustNm => custNm;

  set setCustNm(String value) {
    custNm = value;
  }

  String get getCustAbbNm => custAbbNm;

  set setCustAbbNm(String value) {
    custAbbNm = value;
  }

  String get getCustStat => custStat;

  set setCustStat(String value) {
    custStat = value;
  }

  String get getCustStatNm => custStatNm;

  set setCustStatNm(String value) {
    custStatNm = value;
  }

  String get getBizItm => bizItm;

  set setBizItm(String value) {
    bizItm = value;
  }

  String get getBizItmNm => bizItmNm;

  set setBizItmNm(String value) {
    bizItmNm = value;
  }
}
