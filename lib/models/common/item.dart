import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart'; // *.g.dart : in same directory

// 품목 검색 Model
@JsonSerializable(explicitToJson: true)
class ItemModel {
  var code; // 품목코드:DA121T0
  var name; // 품목명
  var nickName; // 품목 별칭
  var standard; // 규격/용량
  var useType; // 용도
  var useTypeName; // 용도명
  var unit; // 단위
  var unitName; // 단위명

  ItemModel(this.code, this.name, this.nickName, this.standard, this.useType, this.useTypeName, this.unit, this.unitName);


  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'nick-name': nickName,
      'standard': standard,
      'use-type': useType,
      'use-type-name': useTypeName,
      'unit': unit,
      'unit-name': unitName
    };
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

}
