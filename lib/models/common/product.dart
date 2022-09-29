import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart'; // *.g.dart : in same directory

// 품목 검색 Model
@JsonSerializable(explicitToJson: true)
class ProductModel {
  String ITM_CD; // 품목코드:DA121T0
  String ITM_NM; // 품목명
  String ITM_ABB_NM; // 품목 별칭
  String STND; // 규격/용량
  String UZ_FG; // 용도
  String UZ_FG_NM; // 용도명
  String UT; // 단위
  String UT_NM; // 단위명

  ProductModel(this.ITM_CD, this.ITM_NM, this.ITM_ABB_NM, this.STND, this.UZ_FG,
      this.UZ_FG_NM, this.UT, this.UT_NM);

  Map<String, dynamic> toMap() {
    return {
      'ITM_CD': ITM_CD,
      'ITM_NM': ITM_NM,
      'ITM_ABB_NM': ITM_ABB_NM,
      'STND': STND,
      'UZ_FG': UZ_FG,
      'UZ_FG_NM': UZ_FG_NM,
      'UT': UT,
      'UT_NM': UT_NM
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  String get getItmCd => ITM_CD;

  set setItmCd(String value) {
    ITM_CD = value;
  }

  String get getItmNm => ITM_NM;

  set setItmNm(String value) {
    ITM_NM = value;
  }

  String get getItmAbbNm => ITM_ABB_NM;

  set setItmAbbNm(String value) {
    ITM_ABB_NM = value;
  }

  String get getStnd => STND;

  set setStnd(String value) {
    STND = value;
  }

  String get getUzFg => UZ_FG;

  set setUzFg(String value) {
    UZ_FG = value;
  }

  String get getUzFgNm => UZ_FG_NM;

  set setUzFgNm(String value) {
    UZ_FG_NM = value;
  }

  String get getUt => UT;

  set setUt(String value) {
    UT = value;
  }

  String get getUtNm => UT_NM;

  set setUtNm(String value) {
    UT_NM = value;
  }
}
