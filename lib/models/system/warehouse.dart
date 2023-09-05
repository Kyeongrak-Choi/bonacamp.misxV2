import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouse.g.dart'; // *.g.dart : in same directory

// 창고 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 5)
class WarehouseModel {
  @HiveField(0)
  String whCd; // 창고 코드
  @HiveField(1)
  String whNm; // 창고 명

  WarehouseModel(this.whCd, this.whNm);

  Map<String, dynamic> toMap() {
    return {'whCd': whNm, 'whNm': whNm};
  }

  factory WarehouseModel.fromJson(Map<String, dynamic> json) => _$WarehouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseModelToJson(this);

  String get getWhCd => whCd;

  set setWhCd(String value) {
    whCd = value;
  }

  String get getWhNm => whNm;

  set setWhNm(String value) {
    whNm = value;
  }
}
