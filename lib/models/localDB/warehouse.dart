import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouse.g.dart'; // *.g.dart : in same directory

// 창고 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 5)
class WarehouseModel {
  @HiveField(0)
  String WH_CD; // 창고 코드
  @HiveField(1)
  String WH_NM; // 창고 명

  WarehouseModel(this.WH_CD, this.WH_NM);

  Map<String, dynamic> toMap() {
    return {'WH_CD': WH_CD, 'WH_NM': WH_NM};
  }

  factory WarehouseModel.fromJson(Map<String, dynamic> json) => _$WarehouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseModelToJson(this);

  String get getWhCd => WH_CD;

  set setWhCd(String value) {
    WH_CD = value;
  }

  String get getWhNm => WH_NM;

  set setWhNm(String value) {
    WH_NM = value;
  }
}
