import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouse.g.dart'; // *.g.dart : in same directory

// 창고 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 5)
class WarehouseModel {
  @HiveField(0)
  String? warehouseCode; // 창고 코드
  @HiveField(1)
  String? warehouseName; // 창고 명

  WarehouseModel(this.warehouseCode, this.warehouseName);

  Map<String, dynamic> toMap() {
    return {'warehouse-code': warehouseCode, 'warehouse-name': warehouseName};
  }

  factory WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseModelToJson(this);

  String? get getWarehouseCode => warehouseCode;

  set setWarehouseCode(String value) {
    warehouseCode = value;
  }

  String? get getWarehouseName => warehouseName;

  set setWarehouseName(String value) {
    warehouseName = value;
  }
}
