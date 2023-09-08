import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'salchrg.g.dart'; // *.g.dart : in same directory

// 영업 담당 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 2)
class SalChrgModel {
  @HiveField(0)
  String employeeCode; // 영업담당 코드:DA104T0
  @HiveField(1)
  String employeeName; // 영업담당 명
  @HiveField(2)
  bool manager; // 관리 담당자 여부:ABS021-예/아니오

  SalChrgModel(this.employeeCode, this.employeeName, this.manager);

  Map<String, dynamic> toMap() {
    return {'employeeCode': employeeCode, 'employeeName': employeeName, 'manager': manager};
  }

  factory SalChrgModel.fromJson(Map<String, dynamic> json) => _$SalChrgModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalChrgModelToJson(this);

  String get getEmployeeCode => employeeCode;

  set setEmployeeCode(String value) {
    employeeCode = value;
  }

  String get getEmployeeName => employeeName;

  set setEmployeeName(String value) {
    employeeName = value;
  }

  bool get getManager => manager;

  set setManager(bool value) {
    manager = value;
  }
}
