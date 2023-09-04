import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'salchrg.g.dart'; // *.g.dart : in same directory

// 영업 담당 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 2)
class SalChrgModel {
  @HiveField(0)
  String salChrgCd; // 영업담당 코드:DA104T0
  @HiveField(1)
  String salChrgNm; // 영업담당 명
  @HiveField(2)
  String mgmtChrgrYn; // 관리 담당자 여부:ABS021-예/아니오

  SalChrgModel(this.salChrgCd, this.salChrgNm, this.mgmtChrgrYn);

  Map<String, dynamic> toMap() {
    return {'salChrgCd': salChrgCd, 'salChrgNm': salChrgNm, 'mgmtChrgrYn': mgmtChrgrYn};
  }

  factory SalChrgModel.fromJson(Map<String, dynamic> json) => _$SalChrgModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalChrgModelToJson(this);

  String get getSalChrgCd => salChrgCd;

  set setSalChrgCd(String value) {
    salChrgCd = value;
  }

  String get getSalChrgNm => salChrgNm;

  set setSalChrgNm(String value) {
    salChrgNm = value;
  }

  String get getMgmtChrgrYn => mgmtChrgrYn;

  set setMgmtChrgrYn(String value) {
    mgmtChrgrYn = value;
  }
}
