import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart'; // *.g.dart : in same directory

// 거래처 검색 Model
@JsonSerializable(explicitToJson: true)
class CustomerModel {
  String CUST_CD; // 거래처코드:DA150T0
  String CUST_NM; // 거래처 명
  String CUST_ABB_NM; // 거래처 약어 명
  String CUST_STAT; // 거래처 상태:ABS018
  String SAL_CHRG_CD; // 영업담당 코드
  String SAL_CHRG_NM; // 영엄담당 명
  String CUST_STAT_NM; // 거래처 상태명
  String BIZ_ITM; // 사업 종목:ABS010 - 품목의 용도와 관계(DA107T0:용도 종목)
  String BIZ_ITM_NM; // 사업종목 명
  String BIZ_REG_NO; // 사업자등록번호
  String REPR_NM; // 대표자 명
  String TEL_NO; // 사업장 전화 번호
  String ADDR; // 사업장 주소

  CustomerModel(
      this.CUST_CD,
      this.CUST_NM,
      this.CUST_ABB_NM,
      this.CUST_STAT,
      this.SAL_CHRG_CD,
      this.SAL_CHRG_NM,
      this.CUST_STAT_NM,
      this.BIZ_ITM,
      this.BIZ_ITM_NM,
      this.BIZ_REG_NO,
      this.REPR_NM,
      this.TEL_NO,
      this.ADDR);

  Map<String, dynamic> toMap() {
    return {
      'CUST_CD': CUST_CD,
      'CUST_NM': CUST_NM,
      'CUST_ABB_NM': CUST_ABB_NM,
      'CUST_STAT': CUST_STAT,
      'SAL_CHRG_CD': SAL_CHRG_CD,
      'SAL_CHRG_NM': SAL_CHRG_NM,
      'CUST_STAT_NM': CUST_STAT_NM,
      'BIZ_ITM': BIZ_ITM,
      'BIZ_ITM_NM': BIZ_ITM_NM,
      'BIZ_REG_NO': BIZ_REG_NO,
      'REPR_NM': REPR_NM,
      'TEL_NO': TEL_NO,
      'ADDR': ADDR
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);

  String get getCustCd => CUST_CD;

  set setCustCd(String value) {
    CUST_CD = value;
  }

  String get getCustNm => CUST_NM;

  set setCustNm(String value) {
    CUST_NM = value;
  }

  String get getCustAbbNm => CUST_ABB_NM;

  set setCustAbbNm(String value) {
    CUST_ABB_NM = value;
  }

  String get getCustStat => CUST_STAT;

  set setCustStat(String value) {
    CUST_STAT = value;
  }

  String get getSalChrgCd => SAL_CHRG_CD;

  set setSalChrgCd(String value) {
    SAL_CHRG_CD = value;
  }

  String get getSalChrgNm => SAL_CHRG_NM;

  set setSalChrgNm(String value) {
    SAL_CHRG_NM = value;
  }

  String get getCustStatNm => CUST_STAT_NM;

  set setCustStatNm(String value) {
    CUST_STAT_NM = value;
  }

  String get getBizItm => BIZ_ITM;

  set setBizItm(String value) {
    BIZ_ITM = value;
  }

  String get getBizItmNm => BIZ_ITM_NM;

  set setBizItmNm(String value) {
    BIZ_ITM_NM = value;
  }

  String get getBizRegNo => BIZ_REG_NO;

  set setBizRegNo(String value) {
    BIZ_REG_NO = value;
  }

  String get getReprNm => REPR_NM;

  set setReprNm(String value) {
    REPR_NM = value;
  }

  String get getTelNo => TEL_NO;

  set setTelNo(String value) {
    TEL_NO = value;
  }

  String get getAddr => ADDR;

  set setAddr(String value) {
    ADDR = value;
  }
}
