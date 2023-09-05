import 'package:json_annotation/json_annotation.dart';

part 'lenditem.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class LendItemModel {
  String LEND_ITM_CD;
  String LEND_ITM_NM;
  String STND;
  String UT;
  String UT_NM;
  String VES_FG;
  String VES_FG_NM;
  String EMPTY_BOTL_CD;
  String EMPTY_BOTL_NM;

  LendItemModel(this.LEND_ITM_CD, this.LEND_ITM_NM, this.STND, this.UT, this.UT_NM, this.VES_FG, this.VES_FG_NM, this.EMPTY_BOTL_CD, this.EMPTY_BOTL_NM);

  Map<String, dynamic> toMap() {
    return {
      'LEND_ITM_CD': LEND_ITM_CD,
      'LEND_ITM_NM': LEND_ITM_NM,
      'STND': STND,
      'UT': UT,
      'UT_NM': UT_NM,
      'VES_FG': VES_FG,
      'VES_FG_NM': VES_FG_NM,
      'EMPTY_BOTL_CD': EMPTY_BOTL_CD,
      'EMPTY_BOTL_NM': EMPTY_BOTL_NM
    };
  }

  factory LendItemModel.fromJson(Map<String, dynamic> json) => _$LendItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LendItemModelToJson(this);

  String get getLendItmCd => LEND_ITM_CD;

  set setLendItmCd(String value) {
    LEND_ITM_CD = value;
  }

  String get getLendItmNm => LEND_ITM_NM;

  set setLendItmNm(String value) {
    LEND_ITM_NM = value;
  }

  String get getstnd => STND;

  set setStnd(String value) {
    STND = value;
  }

  String get getUt => UT;

  set setUt(String value) {
    UT = value;
  }

  String get getUtNm => UT_NM;

  set setUtNm(String value) {
    UT_NM = value;
  }

  String get getVesFg => VES_FG;

  set setVesFg(String value) {
    VES_FG = value;
  }

  String get getVesFgNm => VES_FG_NM;

  set setVesFgNm(String value) {
    VES_FG_NM = value;
  }

  String get getEmptyBotlCd => EMPTY_BOTL_CD;

  set setEmptyBotlCd(String value) {
    EMPTY_BOTL_CD = value;
  }

  String get getEmptyBotlNm => EMPTY_BOTL_NM;

  set setEmptyBotlNm(String value) {
    EMPTY_BOTL_NM = value;
  }

}