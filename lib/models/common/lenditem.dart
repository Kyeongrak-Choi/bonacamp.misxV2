import 'package:json_annotation/json_annotation.dart';

part 'lenditem.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class LendItemModel {
  String? lendItmCd;
  String? lendItmNm;
  String? stnd;
  String? ut;
  String? utNm;
  String? vesFg;
  String? vesFgNm;
  String? emptyBotlCd;
  String? emptyBotlNm;

  LendItemModel(
      this.lendItmCd, this.lendItmNm, this.stnd, this.ut, this.utNm, this.vesFg, this.vesFgNm, this.emptyBotlCd, this.emptyBotlNm);

  Map<String, dynamic> toMap() {
    return {
      'lendItmCd': lendItmCd,
      'lendItmNm': lendItmNm,
      'stnd': stnd,
      'ut': ut,
      'utNm': utNm,
      'vesFg': vesFg,
      'vesFgNm': vesFgNm,
      'emptyBotlCd': emptyBotlCd,
      'emptyBotlNm': emptyBotlNm
    };
  }

  factory LendItemModel.fromJson(Map<String, dynamic> json) => _$LendItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LendItemModelToJson(this);

  String? get getLendItmCd => lendItmCd;

  set setLendItmCd(String value) {
    lendItmCd = value;
  }

  String? get getLendItmNm => lendItmNm;

  set setLendItmNm(String value) {
    lendItmNm = value;
  }

  String? get getstnd => stnd;

  set setStnd(String value) {
    stnd = value;
  }

  String? get getUt => ut;

  set setUt(String value) {
    ut = value;
  }

  String? get getUtNm => utNm;

  set setUtNm(String value) {
    utNm = value;
  }

  String? get getVesFg => vesFg;

  set setVesFg(String value) {
    vesFg = value;
  }

  String? get getVesFgNm => vesFgNm;

  set setVesFgNm(String value) {
    vesFgNm = value;
  }

  String? get getEmptyBotlCd => emptyBotlCd;

  set setEmptyBotlCd(String value) {
    emptyBotlCd = value;
  }

  String? get getEmptyBotlNm => emptyBotlNm;

  set setEmptyBotlNm(String value) {
    emptyBotlNm = value;
  }
}
