import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart'; // *.g.dart : in same directory

// 품목 검색 Model
@JsonSerializable(explicitToJson: true)
class ItemModel {
  String itmCd; // 품목코드:DA121T0
  String itmNm; // 품목명
  String itmAbbNm; // 품목 별칭
  String stnd; // 규격/용량
  String uzFg; // 용도
  String uzFgNm; // 용도명
  String ut; // 단위
  String utNm; // 단위명

  ItemModel(this.itmCd, this.itmNm, this.itmAbbNm, this.stnd, this.uzFg, this.uzFgNm, this.ut, this.utNm);

  Map<String, dynamic> toMap() {
    return {
      'itmCd': itmCd,
      'itmNm': itmNm,
      'itmAbbNm': itmAbbNm,
      'stnd': stnd,
      'uzFg': uzFg,
      'uzFgNm': uzFgNm,
      'ut': ut,
      'utNm': utNm
    };
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  String get getItmCd => itmCd;

  set setItmCd(String value) {
    itmCd = value;
  }

  String get getItmNm => itmNm;

  set setItmNm(String value) {
    itmNm = value;
  }

  String get getItmAbbNm => itmAbbNm;

  set setItmAbbNm(String value) {
    itmAbbNm = value;
  }

  String get getstnd => stnd;

  set setstnd(String value) {
    stnd = value;
  }

  String get getUzFg => uzFg;

  set setUzFg(String value) {
    uzFg = value;
  }

  String get getUzFgNm => uzFgNm;

  set setUzFgNm(String value) {
    uzFgNm = value;
  }

  String get getut => ut;

  set setut(String value) {
    ut = value;
  }

  String get getutNm => utNm;

  set setutNm(String value) {
    utNm = value;
  }
}
