import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage.g.dart'; // *.g.dart : in same directory

// 영업 담당 Model
@JsonSerializable(explicitToJson: true)

class ManageModel {
  @HiveField(0)
  String? manageCode; // 영업담당 코드:DA104T0
  @HiveField(1)
  String? manageName; // 영업담당 명

  ManageModel(this.manageCode, this.manageName);

  Map<String, dynamic> toMap() {
    return {'Manage-code': manageCode, 'Manage-name': manageName};
  }

  factory ManageModel.fromJson(Map<String, dynamic> json) => _$ManageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageModelToJson(this);

  String? get getManageCode => manageCode;

  set setManageCode(String value) {
    manageCode = value;
  }

  String? get getManageName => manageName;

  set setManageName(String value) {
    manageName = value;
  }
}
