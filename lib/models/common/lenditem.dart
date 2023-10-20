import 'package:json_annotation/json_annotation.dart';

part 'lenditem.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class LendItemModel {
  var code; // 용공코드
  var name; // 용공명
  var standard; // 규격/용량
  var unit; // 단위
  var unitName; // 단위명
  var caseCode; // 용기구분
  var caseName; // 용기구분명
  var bottleCode; // 공병코드
  var bottleName; // 공병명

  LendItemModel(this.code, this.name, this.standard, this.unit, this.unitName, this.caseCode, this.caseName, this.bottleCode, this.bottleName);

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'standard': standard,
      'unit': unit,
      'unit-name': unitName,
      'case-code': caseCode,
      'case-name': caseName,
      'bottle-code': bottleCode,
      'bottle-name': bottleName,
    };
  }

  factory LendItemModel.fromJson(Map<String, dynamic> json) => _$LendItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LendItemModelToJson(this);
}
